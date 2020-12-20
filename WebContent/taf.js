
(function() {
    // https://ww8.fltplan.com/AreaForecast/abbreviations.htm
    // http://en.wikipedia.org/wiki/TAF

    var re = /(R\d{2})([L|R|C])?(\/)([P|M])?(\d+)(?:([V])([P|M])?(\d+))?([N|U|D])?(FT)?/g;

    var TYPES = ["TAF", "SPECI"];

    var CLOUDS = {
        NCD: "no clouds",
        SKC: "sky clear",
        CLR: "no clouds under 12,000 ft",
        NSC: "no significant",
        FEW: "few",
        SCT: "scattered",
        BKN: "broken",
        OVC: "overcast",
        VV: "vertical visibility",
    };

    var WEATHER = {
        // Intensity
        "-": "light intensity",
        "+": "heavy intensity",
        VC: "in the vicinity",

        // Descriptor
        MI: "shallow",
        PR: "partial",
        BC: "patches",
        DR: "low drifting",
        BL: "blowing",
        SH: "showers",
        TS: "thunderstorm",
        FZ: "freezing",

        // Precipitation
        RA: "rain",
        DZ: "drizzle",
        SN: "snow",
        SG: "snow grains",
        IC: "ice crystals",
        PL: "ice pellets",
        GR: "hail",
        GS: "small hail",
        UP: "unknown precipitation",

        // Obscuration
        FG: "fog",
        VA: "volcanic ash",
        BR: "mist",
        HZ: "haze",
        DU: "widespread dust",
        FU: "smoke",
        SA: "sand",
        PY: "spray",

        // Other
        SQ: "squall",
        PO: "dust or sand whirls",
        DS: "duststorm",
        SS: "sandstorm",
        FC: "funnel cloud",
    };

    var RECENT_WEATHER = {
        REBLSN: "Moderate/heavy blowing snow (visibility significantly reduced)reduced",
        REDS: "Dust Storm",
        REFC: "Funnel Cloud",
        REFZDZ: "Freezing Drizzle",
        REFZRA: "Freezing Rain",
        REGP: "Moderate/heavy snow pellets",
        REGR: "Moderate/heavy hail",
        REGS: "Moderate/heavy small hail",
        REIC: "Moderate/heavy ice crystals",
        REPL: "Moderate/heavy ice pellets",
        RERA: "Moderate/heavy rain",
        RESG: "Moderate/heavy snow grains",
        RESHGR: "Moderate/heavy hail showers",
        RESHGS: "Moderate/heavy small hail showers",
        // RESHGS: "Moderate/heavy snow pellet showers", // dual meaning?
        RESHPL: "Moderate/heavy ice pellet showers",
        RESHRA: "Moderate/heavy rain showers",
        RESHSN: "Moderate/heavy snow showers",
        RESN: "Moderate/heavy snow",
        RESS: "Sandstorm",
        RETS: "Thunderstorm",
        REUP: "Unidentified precipitation (AUTO obs. only)",
        REVA: "Volcanic Ash",
    };

    function parseAbbreviation(s, map) {
        var abbreviation, meaning, length = 3;
        if (!s) return;
        while (length && !meaning) {
            abbreviation = s.slice(0, length);
            meaning = map[abbreviation];
            length--;
        }
        if (meaning) {
            return {
                abbreviation: abbreviation,
                meaning: meaning,
            };
        }
    }

    function asInt(s) {
        return parseInt(s, 10);
    }

    function TAF(tafString) {
        this.fields = tafString
            .split(" ")
            .map(function(f) {
                return f.trim();
            })
            .filter(function(f) {
                return !!f;
            });
        this.i = -1;
        this.current = null;
        this.result = {};
    }

    TAF.prototype.next = function() {
        this.i++;
        return (this.current = this.fields[this.i]);
    };

    TAF.prototype.peek = function() {
        return this.fields[this.i + 1];
    };

    TAF.prototype.parseType = function() {
        var token = this.peek();

        if (TYPES.indexOf(token) !== -1) {
            this.next();
            this.result.type = this.current;
        } else {
            this.result.type = "TAF";
        }
    };

    TAF.prototype.parseStation = function() {
        this.next();
        this.result.station = this.current;
    };

    TAF.prototype.parseDate = function() {
        this.next();
        var d = new Date();
        d.setUTCDate(asInt(this.current.slice(0, 2)));
        d.setUTCHours(asInt(this.current.slice(2, 4)));
        d.setUTCMinutes(asInt(this.current.slice(4, 6)));
        d.setUTCSeconds(0);
        d.setUTCMilliseconds(0);
        this.result.time = d;
    };

    TAF.prototype.parseValid = function() {
        this.next();
        var now = new Date();
        var validFrom = new Date();
        
        validFrom.setUTCDate(asInt(this.current.slice(0, 2)));
        if (asInt(this.current.slice(0, 2)) < now.getUTCDate()) {
            // e.g. validFrom DD is 01(st Feb), current report DD is 31(st Jan)
            // correction is done for the actual validFrom MM
            validFrom.setUTCMonth(validFrom.getUTCMonth() + 1);
        }
        validFrom.setUTCHours(asInt(this.current.slice(2, 4)));
        validFrom.setUTCMinutes(0);
        validFrom.setUTCSeconds(0);
        validFrom.setUTCMilliseconds(0);
        this.result.validFrom = validFrom.toISOString();

        var validTo = new Date();
        validTo.setUTCDate(asInt(this.current.slice(5, 7)));
        if (asInt(this.current.slice(5, 7)) < now.getUTCDate()) {
            // e.g. validTo DD is 01(st Feb), current report DD is 31(st Jan)
            // correction is done for the actual validTo MM
            validTo.setUTCMonth(validTo.getUTCMonth() + 1);
        }
        validTo.setUTCHours(asInt(this.current.slice(7, 9)));
        validTo.setUTCMinutes(0);
        validTo.setUTCSeconds(0);
        validTo.setUTCMilliseconds(0);

        this.result.validTo = validTo.toISOString();

    }

    TAF.prototype.parseAuto = function() {
        this.result.auto = this.peek() === "AUTO";
        if (this.result.auto) this.next();
    };

    TAF.prototype.parseCorrection = function() {
        if (this.result.correction) {
            return;
        }

        var token = this.peek();
        this.result.correction = false;

        if (token.lastIndexOf("COR", 0) == 0) {
            this.result.correction = true;
            this.next();
        }
    };

    TAF.prototype.parseAmendment = function() {
        if (this.result.amendment) {
            return;
        }

        var token = this.peek();

        this.result.amendment = false;
        
        if (token.lastIndexOf("AMD", 0) == 0) {
            this.result.amendment = true;
            this.next();
        }
    };

    var variableWind = /^([0-9]{3})V([0-9]{3})$/;
    TAF.prototype.parseWind = function() {
        this.result.wind = {
            speed: null,
            gust: null,
            direction: null,
            variation: null,
        };

        if (this.peek().match(/^[0-9]{1,4}(SM?)/)) {
            return;
        }
        this.next();

        var direction = this.current.slice(0, 3);
        if (direction === "VRB") {
            //this.result.wind.direction = "VRB";
            this.result.wind.variation = true;
            this.result.wind.direction = 0;
        } else {
            this.result.wind.direction = asInt(direction);
        }

        var gust = this.current.slice(5, 8);
        if (gust[0] === "G") {
            this.result.wind.gust = asInt(gust.slice(1));
        }

        this.result.wind.speed = asInt(this.current.slice(3, 5));

        var unitMatch;
        if ((unitMatch = this.current.match(/KT|MPS|KPH|SM$/))) {
            this.result.wind.unit = unitMatch[0];
        } else {
            throw new Error("Bad wind unit: " + this.current);
        }

        var varMatch;
        if ((varMatch = this.peek().match(variableWind))) {
            this.next();
            this.result.wind.variation = {
                min: asInt(varMatch[1]),
                max: asInt(varMatch[2]),
            };
        }
    };

    TAF.prototype.parseVisibility = function() {
        var re = /^([0-9]+)([A-Z]{1,2})/g;
        this.result.visibility = null;
        this.result.visibilityVariation = null;
        this.result.visibilityVariationDirection = null;

        this.result.visibility = null;
        this.next();
        if (this.current === "////") return;
        this.result.visibility = asInt(this.current.slice(0, 4));

        // Look for a directional variation report
        if (this.peek().match(/^[0-9]+[N|E|S|W|NW|NE|SW|SE]/)) {
            this.next();

            var matches;
            while ((matches = re.exec(this.current)) != null) {
                if (matches.index === re.lastIndex) {
                    re.lastIndex++;
                }

                this.result.visibilityVariation = matches[1];
                this.result.visibilityVariationDirection = matches[2];
            }
        }
    };

    function parseWeatherAbbrv(s, res) {
        var weather = parseAbbreviation(s, WEATHER);
        if (weather) {
            res = res || [];
            res.push(weather);
            return parseWeatherAbbrv(s.slice(weather.abbreviation.length), res);
        }
        return res;
    }

    TAF.prototype.parseWeather = function() {
        if (this.result.weather === undefined) this.result.weather = null;

        var weather = parseWeatherAbbrv(this.peek());

        if (!weather) return;
        if (!this.result.weather) this.result.weather = [];

        this.result.weather = this.result.weather.concat(weather);
        this.next();
        this.parseWeather();
    };

    TAF.prototype.parseClouds = function() {
        if (!this.result.clouds) this.result.clouds = null;
        var cloud = parseAbbreviation(this.peek(), CLOUDS);
        if (!cloud) return;

        this.next();

        cloud.altitude = asInt(this.current.slice(cloud.abbreviation.length)) *
            100 || null;
        cloud.cumulonimbus = /CB$/.test(this.current);

        this.result.clouds = this.result.clouds || [];
        this.result.clouds.push(cloud);

        this.parseClouds();
    };

    TAF.prototype.parseRecentSignificantWeather = function() {
        this.next();

        if (this.current === undefined || this.current === null) return;

        if (RECENT_WEATHER[this.current]) {
            this.result.recentSignificantWeather = this.current;
            this.result.recentSignificantWeatherDescription = RECENT_WEATHER[
                this.current
            ];
        }
    };

    TAF.prototype.parseTemporaryWeather = function() {
        this.next();
        if (this.current === undefined || this.current === null) return;

        var probEx = /PROB\d{2}/g;

        if (this.current !== "TEMPO" && !this.current.match(probEx)) 
        {
            return;
        }

        var tempObj = {};
        if (!this.result.tempo) {
            this.result.tempo = [];
        }

        if (this.current.match(probEx) && this.peek() === "TEMPO") {
            tempObj["probability"] = asInt(this.current.slice(4));
            this.next();
        }
      
        this.next();

        var now = new Date();
        var validFrom = new Date();
        validFrom.setUTCDate(asInt(this.current.slice(0, 2)));
        if (asInt(this.current.slice(0, 2)) < now.getUTCDate()) {
            // for temporary report
            // e.g. validFrom DD is 01(st Feb), current report DD is 31(st Jan)
            // correction is done for the actual validFrom MM
            validFrom.setUTCMonth(validFrom.getUTCMonth() + 1);
        }
        validFrom.setUTCHours(asInt(this.current.slice(2, 4)));
        validFrom.setUTCMinutes(0);
        validFrom.setUTCSeconds(0);
        validFrom.setUTCMilliseconds(0);
        tempObj["validFrom"] = validFrom.toISOString();
        
        var validTo = new Date();
        validTo.setUTCDate(asInt(this.current.slice(5, 7)));
        if (asInt(this.current.slice(5, 7)) < now.getUTCDate()) {
            // for temporary report
            // e.g. validTo DD is 02(nd Feb), current report DD is 31(st Jan)
            // correction is done for the actual validTo MM
            validTo.setUTCMonth(validTo.getUTCMonth() + 1);
        }
        validTo.setUTCHours(asInt(this.current.slice(7, 9)));
        validTo.setUTCMinutes(0);
        validTo.setUTCSeconds(0);
        validTo.setUTCMilliseconds(0);
        tempObj["validTo"] = validTo.toISOString();

        this.next();

        parseTempWind(this, tempObj);

        // parse temporary visibility
        var visEx = /^\d{4}$/;
        if (this.current.match(visEx)) {
            tempObj["visibility"] = asInt(this.current);
            this.next();
        }

        parseTempWeatherConditions(this, tempObj);
        parseTempClouds(this, tempObj);

        this.result.tempo.push(tempObj);

        this.parseTemporaryWeather();

    };

    function parseTempWind(ref, tempObj) {
        tempObj.wind = {
            speed: null,
            gust: null,
            direction: null,
            variation: null,
        };

        var windExp = /^(([0-9]{3})|(VRB))([0-9]{2})(G[0-9]{2})?(KT|MPS|KPH|SM)/;

        if (!(ref.current.match(windExp))) {
            return;
        }

        var direction = ref.current.slice(0, 3);
        if (direction === "VRB") {
            //this.result.wind.direction = "VRB";
            this.result.wind.variation = true;
            tempObj.wind.direction = 0;
        } else {
            tempObj.wind.direction = asInt(direction);
        }

        var gust = ref.current.slice(5, 8);
        if (gust[0] === "G") {
            tempObj.wind.gust = asInt(gust.slice(1));
        }

        tempObj.wind.speed = asInt(ref.current.slice(3, 5));

        var unitMatch;
        if ((unitMatch = ref.current.match(/KT|MPS|KPH|SM$/))) {
            tempObj.wind.unit = unitMatch[0];
        } else {
            throw new Error("Bad wind unit: " + ref.current);
        }

        var varMatch;
        if ((varMatch = ref.peek().match(variableWind))) {
            ref.next();
            tempObj.wind.variation = {
                min: asInt(varMatch[1]),
                max: asInt(varMatch[2]),
            };
        }
        ref.next();
    }

    function parseTempWeatherConditions(ref, tempObj) {
        if (tempObj.weather === undefined) tempObj.weather = null;

        var weather = parseWeatherAbbrv(ref.current);
        if (!weather) return;
        if (!tempObj.weather) tempObj.weather = [];

        tempObj.weather = tempObj.weather.concat(weather);
        ref.next();
    }

    function parseTempClouds(ref, tempObj) {
        if (tempObj.clouds === undefined) tempObj.clouds = null;

        var cloud = parseAbbreviation(ref.peek(), CLOUDS);
        if (!cloud) return;

        ref.next();
        cloud.altitude = asInt(ref.current.slice(cloud.abbreviation.length)) * 100 || null;
        cloud.cumulonimbus = /CB$/.test(ref.current);

        tempObj.clouds = tempObj.clouds || [];
        tempObj.clouds.push(cloud);

        parseTempClouds(ref, tempObj);
    }

    TAF.prototype.parse = function() {
        this.parseType();
        this.parseCorrection();
        this.parseAmendment();
        this.parseStation();
        this.parseDate();
        this.parseValid();
        this.parseWind();
        this.parseVisibility();
        this.parseWeather();
        this.parseClouds();
        this.parseTemporaryWeather();
    };

    function parseTAF(tafString) {
        var m = new TAF(tafString);
        m.parse();
        return m.result;
    }

    if (typeof module !== "undefined") {
        module.exports = parseTAF;
    } else if (typeof window !== "undefined") {
        window.parseTAF = parseTAF;
    }
})();


