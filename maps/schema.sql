--
-- PostgreSQL database dump
--

-- Dumped from database version 11.13 (Ubuntu 11.13-1.pgdg18.04+1)
-- Dumped by pg_dump version 11.13 (Ubuntu 11.13-1.pgdg18.04+1)

-- Started on 2021-08-14 14:56:33 EDT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4531 (class 1262 OID 16393)
-- Name: uat978; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE uat978 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


\connect uat978

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4532 (class 0 OID 0)
-- Dependencies: 4531
-- Name: uat978; Type: DATABASE PROPERTIES; Schema: -; Owner: -
--

ALTER DATABASE uat978 SET search_path TO 'public', 'postgis', 'contrib';
ALTER DATABASE uat978 SET "postgis.gdal_enabled_drivers" TO 'ENABLE_ALL';
ALTER DATABASE uat978 SET "public.gdal_enabled_drivers" TO 'ENABLE_ALL';


\connect uat978

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 19 (class 2615 OID 16394)
-- Name: postgis; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA postgis;


SET default_with_oids = false;

--
-- TOC entry 224 (class 1259 OID 17416)
-- Name: airspace_ob_ele; Type: TABLE; Schema: postgis; Owner: -
--

CREATE TABLE postgis.airspace_ob_ele (
    airspace_ob_ele_id integer NOT NULL,
    airspace_ob_ele_desc text NOT NULL
);


--
-- TOC entry 229 (class 1259 OID 17495)
-- Name: circles; Type: TABLE; Schema: postgis; Owner: -
--

CREATE TABLE postgis.circles (
    alt_top integer,
    alt_bot integer,
    alpha integer,
    prod_id integer NOT NULL,
    rec_count integer NOT NULL,
    rep_num integer NOT NULL,
    rep_year integer,
    start_date character varying,
    stop_date character varying,
    geo_opt integer NOT NULL,
    r_lng integer,
    r_lat integer,
    bot public.geometry NOT NULL,
    top public.geometry NOT NULL
);


--
-- TOC entry 262 (class 1259 OID 187543)
-- Name: current; Type: TABLE; Schema: postgis; Owner: -
--

CREATE TABLE postgis.current (
    prod_id integer NOT NULL,
    rep_time character varying NOT NULL,
    rep_year integer,
    text integer,
    graphic integer,
    rep_num integer NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 17422)
-- Name: fisb_products; Type: TABLE; Schema: postgis; Owner: -
--

CREATE TABLE postgis.fisb_products (
    fisb_product_id integer NOT NULL,
    fisb_product_desc text NOT NULL
);


--
-- TOC entry 247 (class 1259 OID 21049)
-- Name: graphics; Type: TABLE; Schema: postgis; Owner: -
--

CREATE TABLE postgis.graphics (
    coords public.geometry,
    alt integer NOT NULL,
    ob_ele character varying,
    rep_num integer NOT NULL,
    prod_id integer NOT NULL,
    start_date character varying,
    stop_date character varying,
    geo_overlay_opt integer NOT NULL,
    stn_call character varying,
    obj_par_val integer,
    obj_param_type integer,
    object_qualifier integer,
    obj_labelt character varying,
    obj_label integer,
    overlay_rec_id integer,
    rec_len integer,
    obj_status integer,
    param_flag integer,
    element_flag integer,
    overlay_op integer,
    overlay_vert_cnt integer,
    segmented integer
);


--
-- TOC entry 226 (class 1259 OID 17434)
-- Name: metar; Type: TABLE; Schema: postgis; Owner: -
--

CREATE TABLE postgis.metar (
    stn_call character varying NOT NULL,
    ob_date character varying NOT NULL,
    winddir character varying,
    temp character varying,
    dewp character varying,
    visby character varying,
    windsp character varying,
    altimeter character varying,
    hrly_precip character varying,
    slp character varying,
    windvar character varying,
    windgust character varying
);


--
-- TOC entry 261 (class 1259 OID 119355)
-- Name: nexrad; Type: TABLE; Schema: postgis; Owner: -
--

CREATE TABLE postgis.nexrad (
    intensity integer NOT NULL,
    coords public.geometry NOT NULL,
    altitude integer NOT NULL,
    prod_id integer NOT NULL,
    block_num integer NOT NULL,
    maptime character varying NOT NULL,
    ice_sld integer,
    ice_prob integer,
    seq integer
);


--
-- TOC entry 227 (class 1259 OID 17454)
-- Name: overlay_geo_opt; Type: TABLE; Schema: postgis; Owner: -
--

CREATE TABLE postgis.overlay_geo_opt (
    overlay_geo_opt_id integer NOT NULL,
    overlay_geo_opt_desc text NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 17460)
-- Name: pirep; Type: TABLE; Schema: postgis; Owner: -
--

CREATE TABLE postgis.pirep (
    rep_type character varying NOT NULL,
    fl_lev character varying,
    ac_type character varying,
    cloud character varying,
    weather character varying,
    temperature character varying,
    wind_spd_dir character varying,
    turbulence character varying,
    icing character varying,
    remarks character varying,
    location character varying,
    rep_time character varying NOT NULL,
    stn_call character varying NOT NULL
);


--
-- TOC entry 246 (class 1259 OID 21038)
-- Name: sigairmet; Type: TABLE; Schema: postgis; Owner: -
--

CREATE TABLE postgis.sigairmet (
    prod_id integer NOT NULL,
    rep_num integer NOT NULL,
    text_data character varying,
    stn_call character varying NOT NULL,
    rep_time character varying,
    segmented integer,
    notam_name character varying
);


--
-- TOC entry 259 (class 1259 OID 71663)
-- Name: stations; Type: TABLE; Schema: postgis; Owner: -
--

CREATE TABLE postgis.stations (
    coords public.geometry NOT NULL,
    stn_call character varying NOT NULL,
    stn_loc character varying NOT NULL,
    state character varying NOT NULL
);


--
-- TOC entry 254 (class 1259 OID 29657)
-- Name: sua; Type: TABLE; Schema: postgis; Owner: -
--

CREATE TABLE postgis.sua (
    rep_time character varying NOT NULL,
    rep_year integer NOT NULL,
    rep_num integer NOT NULL,
    sched_id integer,
    airsp_id integer,
    sched_status character varying NOT NULL,
    airsp_name character varying,
    start_time character varying NOT NULL,
    end_time character varying NOT NULL,
    high_alt integer,
    sep_rule character varying,
    shape_ind character varying,
    nfdc_id character varying,
    nfdc_name character varying,
    dafif_id character varying,
    dafif_name character varying,
    airsp_type character varying,
    low_alt integer
);


--
-- TOC entry 256 (class 1259 OID 51032)
-- Name: sua_airspace; Type: TABLE; Schema: postgis; Owner: -
--

CREATE TABLE postgis.sua_airspace (
    coords public.geometry NOT NULL,
    airsp_id integer NOT NULL,
    airsp_name character varying NOT NULL
);


--
-- TOC entry 258 (class 1259 OID 51782)
-- Name: sua_airspace_type; Type: TABLE; Schema: postgis; Owner: -
--

CREATE TABLE postgis.sua_airspace_type (
    sua_airsp_type "char" NOT NULL,
    sua_airsp_desc character varying NOT NULL
);


--
-- TOC entry 257 (class 1259 OID 51777)
-- Name: sua_sched_status; Type: TABLE; Schema: postgis; Owner: -
--

CREATE TABLE postgis.sua_sched_status (
    sua_status "char" NOT NULL,
    sua_status_desc character varying NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 17504)
-- Name: taf; Type: TABLE; Schema: postgis; Owner: -
--

CREATE TABLE postgis.taf (
    issued character varying NOT NULL,
    current character varying,
    wind character varying,
    visby character varying,
    condx character varying,
    rep_time character varying NOT NULL,
    stn_call character varying NOT NULL,
    taf_unknown_fl integer NOT NULL,
    taf_raw character varying
);


--
-- TOC entry 260 (class 1259 OID 111785)
-- Name: taf_forecast; Type: TABLE; Schema: postgis; Owner: -
--

CREATE TABLE postgis.taf_forecast (
    stn_call character varying NOT NULL,
    rep_time character varying NOT NULL,
    forecast character varying,
    taf_unknown_fl integer,
    taf_line_number integer NOT NULL,
    taf_raw character varying
);


--
-- TOC entry 255 (class 1259 OID 50311)
-- Name: winds; Type: TABLE; Schema: postgis; Owner: -
--

CREATE TABLE postgis.winds (
    issue_date character varying NOT NULL,
    proc_time character varying NOT NULL,
    alt1 character varying,
    alt2 character varying,
    alt3 character varying,
    alt4 character varying,
    alt5 character varying,
    alt6 character varying,
    alt7 character varying,
    alt8 character varying,
    alt9 character varying,
    dir1 character varying,
    dir2 character varying,
    dir3 character varying,
    dir4 character varying,
    dir5 character varying,
    dir6 character varying,
    dir7 character varying,
    dir8 character varying,
    dir9 character varying,
    spd1 character varying,
    spd2 character varying,
    spd3 character varying,
    spd4 character varying,
    spd5 character varying,
    spd6 character varying,
    spd7 character varying,
    spd8 character varying,
    spd9 character varying,
    temp1 character varying,
    temp2 character varying,
    temp3 character varying,
    temp4 character varying,
    temp5 character varying,
    temp6 character varying,
    temp7 character varying,
    temp8 character varying,
    temp9 character varying,
    stn_call character varying NOT NULL
);


--
-- TOC entry 4508 (class 0 OID 17416)
-- Dependencies: 224
-- Data for Name: airspace_ob_ele; Type: TABLE DATA; Schema: postgis; Owner: -
--

INSERT INTO postgis.airspace_ob_ele VALUES (0, 'Temporary Flight Restriction');
INSERT INTO postgis.airspace_ob_ele VALUES (1, 'Turbulence');
INSERT INTO postgis.airspace_ob_ele VALUES (2, 'Low Level Wind Shear');
INSERT INTO postgis.airspace_ob_ele VALUES (3, 'Surface Winds');
INSERT INTO postgis.airspace_ob_ele VALUES (4, 'Icing');
INSERT INTO postgis.airspace_ob_ele VALUES (5, 'Freezing Level');
INSERT INTO postgis.airspace_ob_ele VALUES (6, 'IFR Conditions');
INSERT INTO postgis.airspace_ob_ele VALUES (7, 'Mountain Obscuration');
INSERT INTO postgis.airspace_ob_ele VALUES (8, 'Future Use (8)');
INSERT INTO postgis.airspace_ob_ele VALUES (9, 'Future Use(9)');
INSERT INTO postgis.airspace_ob_ele VALUES (10, 'Future Use(10)');
INSERT INTO postgis.airspace_ob_ele VALUES (11, 'Future Use(11)');
INSERT INTO postgis.airspace_ob_ele VALUES (12, 'Future Use(12)');
INSERT INTO postgis.airspace_ob_ele VALUES (13, 'Future Use(13)');
INSERT INTO postgis.airspace_ob_ele VALUES (14, 'Future Use(14)');
INSERT INTO postgis.airspace_ob_ele VALUES (15, 'Future Use(15)');
INSERT INTO postgis.airspace_ob_ele VALUES (16, 'Future Use(16)');
INSERT INTO postgis.airspace_ob_ele VALUES (17, 'Future Use(17)');
INSERT INTO postgis.airspace_ob_ele VALUES (18, 'Future Use(18)');
INSERT INTO postgis.airspace_ob_ele VALUES (19, 'Future Use(19)');
INSERT INTO postgis.airspace_ob_ele VALUES (20, 'Future Use(20)');
INSERT INTO postgis.airspace_ob_ele VALUES (21, 'Future Use(21)');
INSERT INTO postgis.airspace_ob_ele VALUES (22, 'Future Use(22)');
INSERT INTO postgis.airspace_ob_ele VALUES (23, 'Future Use(23)');
INSERT INTO postgis.airspace_ob_ele VALUES (24, 'Future Use(24)');
INSERT INTO postgis.airspace_ob_ele VALUES (25, 'Future Use(25)');
INSERT INTO postgis.airspace_ob_ele VALUES (26, 'Future Use(26)');
INSERT INTO postgis.airspace_ob_ele VALUES (27, 'Future Use(27)');
INSERT INTO postgis.airspace_ob_ele VALUES (28, 'Future Use(28)');
INSERT INTO postgis.airspace_ob_ele VALUES (29, 'Future Use(29)');
INSERT INTO postgis.airspace_ob_ele VALUES (30, 'Future Use(30)');
INSERT INTO postgis.airspace_ob_ele VALUES (31, 'Future Use(31)');


--
-- TOC entry 4513 (class 0 OID 17495)
-- Dependencies: 229
-- Data for Name: circles; Type: TABLE DATA; Schema: postgis; Owner: -
--



--
-- TOC entry 4525 (class 0 OID 187543)
-- Dependencies: 262
-- Data for Name: current; Type: TABLE DATA; Schema: postgis; Owner: -
--



--
-- TOC entry 4509 (class 0 OID 17422)
-- Dependencies: 225
-- Data for Name: fisb_products; Type: TABLE DATA; Schema: postgis; Owner: -
--

INSERT INTO postgis.fisb_products VALUES (8, 'NOTAM');
INSERT INTO postgis.fisb_products VALUES (11, 'AIRMET');
INSERT INTO postgis.fisb_products VALUES (12, 'SIGMET');
INSERT INTO postgis.fisb_products VALUES (13, 'SUA');
INSERT INTO postgis.fisb_products VALUES (14, 'G-AIRMET');
INSERT INTO postgis.fisb_products VALUES (15, 'CWA');
INSERT INTO postgis.fisb_products VALUES (63, 'Regional NEXRAD');
INSERT INTO postgis.fisb_products VALUES (64, 'CONUS NEXRAD');
INSERT INTO postgis.fisb_products VALUES (70, 'Icing Forecast - Low');
INSERT INTO postgis.fisb_products VALUES (71, 'Icing Forecast - High');
INSERT INTO postgis.fisb_products VALUES (84, 'Cloud Tops');
INSERT INTO postgis.fisb_products VALUES (90, 'Turbulence Forecast - Low');
INSERT INTO postgis.fisb_products VALUES (91, 'Turbulence Forecast - High');
INSERT INTO postgis.fisb_products VALUES (103, 'Lightning');
INSERT INTO postgis.fisb_products VALUES (413, 'Generic Textual Data Product');


--
-- TOC entry 4516 (class 0 OID 21049)
-- Dependencies: 247
-- Data for Name: graphics; Type: TABLE DATA; Schema: postgis; Owner: -
--



--
-- TOC entry 4510 (class 0 OID 17434)
-- Dependencies: 226
-- Data for Name: metar; Type: TABLE DATA; Schema: postgis; Owner: -
--



--
-- TOC entry 4524 (class 0 OID 119355)
-- Dependencies: 261
-- Data for Name: nexrad; Type: TABLE DATA; Schema: postgis; Owner: -
--



--
-- TOC entry 4511 (class 0 OID 17454)
-- Dependencies: 227
-- Data for Name: overlay_geo_opt; Type: TABLE DATA; Schema: postgis; Owner: -
--

INSERT INTO postgis.overlay_geo_opt VALUES (0, 'No Geometry');
INSERT INTO postgis.overlay_geo_opt VALUES (1, 'High Resolution 3D Polygon');
INSERT INTO postgis.overlay_geo_opt VALUES (2, 'Extended Range 3D Polygon (MSL)');
INSERT INTO postgis.overlay_geo_opt VALUES (3, 'Extended Range 3D Polygon (AGL)');
INSERT INTO postgis.overlay_geo_opt VALUES (4, 'Low Resolution 2D Ellipse');
INSERT INTO postgis.overlay_geo_opt VALUES (5, 'High Resolution 3D Ellipse');
INSERT INTO postgis.overlay_geo_opt VALUES (6, 'Extended Range Circular Prism (MSL)');
INSERT INTO postgis.overlay_geo_opt VALUES (7, 'Extended Range Circular Prism (AGL)');
INSERT INTO postgis.overlay_geo_opt VALUES (8, 'Extended Range 3D Point (AGL)');
INSERT INTO postgis.overlay_geo_opt VALUES (9, 'Extended Range 3D Point (MSL)');
INSERT INTO postgis.overlay_geo_opt VALUES (10, 'Extended Range 3D Polyline (MSL)');
INSERT INTO postgis.overlay_geo_opt VALUES (11, 'Extended Range 3D Polyline (AGL)');
INSERT INTO postgis.overlay_geo_opt VALUES (12, 'Future Use');
INSERT INTO postgis.overlay_geo_opt VALUES (13, 'Future Use');
INSERT INTO postgis.overlay_geo_opt VALUES (14, 'Future Use');


--
-- TOC entry 4512 (class 0 OID 17460)
-- Dependencies: 228
-- Data for Name: pirep; Type: TABLE DATA; Schema: postgis; Owner: -
--



--
-- TOC entry 4515 (class 0 OID 21038)
-- Dependencies: 246
-- Data for Name: sigairmet; Type: TABLE DATA; Schema: postgis; Owner: -
--



--
-- TOC entry 4522 (class 0 OID 71663)
-- Dependencies: 259
-- Data for Name: stations; Type: TABLE DATA; Schema: postgis; Owner: -
--

INSERT INTO postgis.stations VALUES ('0101000020E61000005704FF5BC96163C06284F068E3B83340', 'PHTO', 'Hilo, Hilo International Airport', 'HI');
INSERT INTO postgis.stations VALUES ('0101000020E61000008B4F01309E8163C04BE5ED08A7BD3340', 'PHKO', 'Kailua / Kona, Keahole Airport', 'HI');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A999999997163C0C6F99B5088C83340', 'PHSF', 'Bradshaw Army Air Field / Hawaii', 'HI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000BAF770C9719E63C0B70BCD751AC93440', 'PHNY', 'Lanai City, Lanai Airport', 'HI');
INSERT INTO postgis.stations VALUES ('0101000020E61000000E4A9869FB8D63C014AE47E17AE43440', 'PHOG', 'Kahului Airport', 'HI');
INSERT INTO postgis.stations VALUES ('0101000020E61000003333333333A363C06666666666263540', 'PHMK', 'Kaunakakai, Molokai Airport', 'HI');
INSERT INTO postgis.stations VALUES ('0101000020E61000004E452A8C2DC263C02D6002B7EE4E3540', 'PHJR', 'Oahu, Kalaeloa Airport', 'HI');
INSERT INTO postgis.stations VALUES ('0101000020E61000004E452A8C2DBE63C0A4703D0AD7533540', 'PHNL', 'Daniel K Inouye International Airport', 'HI');
INSERT INTO postgis.stations VALUES ('0101000020E61000000664AF777FB863C040FB912232743540', 'PHNG', 'Kaneohe, Marine Corps Air Station', 'HI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000397F130A11C163C0F92CCF83BB7B3540', 'PHHI', 'Wheeler Air Force Base / Oahu', 'HI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D5CA845FEAEA63C087DC0C37E0FB3540', 'PHLI', 'Lihue, Lihue Airport', 'HI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D97C5C1B2AF963C0C5E6E3DA50093640', 'PHBK', 'Kekaha, Pacific Missile Test Facility Barking Sands', 'HI');
INSERT INTO postgis.stations VALUES ('0101000020E61000006E6E4C4F587054C02D95B7239C8E3840', 'KEYW', 'Key West International Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E610000044DD0720B56B54C094BC3AC780943840', 'KNQX', 'Key West Naval Air Station', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E2E995B20C4354C09964E42CECB93840', 'KMTH', 'Marathon International Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C763062AE31754C0C971A774B07E3940', 'KHST', 'Homestead Air Reserve Base', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B2BAD573D21B54C087FE092E56A43940', 'KTMB', 'Miami, Kendall-Tamiami Executive Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E610000003B2D7BB3F1454C09886E12362CA3940', 'KMIA', 'Miami International Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E610000092B3B0A71D1254C0295C8FC2F5E83940', 'KOPF', 'Miami, Opa Locka Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000BB0F406A135B58C0FCFB8C0B07EA3940', 'KBRO', 'Brownsville / South Padre Island International Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000452FA3586E0F54C02B4D4A41B7FF3940', 'KHWO', 'Hollywood, North Perry Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E610000051DA1B7C610A54C015E3FC4D28143A40', 'KFLL', 'Fort Lauderdale/Hollywood International Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C2340C1F117154C06666666666263A40', 'KAPF', 'Naples, Naples Municipal Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A999999995558C01B81785DBF283A40', 'KPIL', 'Port Isabel, Port Isabel-Cameron County Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E610000087FE092E567E58C0D97745F0BF2D3A40', 'KTXW', 'Mid Valley Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000006475ABE7A48F58C0E76F4221022E3A40', 'KMFE', 'McAllen, Miller International Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBB0B54C03333333333333A40', 'KFXE', 'Fort Lauderdale Executive Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000446E861BF06958C0B43C0FEECE3A3A40', 'KHRL', 'Harlingen, Rio Grande Valley International Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000007EC68503210754C0AD342905DD3E3A40', 'KPMP', 'Pompano Beach Airpark', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E61000006DCA15DEE50654C045F0BF95EC603A40', 'KBCT', 'Boca Raton Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A999999995954C0AE47E17A146E3A40', 'KIMM', 'Immokalee', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D5B2B5BE488858C053CBD6FA22713A40', 'KEBG', 'Edinburg International Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D07EA4880C7154C049F4328AE5863A40', 'KRSW', 'Fort Myers, Southwest Florida International Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E610000033333333337754C0E84D452A8C953A40', 'KFMY', 'Fort Myers, Page Field', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C6850321590654C0567DAEB662AF3A40', 'KPBI', 'West Palm Beach - Palm Beach International Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E610000090882991444354C01500E31934BC3A40', 'K2IS', 'Airglades Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A1BE654E977F54C042EC4CA1F3EA3A40', 'KPGD', 'Punta Gorda, Charlotte County Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E61000006ABC749318AC57C0AAF1D24D62F03A40', 'KHHV', 'Alaminos Canyon 25/H-D (ExxonMobil)', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000000E2DB29DEFCF58C0F2D24D6210F83A40', 'KAPY', 'Zapata', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A75CE15D2E9C54C0C364AA6054123B40', 'KVNC', 'Venice Municipal Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B8585183690E54C04AEF1B5F7B2E3B40', 'KSUA', 'Witham Field Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000FD4D2844C08758C077103B53E8343B40', 'KBKS', 'Falfurrias, Brooks County Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E610000003098A1F633654C088635DDC46433B40', 'KOBE', 'Okeechobee County Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E61000003ECBF3E0EEAE58C093C6681D55553B40', 'KHBV', 'Hebbronville, Jim Hogg County Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000000000000000A857C0B4C876BE9F5A3B40', 'KVAF', 'East Breaks 643/Boomvang Spar', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000FD4D2844C0A354C002F1BA7EC1663B40', 'KSRQ', 'Sarasota-Bradenton International Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E61000008E1EBFB7E95554C0B0389CF9D5743B40', 'KSEF', 'Sebring Regional Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E610000099D87C5C1B1854C01D7233DC807F3B40', 'KFPR', 'Fort Pierce, St. Lucie County International Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E61000003D49BA66F27358C0FFEC478AC8803B40', 'KNQI', 'Kingsville, Naval Air Station', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E42CEC6987DD58C050C763062A8B3B40', 'KLRD', 'Laredo International Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000925CFE43FA8158C0CC5D4BC8078D3B40', 'KIKG', 'Kleberg County Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000004E621058399C56C00000000000A03B40', 'KGRY', 'Green Canyon 338 Front Runner', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E610000002F1BA7EC11A54C0D690B8C7D2A73B40', 'KVRB', 'Vero Beach Municipal Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E61000007862D68BA15258C0E17A14AE47B13B40', 'KNGP', 'Corpus Christi Naval Air Station/Truax Field', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E610000012BD8C62B98158C012BD8C62B9BD3B40', 'KALI', 'Alice, Alice International Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E610000072C45A7C0AA854C069520ABABDC43B40', 'KSPG', 'Albert Whitted Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000BF823463D16058C084D89942E7C53B40', 'KCRP', 'Corpus Christi International Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000004E452A8C2D6C58C0E57E87A240C73B40', 'KRBO', 'Robstown, Nueces County Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000004F0647C9AB4558C0F224E99AC9CF3B40', 'KRAS', 'Port Aransas, Mustang Beach Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000004F232D95B71F54C0D578E92631D03B40', 'KX26', 'Sebastian Municipal Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E610000014AE47E17A9457C052B81E85EBD13B40', 'KEMK', 'E Breaks Oil Platform', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AC1C5A643BFF56C0D7A3703D0AD73B40', 'KGHB', 'GB172/Salsa (Shell E-P)', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E61000000000000000A054C09A99999999D93B40', 'KMCF', 'Macdill Air Force Base, Fl.', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000327216F6B46754C0B0389CF9D5E43B40', 'KX07', 'Lake Wales Municipal Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E610000030F0DC7BB88258C030BB270F0BE53B40', 'KNOG', 'Orange Grove NALF', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E610000064062AE3DFAB54C01AA88C7F9FE93B40', 'KPIE', 'St. Petersburg/Clearwater Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A8C64B37894D58C07D3F355EBAE93B40', 'KTFP', 'Mc Campbell', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E610000009168733BF9C54C09886E12362EA3B40', 'KTPF', 'Tampa, Peter O Knight Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E610000072FE2614227254C03333333333F33B40', 'KBOW', 'Bartow Municipal', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B4AB90F293A254C092B3B0A71DF63B40', 'KTPA', 'Tampa International Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000BF7D1D3867B054C061C3D32B65F93B40', 'KCLW', 'Clearwater Air Park', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C2340C1F118154C0F92CCF83BBFB3B40', 'KLAL', 'Lakeland Regional', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A999999998954C00000000000003C40', 'KPCM', 'Plant City Municipal Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E610000060E5D022DB9554C0CC7A319413053C40', 'KVDF', 'Tampa, Vandenberg Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E61000007F130A11707054C0E4A08499B60F3C40', 'KGIF', 'Winter Havens Gilbert Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DEAB5626FC4258C02159C0046E153C40', 'KRKP', 'Rockport Aransas County Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000009B559FABAD2854C01A6EC0E787193C40', 'KMLB', 'Melbourne International Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000925CFE43FA8954C0B537F8C2643A3C40', 'KZPH', 'Zephyrhills Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E292E34EE92654C0126BF129003E3C40', 'KCOF', 'Cocoa - Patrick Air Force Base', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A4C7EF6DFA5B54C097A8DE1AD84A3C40', 'KISM', 'Kissimmee Gateway Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C2340C1F111156C09A99999999593C40', 'KDSF', 'Mississippi Canyon', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B4C876BE9F7258C0E9263108AC5C3C40', 'KBEA', 'Beeville Municipal Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C269C18BBE5454C097395D16136B3C40', 'KMCO', 'Orlando International Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A0FD481119CE58C093C6681D55753C40', 'KCOT', 'Cotulla-La Salle County Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F5673F52442454C03A0664AF77773C40', 'KXMR', 'Cocoa Beach, Cape Canaveral Air Force Station Skid Strip', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A27F828B159D54C0FE0E45813E793C40', 'KBKV', 'Brooksville-Tampa Bay Regional Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AE47E17A14EE57C00000000000803C40', 'KBQX', 'Brazos 451 Oil Platform', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E610000033333333333354C007D3307C44843C40', 'KTIX', 'Titusville', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000143FC6DCB5F458C0A1F831E6AE853C40', 'KCZT', 'Carrizo Springs Dimmit County Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000003A0664AF775554C0F9A067B3EA8B3C40', 'KORL', 'Orlando Executive Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CDCCCCCCCC2C54C0A06CCA15DE9D3C40', 'KTTS', 'Titusville, NASA Shuttle Landing Facility', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E610000033333333337356C06666666666A63C40', 'KMDJ', 'Miss Canyon Oil Platform', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000884B8E3BA52B58C090662C9ACEA63C40', 'KPKV', 'Port Lavaca - Calhoun County Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E610000018213CDA381058C06F8104C58FB93C40', 'KPSX', 'Palacios Municipal Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E610000000000000005054C0C6F99B5088C83C40', 'KSFB', 'Orlando / Sanford Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C74B3789419454C0AC8BDB6800CF3C40', 'KINF', 'Inverness Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E610000024624A24D17354C0C347C49448D23C40', 'KLEE', 'Leesburg International Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E61000008599B67F657758C0EC866D8B32D33C40', 'K2R9', 'Karnes County Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000BE9F1A2FDD2059C0CF66D5E76ADB3C40', 'K5T9', 'Eagle Pass - Maverick County Memorial International Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000FA9B5088803B58C0CDCCCCCCCCDC3C40', 'KVCT', 'Victoria Regional Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000001B0DE02D90A454C020D26F5F07DE3C40', 'KCGC', 'Crystal River Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C58F31772DA158C0696FF085C9F43C40', 'KPEZ', 'Pleasanton Municipal Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F7E978CC40F757C0B70BCD751AF93C40', 'KBYY', 'Bay City Municipal Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000007BBDFBE3BD3C54C09F1F46088F0E3D40', 'KEVB', 'New Smyrna Beach Municipal Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E610000003780B24285254C0FED478E926113D40', 'KDED', 'DeLand Municipal Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AB21718FA5DD57C03D44A33B881D3D40', 'KLBX', 'Angleton / Lake Jackson, Brazoria County Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C7681D554D1E59C059349D9D0C1E3D40', 'KT70', 'Spofford - Laughlin Air Force Base Auxiliary #1', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E610000048E17A14AEF756C01F85EB51B81E3D40', 'KSCF', 'S MARSH268 Oil Platform', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E610000033333333336356C01F85EB51B81E3D40', 'KDLP', 'West Delta Oil Platform', 'MS');
INSERT INTO postgis.stations VALUES ('0101000020E61000006AD95A5F248E54C07DB3CD8DE9293D40', 'KOCF', 'Ocala International Airport - Jim Taylor Field', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000FF78AF5A994454C03F8C101E6D2C3D40', 'KDAB', 'Daytona Beach International Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AF08FEB792EF58C0CBDB114E0B363D40', 'KUVA', 'Uvalde, Garner Field Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000448B6CE7FBF155C0B4C876BE9F3A3D40', 'KVOA', 'VK 786/Petronius (Chevron)', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E61000004E621058391C56C0736891ED7C3F3D40', 'KVKY', 'Main Pass 289C (Apache Corp)', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E61000008E01D9EBDD0958C0D39FFD4811413D40', 'KARM', 'Wharton Regional Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CC0BB08F4EB757C04CC3F01131453D40', 'KGLS', 'Galveston, Scholes Field', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000207BBDFBE3EB59C090BDDEFDF1463D40', 'KT89', 'Lajitas International Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D9CEF753E33556C0B29DEFA7C64B3D40', 'KMIS', 'Main Pass 140B (Apache Corp)', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E89FE062454754C0A27F828B154D3D40', 'KOMN', 'Ormond Beach Municipal Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E610000047205ED72F9E58C002F1BA7EC1563D40', 'KSSF', 'San Antonio, Stinson Municipal Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A60A462575B658C02BD9B11188573D40', 'KCVB', 'Castroville Municipal Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F67F0EF3E55B56C0983446EBA85A3D40', 'KLNQ', 'Boothville Heliport', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E0BE0E9C339E54C0EC2FBB270F5B3D40', 'KX60', 'Williston Montbrook Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000707CED9925CB58C0CEDF8442045C3D40', 'KHDO', 'Hondo Municipal Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E3DF675C383259C076543541D45D3D40', 'KDLF', 'Laughlin Air Force Base Auxiliary Airfield', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000008C101E6D1C3B59C0392861A6ED5F3D40', 'KDRT', 'Del Rio International Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A5315A4755A558C0609335EA21623D40', 'KSKF', 'San Antonio - Kelly Field', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E610000026AAB706B69056C08BE07F2BD9713D40', 'KGAO', 'Galliano, South Lafourche Airport', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E61000005A8121AB5B4D54C048BF7D1D38773D40', 'KFIN', 'Flagler County Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000BCB376DB85DE57C0448655BC91813D40', 'KAXH', 'Houston Southwest Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E610000008E6E8F17BCF57C05A9E077767853D40', 'KLVJ', 'Houston, Pearland Regional Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F697DD93875D58C0BA490C022B873D40', 'KT20', 'Gonzales Roger M. Dreyer Memorial', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000004F0647C9AB9D58C07FF6234564883D40', 'KSAT', 'San Antonio International Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E610000072FE2614229258C0C6F99B5088883D40', 'KRND', 'Randolph Air Force Base', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B13385CE6BAA56C0473D44A33B903D40', 'KHUM', 'Houma-Terrebonne Airport', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E61000008369183E227A58C062670A9DD7903D40', 'KSEQ', 'Seguin - Randolph AFB Auxiliary Field', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AACA57C09A99999999993D40', 'KEFD', 'Houston / Ellington', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000EB909BE106EA57C0C8EA56CF499F3D40', 'KSGR', 'Houston, Sugar Land Municipal / Hull Field Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000008046E9D2BFC654C0DDB419A721A23D40', 'KCTY', 'Cross City Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F38E537424175AC0C364AA6054A23D40', 'KPRS', 'Presidio Lely International Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AE47E17A14D257C03333333333A33D40', 'KHOU', 'Houston Hobby Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B7D100DE022158C032772D211FA43D40', 'K66R', 'Robert R Wells Jr Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B98D06F0166C54C0462575029AA83D40', 'K28J', 'Palatka Kay Larkin Field', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CE1951DA1BC457C07A36AB3E57AB3D40', 'KT41', 'La Porte Municipal Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000007D0569C6A29154C053CBD6FA22B13D40', 'KGNV', 'Gainesville Regional Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E61000006DCA15DEE58258C05A9E077767B53D40', 'KBAZ', 'New Braunfels Regional Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E17A14AE47D957C0105839B4C8B63D40', 'KMCJ', 'John Dunn Helistop', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A5315A4755D556C03A0664AF77B73D40', 'KPTN', 'Patterson Memorial', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E61000004DF38E5374AC58C00C93A98251B93D40', 'K5C1', 'San Antonio Boerne Stage Field', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A8E33103954155C07C2766BD18BA3D40', 'KAAF', 'Apalachicola', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E61000001630815B77F957C0F44F70B1A2CE3D40', 'KTME', 'Houston Executive Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C898BB96908156C083FA96395DD63D40', 'KNBG', 'New Orleans Naval Air Station - Alvin Callender Field', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E61000000CE544BB0A8354C0C74B378941D83D40', 'K42J', 'Keystone Airpark', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E61000009E0C8E92577758C0E960FD9FC3E43D40', 'KHYI', 'San Marcos Municipal Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CDCCCCCCCC3C58C046CEC29E76E83D40', 'K3T5', 'La Grange, Fayette Regional Air Center Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000008C101E6D1C0B59C0B51A12F758F23D40', 'KECU', 'Rocksprings, Edwards County Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F5673F52448456C03333333333F33D40', 'K7N0', 'New Orleans - Superdome', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E61000003D9B559FAB8157C088855AD3BCF33D40', 'KBPT', 'Beaumont/Port Arthur Southeast Texas Regional Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000401361C3D35554C0DA03ADC090F53D40', 'KSGJ', 'Northeast Florida Regional Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A5315A4755C558C03A0664AF77F73D40', 'KERV', 'Kerrville Municipal Airport/Louis Schreiner Field', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D36A48DC630557C04417D4B7CCF93D40', 'KIYA', 'Abbeville Chris Crusta Memorial Airport', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000FB96395D16D757C0B22E6EA301FC3D40', 'KIAH', 'Houston Intercontinental Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C3B645990D9056C0751F80D426FE3D40', 'KMSY', 'New Orleans International Airport', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E61000000ABFD4CF9BF856C081B2295778073E40', 'KARA', 'Acadiana Regional Airport', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E61000003CBD5296216255C0F1F44A5986083E40', 'KTDR', 'Tyndall Drone Runway', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E61000007D0569C6A28D59C0EA3E00A94D0C3E40', 'K6R6', 'Dryden - Terrell County Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000009D4B7155D98156C03F1D8F19A80C3E40', 'KNEW', 'New Orleans Lakefront Airport', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E610000055302AA9136455C0E38DCC237F103E40', 'KPAM', 'Tyndall Air Force Base', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A1BE654E97E357C0E17A14AE47113E40', 'KDWH', 'Houston, Hooks Memorial Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000452FA3586E7357C044DD0720B5113E40', 'KORG', 'Orange County Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A857CA32C48D57C0E02D90A0F8113E40', 'KBMT', 'Beaumont Municipal Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E610000037548CF337E554C0D23AAA9A20123E40', 'KFPY', 'Perry-Foley Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E61000002C4833164DA556C09161156F64163E40', 'KAPS', 'Port of South Louisiana Executive Regional Airport', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F1113125924E57C08EAF3DB324203E40', 'KLCH', 'Lake Charles Regional Airport', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A301BC05125857C0C4B12E6EA3213E40', 'KUXL', 'Southland Field', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E61000001F85EB51B83E58C0DE76A1B94E2B3E40', 'KGYB', 'Giddings-Lee County Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000234A7B832FBC56C0CE88D2DEE02B3E40', 'KREG', 'Louisiana Regional Airport', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000FE43FAEDEBA454C0029A081B9E2E3E40', 'KLCQ', 'Lake City Municipal Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E610000004E275FD826B58C01EDC9DB5DB2E3E40', 'KAUS', 'Austin-Bergstrom International Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CFBD874B8EFF56C0DD989EB0C4333E40', 'KLFT', 'Lafayette Regional Airport', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E610000024287E8CB97754C011AAD4EC81363E40', 'KVQQ', 'Cecil Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A999999994957C03A0664AF77373E40', 'KCWF', 'Chenault Airpark', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E61000003D49BA66F21758C0E36BCF2C09383E40', 'K11R', 'Brenham, Brenham Municipal Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000904E5DF92C6B54C079060DFD133C3E40', 'KNIP', 'Jacksonville Naval Air Station', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C976BE9F1A2B57C03CBD5296213E3E40', 'K3R7', 'Jennings Airport', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000276BD44334BA58C083FA96395D3E3E40', 'KT82', 'Fredericksburg, Gillespie County Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000FB5C6DC5FEEA55C0EEEBC039234A3E40', 'KJKA', 'Jack Edwards Airport', 'AL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000840D4FAF94C154C09487855AD34C3E40', 'K24J', 'Suwannee County Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C2340C1F117158C0D39FFD4811513E40', 'KATT', 'Austin Camp Mabry', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000894160E5D06054C003CFBD874B563E40', 'KCRG', 'Jacksonville Craig Municipal Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E61000008DD13AAA9A7456C0D690B8C7D2573E40', 'KASD', 'Slidell Airport', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B806B64AB0D455C0A5F78DAF3D5B3E40', 'KNPA', 'Pensacola Naval Air Station', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E61000000D897B2C7DDA57C0DE76A1B94E5B3E40', 'KCXO', 'Conroe, Montgomery County Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A323B9FC87C057C0B37BF2B0505B3E40', 'K6R3', 'Cleveland', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A52C431CEB7255C05D6DC5FEB25B3E40', 'KECP', 'Panama City - Northwest Florida Beaches International Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C2340C1F11015AC0A06CCA15DE5D3E40', 'KMRF', 'Marfa', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000009335EA211A5D56C0751F80D4265E3E40', 'KHSA', 'Bay St. Louis, Stennis International Airport', 'MS');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBBEB59C0B51A12F758623E40', 'KE38', 'Alpine-Casparis Municipal Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E610000039454772F96358C014AE47E17A643E40', 'KEDC', 'Austin Executive Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E610000052B81E85EB9D55C022895E46B1643E40', 'KDTS', 'Destin-Ft. Walton Beach Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E610000057B26323105B54C03ED00A0C59653E40', 'KNRB', 'Mayport Naval Station - Adm David L. McDonald Field', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E610000071C971A7741655C021B0726891653E40', 'KTLH', 'Tallahassee International Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E610000049A297512C4556C00CEA5BE674693E40', 'KGPT', 'Gulfport-Biloxi International Airport', 'MS');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBBAB55C06D3997E2AA6A3E40', 'KHRT', 'Hurlburt Field', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AA3A56C06D3997E2AA6A3E40', 'KBIX', 'Keesler Air Force Base / Biloxi', 'MS');
INSERT INTO postgis.stations VALUES ('0101000020E6100000FCA9F1D24D5E57C0C5FEB27BF2703E40', 'K5R8', 'De Quincy Industrial Airpark', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E3A59BC420F855C0BC74931804763E40', 'KCQF', 'Sonny Callahan Airport', 'AL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000158C4AEA042256C0AD69DE718A763E40', 'KPQL', 'Moss Point - Trent Lott International Airport', 'MS');
INSERT INTO postgis.stations VALUES ('0101000020E61000001D9430D3F6CB55C09886E123627A3E40', 'KPNS', 'Pensacola International Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C2340C1F11A155C0F92CCF83BB7B3E40', 'KVPS', 'Valparaiso / Eglin Air Force Base', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DD5ED218AD6956C0F7C77BD5CA7C3E40', 'KMJD', 'Picayune Municipal Airport', 'MS');
INSERT INTO postgis.stations VALUES ('0101000020E61000000E4FAF94656C54C090662C9ACE7E3E40', 'KJAX', 'Jacksonville International Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E610000036CD3B4ED17D58C057EC2FBB277F3E40', 'KRYW', 'Lago Vista TX, Rusty Allen Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D07EA4880CF158C0D0D03FC1C5823E40', 'KJCT', 'Junction, Kimble County Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D07EA4880C2D58C06B48DC63E9833E40', 'KRWV', 'Caldwell Municipal Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000001F85EB51B89A56C093C6681D55853E40', 'KHDC', 'Hammond Municipal Airport', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E610000082734694F69658C0BBB88D06F0863E40', 'KDZB', 'Horseshoe Bay Resort Airpark', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000005A9E077767C956C0D3C1FA3F87893E40', 'KBTR', 'Baton Rouge Metropolitan, Ryan Field', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E61000003C4ED1915C0657C01E166A4DF38E3E40', 'KOPL', 'Opelousas St Landry Parish Airport', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000956588635D5C58C08AB0E1E995923E40', 'KT74', 'Taylor Municipal Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000707CED99251758C0BE13B35E0C953E40', 'KCLL', 'College Station, Easterwood Field', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E610000001C11C3D7E2959C084D89942E7953E40', 'KSOA', 'Sonora Municipal Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CBF3E0EEAC2355C0704221020E993E40', 'K2J9', 'Quincy Municipal Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E610000081CF0F23845D54C031B610E4A09C3E40', 'KFHB', 'Fernandina Beach Municipal Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C3B645990D0456C0695721E5279D3E40', 'KBFM', 'Mobile Downtown Airport', 'AL');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBB6B58C02D6002B7EEAE3E40', 'KGTU', 'Georgetown Municipal Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000002B4D4A41B70F56C00EDB166536B03E40', 'KMOB', 'Mobile Regional Airport', 'AL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E17A14AE47C155C0FC1D8A027DB23E40', 'KNDZ', 'Milton, Whiting Field South', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E61000003E7958A8351558C048BF7D1D38B73E40', 'KCFD', 'Bryan Coulter Field', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E610000018265305A3DE56C080B74082E2B73E40', 'KHZR', 'New Roads False River Regional Airport', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E610000036C8242367C155C043CA4FAA7DBA3E40', 'KNSE', 'Milton - Whiting Field Naval Air Station North', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000FD87F4DBD78955C0091B9E5E29BB3E40', 'K54J', 'DeFuniak Spr AP', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A245B6F3FD4C59C0B1BFEC9E3CBC3E40', 'KOZA', 'Ozona Municipal Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C959D8D30E8F58C0CBB9145795BD3E40', 'KBMQ', 'Burnet, Burnet Municipal Craddock Field', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F37684D382E557C04AD235936FBE3E40', 'KUTS', 'Huntsville, Huntsville Municipal Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B56CAD2F122C57C08EAF3DB324C03E40', 'KACP', 'Oakdale, Allen Parish Airport', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E17A14AE47A155C02F51BD35B0C53E40', 'KCEW', 'Crestview, Sikes Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E42CEC6987D154C0103B53E8BCC63E40', 'KVLD', 'Valdosta Regional Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E610000083FA96395DAA58C08DD13AAA9AC83E40', 'KAQO', 'Llano, Llano Municipal Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000009E0C8E92577756C0D5B2B5BE48D03E40', 'KBXA', 'Bogalusa, George R Carr Memorial Air Field', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E61000000473F4F8BD5557C077103B53E8D43E40', 'KDRI', 'De Ridder, Beauregard Parish Airport', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E61000000473F4F8BD4B55C0F5673F5244D63E40', 'KMAI', 'Marianna Municipal Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E61000000D897B2C7D6655C0639CBF0985D83E40', 'K1J0', 'Tri-County Airport', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B2BAD573D22758C082E7DEC325DF3E40', 'KLHB', 'Hearne Municipal Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000990F0874263E58C0988A8D791DE13E40', 'KT35', 'Cameron (Milam Co) Municipal Airpark', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E610000018213CDA388257C051A5660FB4E23E40', 'KJAS', 'Jasper County-Bell Field Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000009161156F64F854C01EDC9DB5DBE63E40', 'KTVI', 'Thomasville Regional Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AABA59C00CEA5BE674E93E40', 'KFST', 'Fort Stockton-Pecos County Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D8648D7A882855C03A0664AF77F73E40', 'KBGE', 'Bainbridge, Decatur County Industrial Air Park Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E610000083DDB06D51CC54C051888043A8FA3E40', 'KVAD', 'Moody Air Force Base', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000202922C32A3855C0990D32C9C8013F40', 'K17J', 'Donalsonville Municipal Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E71DA7E8483A57C0BD5296218E053F40', 'KBKB', 'Ft. Polk - Fullerton Landing Strip', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E61000003D49BA66F29355C07B14AE47E10A3F40', 'K0J4', 'Florala Municipal Airport', 'AL');
INSERT INTO postgis.stations VALUES ('0101000020E61000005F419AB1684C57C0CDCCCCCCCC0C3F40', 'KPOE', 'Fort Polk, Polk AAF Ft Polk', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E61000005AF5B9DA8AB154C0AED85F764F0E3F40', 'KHOE', 'Homerville Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C7116BF129325AC049BA66F2CD0E3F40', 'KVHN', 'Culberson County Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F5673F52447458C0D39FFD4811113F40', 'KGRK', 'Fort Hood, Robert Gray AAF Ft Hood', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBB6B58C093C6681D55153F40', 'KILE', 'Killeen, Skylark Field Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000732EC55565F354C02F51BD35B0153F40', 'KMGR', 'Moultrie Municipal Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D8648D7A888C58C050C763062A1B3F40', 'KLZZ', 'Lampasas Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CDCCCCCCCC6C58C0609335EA21223F40', 'KHLR', 'Hood AAF Ft Hood', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A999999995958C06666666666263F40', 'KTPL', 'Temple, Draughon-Miller Central Texas Regional Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D07EA4880C5954C0C9C859D8D3263F40', 'KSSI', 'Brunswick, Malcolm McKinnon Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000276BD443349E56C04BE5ED08A72D3F40', 'KMCB', 'McComb / Pike County / John E Lewis Field Airport', 'MS');
INSERT INTO postgis.stations VALUES ('0101000020E610000018601F9DBAD458C0A06CCA15DE2D3F40', 'KBBD', 'Brady, Curtis Field Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E610000083C0CAA1455E59C0A52C431CEB323F40', 'KE41', 'Reagan County Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000003B014D840D0F55C0D881734694363F40', 'KCXU', 'Camilla-Mitchell County Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E61000000000000000B057C087DC0C37E03B3F40', 'KLFK', 'Lufkin, Angelina County Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B515FBCBEEAD58C03108AC1C5A3C3F40', 'K81R', 'San Saba County Municipal Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A999999999954C00000000000403F40', 'KAYS', 'Waycross / Ware County, Ga', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E61000008E01D9EBDD5D54C00000000000403F40', 'KBQK', 'Brunswick / Glynco', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E61000009161156F645056C03EE8D9ACFA443F40', 'KHBG', 'Hattiesburg, Bobby L Chain Municipal Airport', 'MS');
INSERT INTO postgis.stations VALUES ('0101000020E61000001D7233DC806D55C02D26361FD7463F40', 'KOZR', 'Cairns Army Air Field / Ozark', 'AL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000158C4AEA047456C079E92631084C3F40', 'K0R0', 'Columbia-Marion County Airport', 'MS');
INSERT INTO postgis.stations VALUES ('0101000020E6100000EE5A423EE87955C0CEAACFD5564C3F40', 'KEDN', 'Enterprise Municipal Airport', 'AL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D8648D7A889855C0CDCCCCCCCC4C3F40', 'K79J', 'Andalusia-Opp Municipal Airport', 'AL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AB9509BFD4D957C091D5AD9E934E3F40', 'KDKR', 'Crockett, Houston County Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DB166536C85C55C0EE42739D46523F40', 'KDHN', 'Dothan Regional Airport', 'AL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000FD4D2844C02357C02F51BD35B0553F40', 'KAEX', 'Alexandria International Airport', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AA6A55C09A99999999593F40', 'KHEY', 'Hanchey AHP / Ozark', 'AL');
INSERT INTO postgis.stations VALUES ('0101000020E610000066666666667655C09A99999999593F40', 'KSXS', 'Schell AHP', 'AL');
INSERT INTO postgis.stations VALUES ('0101000020E61000009274CDE49B1F59C03524EEB1F4593F40', 'KSJT', 'San Angelo, Mathis Field', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000672783A3E46F55C087DC0C37E05B3F40', 'KLOR', 'Fort Rucker, Lowe Army Heliport', 'AL');
INSERT INTO postgis.stations VALUES ('0101000020E610000054A9D903ADE059C08BE07F2BD9613F40', 'KPEQ', 'Pecos Municipal Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E610000047E6913F181257C0BD18CA8976653F40', 'KESF', 'Alexandria Esler Regional Airport', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E17A14AE473955C068791EDC9D653F40', 'KBIJ', 'Blakely, Early County Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E61000003CBD5296215257C06666666666663F40', 'KAQV', 'Ft. Polk - Peason Ridge', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000BB0F406A13C355C0179F02603C6B3F40', 'KGZH', 'Evergreen, Middleton Field', 'AL');
INSERT INTO postgis.stations VALUES ('0101000020E610000072FE261422B65BC0F92CCF83BB6B3F40', 'KOLS', 'Nogales International Airport', 'AZ');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F437A110017358C0C0046EDDCD6B3F40', 'KGOP', 'Gatesville, City-County Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000002506819543DF54C0E7FBA9F1D26D3F40', 'KTMA', 'Tifton Henry Tift Myers', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A5315A47555556C03A0664AF77773F40', 'KPIB', 'Hattiesburg-Laurel Regional Airport', 'MS');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C959D8D30EB754C0FCFB8C0B077A3F40', 'KDQH', 'Douglas Municipal Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F5673F52445458C0F92CCF83BB7B3F40', 'KPWG', 'Waco, Mc Gregor Executive Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E610000051F701486DA054C0FE0E45813E893F40', 'KAMG', 'Alma, Bacon County Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E610000003603C83860C55C061A6ED5F59893F40', 'KABY', 'Southwest Georgia Regional Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E610000014AE47E17A7854C0E7FBA9F1D28D3F40', 'KJES', 'Jesup-Wayne County Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E610000023DBF97E6AE056C01D5A643BDF8F3F40', 'K0R4', 'Vidalia Concordia Parish', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A5315A4755955BC093C6681D55953F40', 'KFHU', 'Fort Huachuca, Libby AAF Ft Huachuca', 'AZ');
INSERT INTO postgis.stations VALUES ('0101000020E61000008E01D9EBDDAD57C093C6681D55953F40', 'KOCH', 'Nacogdoches, A L Mangham Jr. Regional Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000BADA8AFD659B5BC0422619390B9B3F40', 'KALK', 'Pioneer Airfield', 'AZ');
INSERT INTO postgis.stations VALUES ('0101000020E61000002E90A0F8319A56C0B3EA73B5159B3F40', 'K1R7', 'Brookhaven-Lincoln County Airport', 'MS');
INSERT INTO postgis.stations VALUES ('0101000020E610000009C4EBFA05D356C012A0A696AD9D3F40', 'KHEZ', 'Hardy-Anders Field Natchez-Adams County Airport', 'MS');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B4AB90F2934E58C0E76F4221029E3F40', 'KACT', 'Waco Regional Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000008D28ED0DBE4458C088635DDC46A33F40', 'KCNW', 'Waco-James Connally Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B0726891ED2058C0F931E6AE25A43F40', 'KLXY', 'Mexia Limestone County Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E10B93A9828958C00A68226C78AA3F40', 'KMNZ', 'Hamilton Municipal Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000007B14AE47E14A56C0EC51B81E85AB3F40', 'KLUL', 'Laurel/Nobel Field', 'MS');
INSERT INTO postgis.stations VALUES ('0101000020E6100000211FF46C56D154C002BC051214AF3F40', 'KFZG', 'Fitzgerald Municipal Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E61000008C4AEA04349954C082E2C798BBB63F40', 'KBHC', 'Baxley Municipal Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A3AF20CD584657C06A6AD95A5FBC3F40', 'KIER', 'Natchitoches Regional Airport', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E61000003A58FFE730ED57C0BA313D6189C73F40', 'KPSN', 'Palestine Municipal Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E610000074EFE192E3CC59C08109DCBA9BC73F40', 'KINK', 'Winkler County Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C3B645990D985AC06475ABE7A4CF3F40', 'KELP', 'El Paso International Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000EF0390DAC4335AC0E960FD9FC3D43F40', 'KGDP', 'Pine Springs, Guadalupe Mountains National Park', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B462575028A57C0865AD3BCE3D43F40', 'KF17', 'Center Municipal Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A99999999D958C0D7A3703D0AD73F40', 'KCOM', 'Coleman', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B3EA73B515A755C02A3A92CB7FD83F40', 'KPRN', 'Mac Crenshaw Memorial Airport', 'AL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DB166536C88055C0EA3E00A94DDC3F40', 'KTOI', 'Troy Municipal Airport', 'AL');
INSERT INTO postgis.stations VALUES ('0101000020E610000072BF4351A0975AC06AA4A5F276DC3F40', 'KBIF', 'Biggs Army Air Field - Fort Bliss', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000006002B7EEE6CD57C011AAD4EC81DE3F40', 'KJSO', 'Jacksonville, Cherokee County Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000001895D40968AC5AC09CA223B9FCDF3F40', 'KDNA', 'Dona Ana County Jetport, Santa Teresa', 'NM');
INSERT INTO postgis.stations VALUES ('0101000020E61000008CDB68006FA954C06DC5FEB27BE23F40', 'KAZE', 'Hazlehurst Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000957D5704FF6354C0FAB31F2922E33F40', 'KLHW', 'Wright Army Airfield (Fort Stewart)/Midcoast Regional Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000581CCEFC6AA658C06D3997E2AAEA3F40', 'KMKN', 'Comanche County-City Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C2340C1F119959C087DC0C37E0EB3F40', 'KODO', 'Odessa-Schlemeyer Field', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E610000096E7C1DD598D59C08ACDC7B5A1F23F40', 'KMAF', 'Midland International Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C74B3789414855C0FA7E6ABC74F33F40', 'KEUF', 'Eufaula Municipal Airport', 'AL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F697DD9387F154C0E9482EFF21FD3F40', 'KCKF', 'Cordele Crisp County Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A999999994954C08369183E22024040', 'KSVN', 'Hunter U. S. Army Airfield', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E42CEC69871958C00E4A9869FB034040', 'KCRS', 'Campbell Field-Corsicana Municipal Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000002A1DACFF738659C062F3716DA8044040', 'KMDD', 'Midland, Midland Airpark', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E610000076543541D48954C032384A5E9D074040', 'KRVJ', 'Swinton Smith Field at Reidsville Municipal Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E610000037894160E57057C0C58F31772D094040', 'K3F3', 'Mansfield - C E Rusty Williams Airport', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E610000018213CDA384658C04963B48EAA0A4040', 'KINJ', 'Hillsboro Municipal Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E610000072E14048160C55C0EE08A7052F0E4040', 'KACJ', 'Americus Souther Field Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E61000007E52EDD3F14C54C077D66EBBD0104040', 'KSAV', 'Savannah-Hilton Head International Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E561A1D634BD5BC0B0389CF9D5104040', 'KTUS', 'Tucson International Airport', 'AZ');
INSERT INTO postgis.stations VALUES ('0101000020E61000003480B74082B657C0EEEBC03923124040', 'KRFI', 'Rusk County Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000006C787AA52CCB5BC0E0BE0E9C33124040', 'KRYN', 'Tucson Ryan Field Airport', 'AZ');
INSERT INTO postgis.stations VALUES ('0101000020E610000069006F8104F557C0DB8AFD65F7144040', 'KF44', 'Athens Municipal Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D8648D7A88B85BC0B79C4B7155154040', 'KDMA', 'Davis-Monthan Air Force Base', 'AZ');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F06DFAB31F9357C066BD18CA89164040', 'K4F2', 'Panola County Airport-Sharpe Field', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C0046EDDCD9754C0713D0AD7A3184040', 'KVDI', 'Vidalia Municipal Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E61000008126C286A77754C08CB96B09F9184040', 'KCWV', 'Claxton Evans County Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C2340C1F116159C09A99999999194040', 'KBPG', 'Big Spring McMahon-Wrinkle Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000004E452A8C2DC854C065E42CEC691B4040', 'KEZM', 'Eastman, Heart of Georgia Regional Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CDCCCCCCCC2C54C01D03B2D7BB1B4040', 'KHXD', 'Hilton Head Airport', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBB8B58C01D03B2D7BB1B4040', 'KSEP', 'Stephenville, Clark Field Municipal Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBBBB56C07D96E7C1DD1D4040', 'KVKS', 'Vicksburg Municipal', 'MS');
INSERT INTO postgis.stations VALUES ('0101000020E6100000399CF9D51CEE5AC0BE6A65C22F214040', 'KDMN', 'Deming Municipal Airport', 'NM');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F437A11001BB5AC0BE13B35E0C254040', 'KLRU', 'Las Cruces International Airport', 'NM');
INSERT INTO postgis.stations VALUES ('0101000020E61000000725CCB4FD9955C04AD235936F264040', 'KMGM', 'Montgomery, Dannelly Field', 'AL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B8019F1F469A56C07B4E7ADFF8264040', 'KJVW', 'JB Williams Airport', 'MS');
INSERT INTO postgis.stations VALUES ('0101000020E6100000295C8FC2F58456C045F0BF95EC284040', 'KJAN', 'Jackson International Airport', 'MS');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D9CEF753E3A159C051DA1B7C612A4040', 'KE11', 'Andrews County Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A5315A47553555C04963B48EAA2A4040', 'KLSF', 'Fort Benning', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E61000000AD7A3703D8E56C097A8DE1AD82A4040', 'KHKS', 'Jackson, Hawkins Field Airport', 'MS');
INSERT INTO postgis.stations VALUES ('0101000020E610000090831266DA105AC033333333332B4040', 'KCNM', 'Carlsbad, Cavern City Air Terminal Airport', 'NM');
INSERT INTO postgis.stations VALUES ('0101000020E61000009626A5A0DB2F56C0FA0AD28C452B4040', 'KMEI', 'Meridian, Key Field', 'MS');
INSERT INTO postgis.stations VALUES ('0101000020E610000052B81E85EBC156C0DB85E63A8D2C4040', 'KTVR', 'Vicksburg / Tallulah Regional Airport', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E61000003ECBF3E0EEBE55C0CDCCCCCCCC2C4040', 'KSEM', 'Craig Field / Selma', 'AL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000FD4D2844C05B58C0F0C4AC17432D4040', 'KCPT', 'Cleburne Municipal Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000009D4B7155D9D957C06002B7EEE62D4040', 'KTYR', 'Tyler Pounds Field', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000933A014D84C158C03B70CE88D22E4040', 'KGZN', 'Gregory M Simmons Memorial Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E610000085251E50368554C0B2D7BB3FDE2F4040', 'KMHP', 'Metter Municipal Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000289B7285779755C0B0C91AF510314040', 'KMXF', 'Maxwell Air Force Base / Montgomery', 'AL');
INSERT INTO postgis.stations VALUES ('0101000020E610000041BCAE5FB0AD57C01990BDDEFD314040', 'KGGG', 'Longview - East Texas Regional Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D93D7958A8D154C0DE02098A1F334040', 'K48A', 'Cochran Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000925CFE43FACD5BC08638D6C56D344040', 'KAVQ', 'Tucson Marana Regional Airport', 'AZ');
INSERT INTO postgis.stations VALUES ('0101000020E6100000842A357BA0EB58C0F819170E84344040', 'KABI', 'Abilene Regional Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000007F6ABC74932854C0DBF97E6ABC344040', 'KARW', 'Beaufort County Airport', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E61000007D7901F6D1B358C0FEB7921D1B354040', 'KETN', 'Eastland Municipal Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E610000097A8DE1AD8F658C0F6285C8FC2354040', 'KDYS', 'Abilene, Dyess Air Force Base', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E78C28ED0DA658C03B014D840D374040', 'K6P9', 'Ranger', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000001FF46C567D8656C08048BF7D1D384040', 'KMBO', 'Madison Bruce Campbell Field Airport', 'MS');
INSERT INTO postgis.stations VALUES ('0101000020E6100000302AA913D0A055C0AA60545227384040', 'K1A9', 'Prattville - Grouby Field', 'AL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F5673F52447458C0A2EE0390DA384040', 'KGDJ', 'Granbury Municipal Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E610000009168733BF7457C01AA3755435394040', 'KSHV', 'Shreveport Regional Airport', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E610000075B0FECF613A58C091442FA3583A4040', 'KJWY', 'Midlothian/Waxahachie, Mid-Way Regional Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000454772F90FFD55C041F163CC5D3B4040', 'KDYA', 'Demopolis Municipal Airport', 'AL');
INSERT INTO postgis.stations VALUES ('0101000020E61000009D4B7155D91D59C0C0046EDDCD3B4040', 'KSWW', 'Sweetwater, Avenger Field Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000417DCB9C2E6F54C0BD00FBE8D43D4040', 'KTBR', 'Statesboro-Bulloch County Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E61000000CC85EEFFE2C54C0417DCB9C2E3F4040', 'KNBC', 'Beaufort, Marine Corps Air Station', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CDCCCCCCCC9C5CC00000000000404040', 'KNOZ', 'Yuma Auxiliary Airfield', 'AZ');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AA6A57C00000000000404040', 'KBAD', 'Barksdale Air Force Base', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000179AEB34D2D45BC08542041C42414040', 'KMZJ', 'Pinal Airpark', 'AZ');
INSERT INTO postgis.stations VALUES ('0101000020E6100000228E75711BF154C036AB3E575B414040', 'KPXE', 'Perry-Houston County Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F9A067B3EA0157C03C66A032FE414040', 'KMLU', 'Monroe Regional Airport', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C7681D554D3C55C0BC9179E40F424040', 'KCSG', 'Columbus Metropolitan Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E61000005D6DC5FEB29357C0B4C876BE9F424040', 'KASL', 'Marshall', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000562B137EA96F57C03D0AD7A370454040', 'KDTN', 'Shreveport Downtown Airport', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DD0720B5892356C058AD4CF8A5464040', 'KNMM', 'Meridian Naval Air Station - McCain Field', 'MS');
INSERT INTO postgis.stations VALUES ('0101000020E610000029B3412619475DC0397F130A11484040', 'KNRS', 'Imperial Beach Naval Outlying Field - Ream Field', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D7A3703D0ABF54C0F146E6913F484040', 'KDBN', 'Dublin, W H Barron Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E610000052448655BC5358C0DC114E0B5E484040', 'KFWS', 'Fort Worth Spinks Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F2D24D62101055C07F6ABC7493484040', 'K6A1', 'Butler Municipal Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CFBD874B8E3F5DC07D0569C6A2494040', 'KSDM', 'San Diego, Brown Field Municipal Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E61000000057B263232E58C0E605D847A74A4040', 'KLNC', 'Lancaster Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E610000096B20C71AC9754C02EFF21FDF64D4040', 'KSBO', 'Swainsboro Emanuel County Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBB5B55C05036E50AEF4E4040', 'KAUO', 'Auburn-Opelika Airport', 'AL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DA8F149161095BC0300DC347C4504040', 'KSVC', 'Grant County Airport', 'NM');
INSERT INTO postgis.stations VALUES ('0101000020E61000006666666666E654C0B0C91AF510514040', 'KWRB', 'Warner Robins Air Force Base', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000556AF6402B6654C0A661F88898524040', 'KJYL', 'Sylvania, Plantation Airpark', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DEE522BE135357C0111E6D1CB1524040', 'KMNE', 'Minden Airport', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E61000004E0B5EF4154658C055A4C2D842544040', 'KGKY', 'Arlington Municipal Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000003524EEB1F4A55CC04DD6A88768544040', 'KNYL', 'Yuma, Marine Corps Air Station', 'AZ');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F6285C8FC2A959C04AD235936F564040', 'KGNC', 'Seminole, Gaines County Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DA5548F9493758C0EDD3F19881564040', 'KRBD', 'Dallas, Redbird Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000008E01D9EBDDCD59C01630815B77574040', 'KHOB', 'Hobbs / Lea County', 'NM');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F224E99AC9E954C0B9C7D2872E584040', 'KMCN', 'Middle Georgia Regional Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000889D29745E4D5DC03F8C101E6D584040', 'KNZY', 'San Diego, North Island, Naval Air Station', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000BF823463D13C59C0F8AA9509BF584040', 'KSNK', 'Snyder, Winston Field Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E610000014ED2AA4FC4258C04C546F0D6C594040', 'KGPM', 'Grand Prairie Municipal Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E610000026AAB706B6BC57C02FC03E3A75594040', 'KJXI', 'Fox Stephens Field - Gilmer Municipal Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D578E926310054C07D3F355EBA594040', 'KJZI', 'Charleston Executive Airport', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E610000049A297512C1158C09E0C8E92575B4040', 'KTRL', 'Terrell Municipal Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000001B2FDD2406B958C079E92631085C4040', 'KBKD', 'Stephens County Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000002B4D4A41B74B5DC06002B7EEE65D4040', 'KSAN', 'San Diego International Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000EF0390DAC4DF57C010CCD1E3F75E4040', 'KJDD', 'Mineola/Quitman, Wood County Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000446E861BF02158C08109DCBA9B5F4040', 'KHQZ', 'Mesquite Metro Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000009C8A54185BF856C0F8AA9509BF604040', 'KBQP', 'Bastrop, Morehouse Memorial Airport', 'LA');
INSERT INTO postgis.stations VALUES ('0101000020E610000002486DE2E47A59C0A2D11DC4CE604040', 'KLUV', 'Lamesa Municipal Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBB5B58C0D925AAB706624040', 'KNFW', 'Fort Worth, Naval Air Station', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000009626A5A0DB8358C0D52137C30D644040', 'KMWL', 'Mineral Wells Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E610000018601F9DBA485DC0F146E6913F684040', 'KMYF', 'San Diego, Montgomery Field', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000EE42739D46EA5CC09A99999999694040', 'KNJK', 'El Centro, Naval Air Facility', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CC0BB08F4E5758C07D0569C6A2694040', 'KFTW', 'Fort Worth, Meacham International Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000004E9CDCEF503E5DC0A7AE7C96E7694040', 'KSEE', 'Gillespie Field Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DEC83CF207E55CC0F4A62215C66A4040', 'KIPL', 'Imperial County Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E466B8019F7F5AC0261E5036E56A4040', 'KALM', 'Alamogordo-White', 'NM');
INSERT INTO postgis.stations VALUES ('0101000020E6100000637FD93D793855C0A4DFBE0E9C6B4040', 'KPIM', 'Pine Mountain Harris County Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E61000006666666666865AC0CDCCCCCCCC6C4040', 'KHMN', 'Holloman Air Force Base', 'NM');
INSERT INTO postgis.stations VALUES ('0101000020E610000012BD8C62B91D5AC0FEB7921D1B6D4040', 'KATS', 'Artesia Municipal Airport', 'NM');
INSERT INTO postgis.stations VALUES ('0101000020E61000008907944DB93658C093C6681D556D4040', 'KDAL', 'Dallas Love Field', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E610000054A9D903AD685BC012BD8C62B96D4040', 'KSAD', 'Safford Municipal Airport', 'AZ');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DAFE959526995CC06D3997E2AA6E4040', 'KLGF', 'Laguna Army Airfield', 'AZ');
INSERT INTO postgis.stations VALUES ('0101000020E610000085EB51B81E495DC05E11FC6F256F4040', 'KNKX', 'San Diego, Miramar MCAS/Mitscher Field Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AE47E17A142E5CC09A99999999714040', 'KGXF', 'Gila Bend Air Force Auxiliary Field', 'AZ');
INSERT INTO postgis.stations VALUES ('0101000020E6100000BDE3141DC97D54C0EE7C3F355E724040', 'K2J5', 'Millen Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E61000007E74EACA674158C082397AFCDE724040', 'KDFW', 'Dallas/Fort Worth International Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000273108AC1CF253C06DE7FBA9F1724040', 'KLRO', 'Mount Pleasant Regional-Faison Field', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A661F888980254C0C959D8D30E734040', 'KCHS', 'Charleston Air Force Base', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E61000008B4F01309E7D55C0A27F828B15754040', 'KALX', 'Alexander City, Thomas C Russell Field Airport', 'AL');
INSERT INTO postgis.stations VALUES ('0101000020E61000001B2FDD24062954C0D9CEF753E3754040', 'KRBW', 'Walterboro Lowcountry Regional Airport', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E610000087BF266BD41B58C065AA605452774040', 'KF46', 'Rockwall Municipal Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000009EEFA7C64BDB5BC0C7293A92CB774040', 'KP08', 'Coolidge Municipal Airport', 'AZ');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C2340C1F11F15BC09A99999999794040', 'KCGZ', 'Casa Grande Municipal Airport', 'AZ');
INSERT INTO postgis.stations VALUES ('0101000020E610000045F0BF95EC1055C00AD7A3703D7A4040', 'KOPN', 'Thomaston-Upson County Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A5315A47553558C01D03B2D7BB7B4040', 'KADS', 'Dallas / Addison Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E610000076E09C11A5B554C088855AD3BC7B4040', 'KOKZ', 'Sandersville Kaolin Field Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E61000009C8A54185B5458C09B1BD313967C4040', 'KAFW', 'Fort Worth Alliance Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000001F4B1FBAA09854C0BCE82B48337E4040', 'K2J3', 'Louisville Municipal Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E23B31EBC5FA5BC01F85EB51B87E4040', 'KA39', 'Ak-Chin Regional Airport', 'AZ');
INSERT INTO postgis.stations VALUES ('0101000020E61000008E1EBFB7E9BD5AC01F85EB51B87E4040', 'K0A0', 'Spaceport America AWOS', 'NM');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F7065F984C5154C0F31FD26F5F7F4040', 'KAQX', 'Allendale County Airport', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000EE258DD13A4455C0B01BB62DCA804040', 'KLGC', 'LaGrange-Callaway Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000FE2B2B4D4AA55DC0C286A757CA824040', 'KNUC', 'San Clemente Island NALF', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E610000086AC6EF59C3A5DC0CDCCCCCCCC844040', 'KRNM', 'Ramona Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E610000060E5D022DB1154C0F2D24D6210884040', 'KDYB', 'Summerville Airport', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F5673F52440458C0EACF7EA488884040', 'KGVT', 'Greenville / Majors', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000005D50DF32A7515DC0713D0AD7A3904040', 'KCRQ', 'Carlsbad, McClellan-Palomar Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000732EC55565CF54C01D03B2D7BB934040', 'KMLJ', 'Milledgeville, Baldwin County Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000FD4D2844C0E757C07F87A2409F944040', 'KSLR', 'Sulphur Springs Municipal Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000643BDF4F8D9355C0F5B9DA8AFD954040', 'KSCD', 'Merkel Field Sylacauga Municipal Airport', 'AL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000EC12D55B037558C04AD235936F964040', 'KXBP', 'Bridgeport Municipal Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E8DEC325C72558C002F1BA7EC1964040', 'KTKI', 'McKinney National Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000EB909BE106B255C0A6F27684D3964040', 'KEET', 'Alabaster, Shelby County Airport', 'AL');
INSERT INTO postgis.stations VALUES ('0101000020E61000005F07CE19510254C039B4C876BE974040', 'KMKS', 'Moncks Corner Berkeley County', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000095053CBD64C58C0BC0512143F9A4040', 'KDTO', 'Denton Enterprise Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000004F58E20165E755C057EC2FBB279B4040', 'KTCL', 'Tuscaloosa Regional Airport', 'AL');
INSERT INTO postgis.stations VALUES ('0101000020E61000000D897B2C7D565DC06B48DC63E99B4040', 'KOKB', 'Oceanside Municipal Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E61000006ABC7493183457C0C74B3789419C4040', 'KELD', 'South Arkansas Regional Airport', 'AR');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E86A2BF6971155C0931804560E9D4040', 'K6A2', 'Griffin Spalding County Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A1B94E232DDD5DC0E010AAD4EC9D4040', 'KNSI', 'San Nicolas Island Naval Outlying Field', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000695721E527D15AC0DFF8DA334B9E4040', 'KTCS', 'Truth Or Consequences Municipal Airport', 'NM');
INSERT INTO postgis.stations VALUES ('0101000020E6100000695721E5276558C0AA656B7D91A04040', 'KLUD', 'Decatur Municipal Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E610000046B6F3FDD45854C01B2FDD2406A14040', 'KBNL', 'Barnwell Regional Airport', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D13FC1C58A145DC0695721E527A14040', 'KL08', 'Borrego Valley Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E610000059DDEA39E9F35BC03C889D2974A24040', 'KCHD', 'Chandler Municipal Airport', 'AZ');
INSERT INTO postgis.stations VALUES ('0101000020E61000006A183E22A6565DC0F437A11001A74040', 'KNFG', 'Oceanside, Camp Pendleton, Marine Corps Air Station', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AA4885B185205AC0C1E270E657A74040', 'KROW', 'Roswell International Air Center Airport', 'NM');
INSERT INTO postgis.stations VALUES ('0101000020E61000004DF38E5374D453C0E4141DC9E5A74040', 'KGGE', 'Georgetown County Airport ', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D3307C444C3155C01D9430D3F6A74040', 'KCCO', 'Newnan Coweta County Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E61000003A92CB7F48BB55C0645DDC4603A84040', 'KEKY', 'Bessemer Airport', 'AL');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A99999999E95BC0EACF7EA488A84040', 'KIWA', 'Phoenix-Mesa Gateway Airport', 'AZ');
INSERT INTO postgis.stations VALUES ('0101000020E610000040A4DFBE0E505DC0211FF46C56AD4040', 'KL18', 'Fallbrook Community Airpark', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A6ED5F59692455C05A8121AB5BAD4040', 'KFFC', 'Atlanta Regional Airport-Falcon Field', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E61000005D50DF32A77D54C058AD4CF8A5AE4040', 'KAGS', 'Augusta, Bush Field', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E610000077BE9F1A2F1555C0EE5A423EE8B14040', 'KHMP', 'Henry County Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B48EAA26889A5DC0AB5B3D27BDB34040', 'KAVX', 'Avalon Catalina Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D8648D7A88185CC0B79C4B7155B54040', 'KGYR', 'Goodyear Municipal', 'AZ');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F9A067B3EA2B5CC0849ECDAACFB54040', 'KBXK', 'Buckeye Municipal Airport', 'AZ');
INSERT INTO postgis.stations VALUES ('0101000020E6100000906B43C538005CC079211D1EC2B64040', 'KPHX', 'Phoenix Sky Harbor International Airport', 'AZ');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AED85F764F3656C0E5F21FD26FB74040', 'KSTF', 'George M Bryan Airport, Starkville', 'MS');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A5315A47552556C09A99999999B94040', 'KGTR', 'Columbus/West Point/Starkville, Golden Triangle Regional Airport', 'MS');
INSERT INTO postgis.stations VALUES ('0101000020E610000033333333337F57C075B0FECF61BA4040', 'KTXK', 'Texarkana Regional-Webb Field', 'AR');
INSERT INTO postgis.stations VALUES ('0101000020E61000007862D68BA13654C081785DBF60BB4040', 'KOGB', 'Orangeburg Municipal Airport', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E610000082E2C798BB6E56C0EC51B81E85BB4040', 'K5A6', 'Winona-Montgomery County Airport', 'MS');
INSERT INTO postgis.stations VALUES ('0101000020E61000003ECBF3E0EEEE5BC01D03B2D7BBBB4040', 'KFFZ', 'Mesa / Falcon Field', 'AZ');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E8DEC325C7615AC080608E1EBFBB4040', 'KSRR', 'Sierra Blanca Regional Airport', 'NM');
INSERT INTO postgis.stations VALUES ('0101000020E61000005F5E807D748254C04F401361C3BB4040', 'KDNL', 'Augusta Daniel Field', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000BB0F406A13BF56C0D9942BBCCBBD4040', 'KGLH', 'Greenville, Mid Delta Regional Airport', 'MS');
INSERT INTO postgis.stations VALUES ('0101000020E610000096E7C1DD598556C0D7A3703D0ABF4040', 'KGWO', 'Greenwood-LeFlore Airport', 'MS');
INSERT INTO postgis.stations VALUES ('0101000020E61000006DCA15DEE5125CC008E6E8F17BC34040', 'KGEU', 'Glendale Municipal Airport', 'AZ');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D07EA4880CA154C0DD989EB0C4C34040', 'KHQU', 'Thomson-McDuffie County Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D8648D7A88185CC0E3FC4D2844C44040', 'KLUF', 'Luke Air Force Base / Phoenix', 'AZ');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C05B2041F18F55C09D8026C286C74040', 'KPLR', 'St Clair County Airport', 'AL');
INSERT INTO postgis.stations VALUES ('0101000020E610000048E17A14AEAF55C07FF6234564C84040', 'KBHM', 'Birmingham International Airport', 'AL');
INSERT INTO postgis.stations VALUES ('0101000020E61000004E62105839485DC07DAEB6627FC94040', 'KF70', 'Murrieta/Temecula French Valley', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E61000008E01D9EBDD0D54C04963B48EAACA4040', 'KMNI', 'Manning / Cooper Regional', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C0266BD4437655C02BF697DD93CB4040', 'KANB', 'Anniston Metro Airport', 'AL');
INSERT INTO postgis.stations VALUES ('0101000020E610000074EFE192E3C854C014AE47E17ACC4040', 'K3J7', 'Greensboro, Greene County Regional Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C4B12E6EA37158C069006F8104CD4040', 'K0F2', 'Bowie Municipal Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000006C3EAE0D15FB5BC051DA1B7C61CE4040', 'KSDL', 'Scottsdale Airport', 'AZ');
INSERT INTO postgis.stations VALUES ('0101000020E61000000F0BB5A6790B58C0BC96900F7ACE4040', 'KF00', 'Jones Field - Bonham', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C2340C1F113157C05036E50AEFCE4040', 'KCDH', 'Camden / Harrell Field', 'AR');
INSERT INTO postgis.stations VALUES ('0101000020E61000006E4C4F58E2AD5CC008556AF640CF4040', 'KBLH', 'Blythe Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000276BD443340A5DC031B1F9B836D04040', 'KTRM', 'Palm Springs, Jacqueline Cochran Regional Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E61000006666666666F654C037894160E5D04040', 'KCVC', 'Covington Municipal Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CDCCCCCCCCDC57C0B0C91AF510D14040', 'KPRX', 'Paris / Cox Field', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B56CAD2F12F056C0210725CCB4D14040', 'KLLQ', 'Monticello Municipal Airport/Ellis Field', 'AR');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AC5626FC521B55C03524EEB1F4D14040', 'KATL', 'Jackson Atlanta International Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A4703D0AD76B54C0508D976E12D34040', 'KAIK', 'Aiken Municipal Airport', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CDCCCCCCCC1C56C03333333333D34040', 'KCBM', 'Columbus Air Force Base', 'MS');
INSERT INTO postgis.stations VALUES ('0101000020E61000008DD13AAA9A4C58C081785DBF60D34040', 'KGLE', 'Gainesville Municipal Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000BBD05CA7917459C03D0AD7A370D54040', 'KLBB', 'Lubbock International Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E610000053793BC269BB53C05EBA490C02D74040', 'KMYR', 'Myrtle Beach International Airport', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E61000003A234A7B83775DC010E9B7AF03D74040', 'KSNA', 'John Wayne-Orange County Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E61000008EE9094B3C045CC055DE8E705AD84040', 'KDVT', 'Phoenix-Deer Valley Municipal Airport', 'AZ');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AA2A58C01D03B2D7BBDB4040', 'KGYI', 'Sherman/Denison, Grayson County Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000022B8716D9F653C0B29DEFA7C6DB4040', 'KCKI', 'Kingstree Williamsburg Regional Airport', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000EC17EC866D415DC03524EEB1F4DD4040', 'KHMT', 'Hemet-Ryan Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E449D235932155C0DD0720B589E34040', 'KFTY', 'Fulton County Airport-Brown Field', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E610000003B2D7BB3FB454C0C0046EDDCDE34040', 'KIIY', 'Washington-Wilkes County Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DF15C1FF56EC54C0C7116BF129E44040', 'KD73', 'Monroe-Walton County Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E610000031D3F6AFAC825DC0BD3AC780ECE54040', 'KSLI', 'Los Alamitos Army Airfield', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A5315A4755955DC06666666666E64040', 'KTOA', 'Torrance, Zamperini Field Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000889D29745E895DC0799274CDE4E74040', 'KLGB', 'Long Beach Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AA436E861BAE53C03FA9F6E978E84040', 'KCRE', 'North Myrtle Beach Grand Strand Airport', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000EE42739D46205DC0938C9C853DE94040', 'KPSP', 'Palm Springs Regional Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E61000002B8716D9CEC753C0273108AC1CEA4040', 'KHYW', 'Conway Horry County Airport', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000567DAEB6629F58C003780B2428EE4040', 'KCWC', 'Kickapoo Downtown Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E5ED08A7057F5DC08109DCBA9BEF4040', 'KFUL', 'Fullerton Municipal Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E61000008CBB41B4561F56C0A4703D0AD7EF4040', 'KM40', 'Monroe County Airport', 'MS');
INSERT INTO postgis.stations VALUES ('0101000020E6100000BB0F406A131355C03F8C101E6DF04040', 'KPDK', 'Atlanta, De Kalb-Peachtree Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E610000011C7BAB88D665DC042CF66D5E7F24040', 'KAJO', 'Corona Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E61000000000000000505DC03333333333F34040', 'KRIV', 'Riverside / March Air Force Base', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E610000099D87C5C1BD455C0FA7E6ABC74F34040', 'KJFX', 'Jasper Walker County Airport & Bevill Field', 'AL');
INSERT INTO postgis.stations VALUES ('0101000020E610000014ED2AA4FCB657C08E40BCAE5FF44040', 'K4O4', 'Idabel, Mc Curtain County Regional Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C2340C1F112155C0B79C4B7155F54040', 'KMGE', 'Marietta / Dobbins Air Force Base', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E610000033333333333354C0B79C4B7155F54040', 'KMMT', 'McEntire Air National Guard Weather Facility Base', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B0726891ED3C55C01283C0CAA1F54040', 'KPUJ', 'Dallas Paulding County Regional Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000FE0E45813E955DC018213CDA38F64040', 'KHHR', 'Hawthorne Municipal Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E610000091F2936A9F8453C0DE8E705AF0F64040', 'KSUT', 'Brunswick County Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E610000074EFE192E3985DC0C7D79E5912F84040', 'KLAX', 'Los Angeles International Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CFBD874B8E4754C0AA656B7D91F84040', 'KCAE', 'Columbia Metropolitan Airport', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000FE0E45813E1958C08DD13AAA9AF84040', 'KDUA', 'Durant, Eaker Field Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E61000000CC85EEFFED454C0210725CCB4F94040', 'KAHN', 'Athens Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E610000004ADC090D55B5DC020B58993FBF94040', 'KRAL', 'Riverside Municipal Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A5315A47558555C01D03B2D7BBFB4040', 'KGAD', 'Gadsden Municipal Airport', 'AL');
INSERT INTO postgis.stations VALUES ('0101000020E61000003ECBF3E0EE1E54C01D03B2D7BBFB4040', 'KSSC', 'Shaw Air Force Base', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E61000006475ABE7A43F54C0E3FC4D2844FC4040', 'KCUB', 'Columbia - Jim Hamilton L.B. Owens Airport', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E610000059DDEA39E9675DC094A46B26DFFC4040', 'KCNO', 'Chino Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DD0720B5899F58C0F0C4AC1743FD4040', 'KSPS', 'Wichita Falls, Sheppard Air Force Base', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E610000002F1BA7EC1EA54C012BD8C62B9FD4040', 'KWDR', 'Winder-Barrow Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E610000045F5D6C056FD54C03DF20703CFFD4040', 'KLZU', 'Gwinnett County Airport-Briscoe Field', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C976BE9F1A1754C08FC2F5285CFF4040', 'KSMS', 'Sumter Airport', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E61000000EBE30992A2655C0BD1DE1B4E0014140', 'KRYY', 'Cobb County International Airport - McCollum Field', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E610000074EFE192E39C5DC0D925AAB706024140', 'KSMO', 'Santa Monica Municipal Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E61000003BFC3559A3925DC010E9B7AF03034140', 'KCQT', 'Los Angeles / USC Campus Downtown', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E61000006F2F698CD6B95AC0AC730CC85E034140', 'KONM', 'Socorro Municipal Airport', 'NM');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B62DCA6C909957C0E76F422102064140', 'KDEQ', 'De Queen, J Lynn Helms Sevier County Airport', 'AR');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A52C431CEB645DC049BA66F2CD064140', 'KONT', 'Ontario International Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E610000072FE261422825DC04963B48EAA0A4140', 'KEMT', 'El Monte', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000849ECDAACF4F5DC0ABE7A4F78D0B4140', 'KSBD', 'San Bernardino Intl. Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F25EB532E1715DC016359886E10B4140', 'KPOC', 'Brackett Field Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E610000000917EFB3A4457C00612143FC60C4140', 'KADF', 'Dexter B Florence Memorial Field', 'AR');
INSERT INTO postgis.stations VALUES ('0101000020E61000003C66A032FE6B5DC00AF4893C490E4140', 'KCCB', 'Cable Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D82AC1E2703655C07BF7C77BD50E4140', 'KVPC', 'Cartersville Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E0B9F770C9C75DC09626A5A0DB0F4140', 'KNTD', 'Point Mugu, Naval Air Warfare Center', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E4141DC9E5535BC01B0DE02D90104140', 'KJTC', 'Springerville Municipal Airport', 'AZ');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A4703D0AD74758C0B43C0FEECE124140', 'K1F0', 'Ardmore Downtown Executive Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E61000006002B7EEE66D59C004E275FD82154140', 'KPVW', 'Plainview, Hale County Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B2BAD573D2FB56C06666666666164140', 'KPBF', 'Pine Bluff, Grider Field Airport', 'AR');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C05B2041F1E354C058569A9482164140', 'KJCA', 'Jackson County Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E61000003D0AD7A370D553C0BA490C022B174140', 'KMAO', 'Marion County Airport', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E23B31EBC5EE53C0E36BCF2C09184140', 'KFLO', 'Florence Regional Airport', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E610000033A7CB6262975DC004FF5BC98E194140', 'KBUR', 'Burbank - Bob Hope Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E61000000CC85EEFFECC5DC0617138F3AB194140', 'KOXR', 'Oxnard Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E610000053793BC2699F5DC033333333331B4140', 'KVNY', 'Van Nuys Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A5315A4755C55DC01D03B2D7BB1B4140', 'KCMA', 'Camarillo Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E610000063B48EAA26D258C094A46B26DF1C4140', 'KF05', 'Vernon, Wilbarger County Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000009C8A54185B9055C0D3307C444C1D4140', 'K8A0', 'Albertville Municipal Airport', 'AL');
INSERT INTO postgis.stations VALUES ('0101000020E61000006002B7EEE68954C06475ABE7A41F4140', 'KGRD', 'Greenwood County Airport', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A99999999995DC00000000000204140', 'KWHP', 'Los Angeles, Whiteman Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E61000009D7EF55DB6D55BC01036E103E0204140', 'KPAN', 'Payson Airport', 'AZ');
INSERT INTO postgis.stations VALUES ('0101000020E6100000105839B4C8365DC0A857CA32C4214140', 'KL35', 'Big Bear City Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E61000009C8A54185B805BC03524EEB1F4214140', 'KSOW', 'Show Low Regional Airport', 'AZ');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B3295778977953C0751F80D426224140', 'KILM', 'Wilmington International Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E17A14AE473156C0D1AE42CA4F224140', 'KTUP', 'Tupelo Regional Airport', 'MS');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F4FDD478E9B655C0B537F8C264224140', 'KCMD', 'Cullman Regional Folsom Field', 'AL');
INSERT INTO postgis.stations VALUES ('0101000020E610000077A1B94E23F554C0B43C0FEECE224140', 'KGVL', 'Gainesville, Gilmer Memorial Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F6285C8FC2AD53C05E807D74EA224140', 'KCPC', 'Whiteville, Columbus County Municipal Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000581CCEFC6AE655C087DC0C37E0234140', 'K1M4', 'Haleyville, Posey Field Airport', 'AL');
INSERT INTO postgis.stations VALUES ('0101000020E61000005C8FC2F5282454C03108AC1C5A244140', 'KCDN', 'Camden Woodward Field', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F33CB83B6B095DC03659A31EA2254140', 'KNXP', 'Twentynine Palms SELF Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000696FF085C9A056C03C4ED1915C264140', 'KCKM', 'Fletcher Field, Clarksdale', 'MS');
INSERT INTO postgis.stations VALUES ('0101000020E6100000FE0E45813E4158C0E65C8AABCA264140', 'KADM', 'Ardmore Municipal Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000295C8FC2F56854C0643BDF4F8D274140', 'KEOE', 'Newberry County Airport', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E61000007EC68503211B55C00FB9196EC0274140', 'KCNI', 'Canton, Cherokee County Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E5D022DBF94654C0B81E85EB51284140', 'KFDW', 'Winnsboro/Fairfield County Airport', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E61000004694F6065FC854C07AC7293A922B4140', 'K18A', 'Franklin County Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E61000005E807D74EABE58C095B7239C162C4140', 'KFDR', 'Frederick Municipal Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000BF4351A04F4A55C0F819170E842C4140', 'KRMG', 'Rome, R.B. Russell Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E61000004CA60A46257956C04A0C022B872E4140', 'KPMU', 'Batesville Panola County', 'MS');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F5673F5244D459C0B0C91AF510314140', 'KCVS', 'Cannon Air Force Base / Clovis', 'NM');
INSERT INTO postgis.stations VALUES ('0101000020E6100000EE42739D466256C01AA3755435314140', 'KUOX', 'University-Oxford Airport', 'MS');
INSERT INTO postgis.stations VALUES ('0101000020E6100000560E2DB29D0754C0DD24068195334140', 'KHVS', 'Hartsville Regional Airport', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E9482EFF21C559C0035B25581C364140', 'KCVN', 'Clovis Municipal Airport', 'NM');
INSERT INTO postgis.stations VALUES ('0101000020E61000000725CCB4FDF55DC0D13FC1C58A364140', 'KSBA', 'Santa Barbara Municipal Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E610000072FE2614221259C01F85EB51B8364140', 'KCDS', 'Childress Municipal Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000001B12F758FAF853C0132C0E677E394140', 'KUDG', 'Darlington County Jetport Airport', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C503CAA65C875BC0601F9DBAF2394140', 'KTYL', 'Taylor Airport', 'AZ');
INSERT INTO postgis.stations VALUES ('0101000020E61000003AE97DE36B1D55C08369183E223A4140', 'KJZP', 'Jasper Pickens County Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CE1951DA1B3C55C0984C158C4A3A4140', 'KCZL', 'Calhoun Tom B. David Field Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E61000003D0AD7A3707D58C0E3FC4D28443C4140', 'KDUC', 'Duncan, Halliburton Field Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000556AF6402B6E55C07F87A2409F3C4140', 'K4A9', 'Fort Payne, Isbell Field Airport', 'AL');
INSERT INTO postgis.stations VALUES ('0101000020E610000063B48EAA264657C04CC3F011313D4140', 'KHOT', 'Hot Springs, Memorial Field Airport', 'AR');
INSERT INTO postgis.stations VALUES ('0101000020E61000004C546F0D6CAD54C02B4D4A41B73F4140', 'KAND', 'Anderson County Airport', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000BA6B09F9A0E354C039454772F93F4140', 'KAJR', 'Cornelia Habersham County Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F853E3A59B7C54C037894160E5404140', 'KLUX', 'Laurens County Airport', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F5673F5244585BC091442FA358424140', 'KSJN', 'St. Johns Industrial Airpark', 'AZ');
INSERT INTO postgis.stations VALUES ('0101000020E6100000295C8FC2F58C57C0D9942BBCCB454140', 'KMEZ', 'Mena Intermountain Municipal Airport', 'AR');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A5315A47556557C06666666666464140', 'KMWT', 'Mount Ida', 'AR');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AA9A58C08FC2F5285C474140', 'KLAW', 'Lawton Municipal Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F415A4198B965CC0EA95B20C71484140', 'KHII', 'Havasu City Airport', 'AZ');
INSERT INTO postgis.stations VALUES ('0101000020E610000042CF66D5E76A5DC0F1F44A5986484140', 'KGXA', 'Gray Butte Field Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E61000003B191C25AF1E57C056F146E6914B4140', 'KSUZ', 'Saline County Regional Airport', 'AR');
INSERT INTO postgis.stations VALUES ('0101000020E610000034A2B437F8D254C0CE88D2DEE04B4140', 'KTOC', 'Toccoa Le Tourneau Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E61000000664AF777F585DC0314278B4714C4140', 'KVCV', 'Victorville, Southern California Logistics Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F5673F5244E456C0CDCCCCCCCC4C4140', 'KSGT', 'Stuttgart Municipal Airport', 'AR');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A999999999958C0CDCCCCCCCC4C4140', 'KFSI', 'Fort Sill', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B7EEE6A90EA553C0DA722EC5554D4140', 'KEYF', 'Curtis L Brown Jr. Field Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B0389CF9D5045EC02F51BD35B04D4140', 'KIZA', 'Santa Ynez Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E5D022DBF9EE53C0560E2DB29D4F4140', 'KBBP', 'Marlboro County Jetport', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E61000002C0E677E35855DC08DD13AAA9A504140', 'KPMD', 'Palmdale Production Flight Plant', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E61000002F6EA301BC2155C0D49AE61DA7504140', 'K49A', 'Gilmer County Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000EE42739D46B255C075B0FECF61524140', 'KHSV', 'Huntsville International / Jones Field', 'AL');
INSERT INTO postgis.stations VALUES ('0101000020E61000008C15359886B55AC0B4E55C8AAB524140', 'KBRG', 'Belen Regional Airport', 'NM');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E5ED08A7051B5CC0ACC5A70018534140', 'KPRC', 'Prescott, Love Field', 'AZ');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C2340C1F11D158C03333333333534140', 'KLTS', 'Altus Air Force Base', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E61000007CD5CA845FBC55C02367614F3B544140', 'KDCU', 'Decatur, Pryor Field', 'AL');
INSERT INTO postgis.stations VALUES ('0101000020E61000008E01D9EBDD1D5EC0B79C4B7155554140', 'KLPC', 'Lompoc Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E61000005F419AB168B854C0CBDB114E0B564140', 'KCEU', 'Clemson-Oconee County Airport', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000556AF6402B9656C05E11FC6F25574140', 'KUTA', 'Tunica Municipal Airport', 'MS');
INSERT INTO postgis.stations VALUES ('0101000020E6100000494BE5ED086954C05DFE43FAED574140', 'K35A', 'Union County Airport - Troy Shelton Field', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D8817346945255C0E3A59BC420584140', 'K9A5', 'Barwick Lafayette Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E61000002E043928618055C0CE3637A627584140', 'K4A6', 'Scottsboro Municipal Airport', 'AL');
INSERT INTO postgis.stations VALUES ('0101000020E610000080B74082E24153C0B0389CF9D5584140', 'KNJM', 'Bogue Field Marine Corps Auxiliary Field', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E61000007D0569C6A2D558C04C546F0D6C594140', 'KAXS', 'Altus/Quartz Mountain Regional Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F12900C6335C53C0AE122C0E675A4140', 'KNCA', 'MCAS New River', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CE8DE9094B4E58C0E5ED08A7055B4140', 'KPVJ', 'Pauls Valley Municipal Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E61000006891ED7C3FFD53C025068195435B4140', 'KCQW', 'Cheraw Municipal Lynch Bellinger Field', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000842A357BA03755C08E40BCAE5F5C4140', 'KDNN', 'Dalton Municipal Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E61000001F85EB51B83654C0068195438B5C4140', 'KLKR', 'Lancaster County-mc Whirter Field', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E61000008C101E6D1C0F57C0FE7DC685035D4140', 'KLIT', 'Little Rock, Adams Field', 'AR');
INSERT INTO postgis.stations VALUES ('0101000020E610000065A54929E8245EC07632384A5E5D4140', 'KVBG', 'Lompoc, Vandenberg Air Force Base', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E61000006EA301BC052A53C036B05582C55D4140', 'KMRH', 'Beaufort Smith Field', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AB048BC3998D5DC03468E89FE05E4140', 'KWJF', 'General Wm J Fox Airfield', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E610000083FA96395DAE5DC0417DCB9C2E5F4140', 'KSDB', 'Sandberg', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E610000083FA96395DE655C025E99AC9375F4140', 'KMSL', 'Muscle Shoals, North West Alabama Regional Airport', 'AL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B98D06F0169854C0454772F90F614140', 'KGYH', 'Greenville-Donaldson Center Airport', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000672783A3E4A75CC0BC9179E40F624140', 'KEED', 'Needles Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000068195438B4C54C0A245B6F3FD644140', 'KDCM', 'Chester Catawba Regional Airport', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E61000007AC7293A92D753C0DA5548F949654140', 'KMEB', 'Laurinburg Maxton Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E61000002237C30DF82A58C010CCD1E3F7664140', 'KADH', 'Ada Municipal Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DEAB5626FCAC54C0DD5ED218AD674140', 'KLQK', 'Pickens County Airport', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C0266BD4431057C0A67EDE54A46A4140', 'KORK', 'North Little Rock Municipal Airport', 'AR');
INSERT INTO postgis.stations VALUES ('0101000020E6100000289B7285776753C04963B48EAA6A4140', 'KOAJ', 'Jacksonville, Albert J Ellis Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AE122C0E679654C02A91442FA36C4140', 'KGMU', 'Greenville Downtown Airport', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E610000072FE261422F25BC0CDCCCCCCCC6C4140', 'KSEZ', 'Sedona Airport', 'AZ');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A3AF20CD58325DC0F0C4AC17436D4140', 'KDAG', 'Barstow-Daggett Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000401361C3D3FF54C0E8D9ACFA5C6D4140', 'KDZJ', 'Blairsville Airport', 'GA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000865AD3BCE39459C02041F163CC6D4140', 'KHRX', 'Hereford Municipal Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000562B137EA9A355C0FC8C0B07426E4140', 'KMDQ', 'Huntsville, Madison County Executive Airport', 'AL');
INSERT INTO postgis.stations VALUES ('0101000020E610000092B3B0A71DF257C045F0BF95EC704140', 'KMLC', 'McAlester Regional Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E610000072FE2614228E54C077A1B94E23714140', 'KGSP', 'Greer, Greenville-Spartanburg Airport', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E61000008577B988EF1C5EC0FC00A43671724140', 'KSMX', 'Santa Maria Public Airport/Capt G Allan Hancock Field', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E61000006DC5FEB27BF053C0029A081B9E724140', 'KRCZ', 'Rockingham-Hamlet Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E61000001895D409683853C02D26361FD7724140', 'KNKT', 'Cherry Point Marine Corps Air Station', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B4C876BE9F2656C085EB51B81E754140', 'KCRX', 'Corinth', 'MS');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A999999990957C0B79C4B7155754140', 'KLRF', 'Little Rock Air Force Base', 'AR');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CDCCCCCCCC7C54C0B79C4B7155754140', 'KSPA', 'Spartanburg Memorial', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C74B378941785DC02FDD240681754140', 'KEDW', 'Edwards Air Force Base', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F06DFAB31F295AC096ECD808C4774140', 'KSXU', 'Santa Rosa Route 66 Airport', 'NM');
INSERT INTO postgis.stations VALUES ('0101000020E61000000113B875379753C0DB334B02D47C4140', 'KCTZ', 'Sampson County Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E610000083FA96395D7256C0D3307C444C7D4140', 'KOLV', 'Olive Branch Airport', 'MS');
INSERT INTO postgis.stations VALUES ('0101000020E61000008FAA2688BA7F5AC02EE23B31EB7D4140', 'K0E0', 'Moriarty Municipal Airport', 'NM');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AF08FEB7924354C0446E861BF07D4140', 'KUZA', 'Rock Hill - York County Airport', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B81E85EB51B853C058AD4CF8A57E4140', 'KFAY', 'Fayetteville Regional Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E61000008FC2F5285CC358C058AD4CF8A57E4140', 'KHBR', 'Hobart Municipal Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DA38622D3E775DC0A6F27684D37E4140', 'K9L2', 'Edwards Air Force Auxiliary North Base', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C66D3480B77E53C0F27B9BFEEC7F4140', 'KDPL', 'Duplin County Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AA6A5AC00000000000804140', 'KCQC', 'Clines Corners', 'NM');
INSERT INTO postgis.stations VALUES ('0101000020E61000002B4D4A41B72754C043FF04172B824140', 'KEQY', 'Monroe, Monroe Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E61000002254A9D9030554C0FC1D8A027D824140', 'KAFP', 'Anson County Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E61000009D8026C2862357C05F984C158C824140', 'KCXW', 'Conway - Cantrell Field', 'AR');
INSERT INTO postgis.stations VALUES ('0101000020E6100000EF0390DAC4A757C0F4A62215C6824140', 'KRKR', 'Poteau, Robert S Kerr Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A999999991D53C097A8DE1AD8824140', 'KNBT', 'Piney Island, Bt-11 Bombing Range', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E610000072FE261422AE5BC0B329577897834140', 'KINW', 'Winslow Municipal Airport', 'AZ');
INSERT INTO postgis.stations VALUES ('0101000020E61000000000000000E053C0E3FC4D2844844140', 'KHFF', 'Mackall U.S. Army Airfield', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CDCCCCCCCC4C55C0E3FC4D2844844140', 'KCHA', 'Chattanooga, Lovell Field', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E61000009E0C8E9257A75AC0B79C4B7155854140', 'KABQ', 'Albuquerque International Airport', 'NM');
INSERT INTO postgis.stations VALUES ('0101000020E610000025AFCE31207F56C0D717096D39874140', 'KMEM', 'Memphis International Airport', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E61000006ABC749318A455C01DC9E53FA4874140', 'KFYM', 'Fayetteville Municipal Airport', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A99999999895DC0EACF7EA488884140', 'KMHV', 'Mojave', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E5ED08A7054353C0713D0AD7A3884140', 'KEWN', 'New Bern, Craven County Regional Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AB9509BFD47D58C0C7681D554D8C4140', 'KCHK', 'Chickasha Municipal Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AB9509BFD4275EC037C30DF8FC8C4140', 'KL52', 'Oceano County Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E466B8019FBB53C0E25817B7D1904140', 'KFBG', 'Fort Bragg / Simmons Army Airfield', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E61000003ECBF3E0EE8E56C0B0C91AF510914140', 'KAWM', 'West Memphis Municipal Airport', 'AR');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CE1951DA1B9C5DC0E17A14AE47914140', 'KTSP', 'Tehachapi Municipal Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E610000046425BCEA5EA5BC074EACA6779924140', 'KFLG', 'Flagstaff Pulliam Airport', 'AZ');
INSERT INTO postgis.stations VALUES ('0101000020E61000007B14AE47E1B25AC0C3F5285C8F924140', 'KAEG', 'Albuquerque, Double Eagle II Airport', 'NM');
INSERT INTO postgis.stations VALUES ('0101000020E61000006B9A779CA2C355C096B20C71AC934140', 'KGZS', 'Pulaski Abernathy Field Airport', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C0046EDDCDA35CC05C8FC2F528944140', 'KIFP', 'Bullhead International Airport', 'AZ');
INSERT INTO postgis.stations VALUES ('0101000020E61000000473F4F8BDF95AC0695721E527954140', 'KGNT', 'Grants-Milan Municipal Airport', 'NM');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AE47E17A140E56C0F6285C8FC2954140', 'KSNH', 'Savannah/Hardin Co.', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E61000008A7615527EC053C0B554DE8E70964140', 'KPOB', 'Pope Air Force Base', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B1BFEC9E3C8455C01F85EB51B8964140', 'KBGF', 'Winchester Municipal Airport', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000780B24287EE659C033F9669B1B974140', 'KTCC', 'Tucumcari Municipal Airport', 'NM');
INSERT INTO postgis.stations VALUES ('0101000020E61000007AC2120F28F754C070B1A206D3984140', 'KRHP', 'Andrews-Murphy Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000728A8EE4F24954C021C8410933994140', 'KAKH', 'Gastonia Municipal Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E610000000000000002056C09A99999999994140', 'KSZY', 'Selmer/Robert Sibley', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E61000004CA60A46255956C051DA1B7C619A4140', 'KFYE', 'Somerville - Fayette County Airport', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C3F5285C8F4256C07B14AE47E19A4140', 'KM08', 'Bolivar/William L Whitehurst', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D0D556EC2F3355C0508D976E129B4140', 'KRZR', 'Cleveland Regional Jetport', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E610000026AAB706B63C54C0BAA0BE654E9B4140', 'KCLT', 'Charlotte / Douglas International Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E61000008FA50F5D50EF56C0F302ECA3539B4140', 'KSRC', 'Searcy Municipal Airport', 'AR');
INSERT INTO postgis.stations VALUES ('0101000020E61000006002B7EEE66D59C05C8FC2F5289C4140', 'KAMA', 'Amarillo International Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000008DB454DE8EDA54C0D44334BA839C4140', 'K1A5', 'Macon County Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A4703D0AD7E752C012BD8C62B99D4140', 'KHSE', 'Hatteras, Mitchell Field', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A99999999D953C07D96E7C1DD9D4140', 'KSOP', 'Pinehurst/Southern Pines, Moore County Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E61000002315C61682D055C01990BDDEFD9D4140', 'K2M2', 'Lawrenceburg-Lawrence County Airport', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E610000026AAB706B6285EC018213CDA389E4140', 'KSBP', 'San Luis Obispo County-Mc Chesney Field', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E61000003CBD5296215E58C0BA490C022B9F4140', 'KOUN', 'Norman / Max Westheimer', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E61000008A027D224F6654C030F0DC7BB8A04140', 'KEHO', 'Shelby Municipal Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E610000043C5387F134657C05B7C0A80F1A04140', 'KRUE', 'Russelville Municipal Airport', 'AR');
INSERT INTO postgis.stations VALUES ('0101000020E61000002B4D4A41B77B5CC00CC85EEFFEA04140', 'KIGM', 'Kingman Airport', 'AZ');
INSERT INTO postgis.stations VALUES ('0101000020E610000033333333332B58C06C5B94D920A34140', 'KSRE', 'Seminole Municipal Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000289B728577275DC0E3FC4D2844A44140', 'KBYS', 'Fort Irwin/Barstow, Bicycle Lake Army Airfield', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B46257502C657C005A3923A01A54140', 'KGZL', 'Stigler', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000260D24DE700C5CC0286B8AB619A74140', 'KCMR', 'Williams/Clark Memorial Airport', 'AZ');
INSERT INTO postgis.stations VALUES ('0101000020E61000001AC05B2041CD54C0386744696FA84140', 'K24A', 'Jackson County Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000289B7285776753C04963B48EAAAA4140', 'KISO', 'Kinston Regional Jetport at Stallings Field', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E61000003ACC9717609757C0A69BC420B0AA4140', 'KFSM', 'Fort Smith Regional Airport', 'AR');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D8648D7A887C53C06397A8DE1AAC4140', 'KGSB', 'Seymour-Johnson Air Force Base', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DEC83CF207CD58C06FBBD05CA7AD4140', 'KCSM', 'Clinton-Sherman Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E61000003997E2AAB27756C06FBBD05CA7AD4140', 'KNQA', 'Millington Municipal Airport', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AAD4EC81563C58C012BD8C62B9AD4140', 'KSNL', 'Shawnee Municipal Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E610000030815B77F3AE53C023F8DF4A76B04140', 'KHRJ', 'Erwin, Harnett County Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E610000016FBCBEEC98F55C0713D0AD7A3B04140', 'KTHA', 'Tullahoma Regional Airport/William Northern Field', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000581CCEFC6A6658C00473F4F8BDB14140', 'KOKC', 'Oklahoma City, Will Rogers World Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D734EF38452D54C02EC55565DFB14140', 'KJQF', 'Concord Regional Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B22E6EA3012455C0B459F5B9DAB24140', 'KMMI', 'Athens McMinn County Airport', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E61000005D50DF32A70954C0B79C4B7155B54140', 'KVUJ', 'Albemarle, Stanly County Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D8648D7A885858C0B79C4B7155B54140', 'KTIK', 'Tinker Air Force Base', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A4703D0AD77B54C0A6F27684D3B64140', 'KFQD', 'Rutherford County-Marchman Field Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000053411363CD958C0F38E537424B74140', 'KELK', 'Elk City Regional Business Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E61000006666666666A254C0C8EA56CF49B74140', 'KAVL', 'Asheville Regional Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000842A357BA0C35DC0FA9B508880B74140', 'KBFL', 'Bakersfield, Meadows Field Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E610000081785DBF60B357C0C7D79E5912B84140', 'KJSV', 'Sallisaw Municipal Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F6285C8FC27D53C042EC4CA1F3BA4140', 'KGWW', 'Goldsboro-Wayne Municipal Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E61000009C8A54185B8058C014AE47E17ABC4140', 'KRQO', 'El Reno Regional Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E61000003255302AA93B55C0D93D7958A8BD4140', 'K2A0', 'Dayton', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B1F9B836544A54C0BD00FBE8D4BD4140', 'KIPJ', 'Lincolnton-Lincoln County Regional Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CD920035B57458C074EACA6779BE4140', 'KRCE', 'Clarence E Page Municipal Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E610000036E50AEF72B355C0CD069964E4C04140', 'KLUG', 'Ellington Airport', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B41F2922C3325BC04C89247A19C14140', 'KGUP', 'Gallup Municipal Airport', 'NM');
INSERT INTO postgis.stations VALUES ('0101000020E61000002237C30DF8BA58C094A46B26DFC44140', 'KCLK', 'Clinton, Clinton Regional Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E61000001B12F758FA9853C00C59DDEA39C54140', 'KJNX', 'Smithfield, Johnston County Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E61000007A53910A636958C0F0C4AC1743C54140', 'KPWA', 'Oklahoma City, Wiley Post Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E23B31EBC5AA58C012BD8C62B9C54140', 'KOJA', 'Weatherford, Thomas P Stafford Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E61000006E6E4C4F581855C00490DAC4C9C54140', 'KMNV', 'Monroe County Airport', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBBCB55C06666666666C64140', 'KMRC', 'Columbia / Maury County', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B81E85EB519C55C0F2B0506B9AC74140', 'KSYI', 'Shelbyville Municipal Airport', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E61000001A868F8829FD52C09D853DEDF0C74140', 'K7W6', 'Hyde County Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000417DCB9C2E4353C0F0332E1C08C94140', 'KOCW', 'Washington, Warren Field Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F6285C8FC26556C00AD7A3703DCA4140', 'KM04', 'Covington Municipal', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E61000000D897B2C7DC653C0C3F5285C8FCA4140', 'KTTA', 'Sanford-Lee County Regional Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AA3A56C06B48DC63E9CB4140', 'KMKL', 'Jackson, McKellar-Sipes Regional Airport', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E9B7AF03E71C57C0068195438BCC4140', 'KCCA', 'Clinton Memorial Airfield', 'AR');
INSERT INTO postgis.stations VALUES ('0101000020E6100000936FB6B9316D58C037E0F3C308CD4140', 'KHSD', 'Sundance Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C0CFB87020865AC0276BD44334CE4140', 'KSAF', 'Santa Fe County Municipal Airport', 'NM');
INSERT INTO postgis.stations VALUES ('0101000020E6100000FD4D2844C03F59C04AD235936FCE4140', 'KPPA', 'Pampa, Perry Lefors Field Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DBBFB2D2A45853C07DE882FA96D14140', 'KPGV', 'Pitt-Greenville Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E89FE06245CB56C09A99999999D14140', 'KM19', 'Newport Municipal Airport', 'AR');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CFA0A17F822154C03C889D2974D24140', 'KRUQ', 'Rowan County Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F5673F5244445BC03333333333D34140', 'KRQE', 'Window Rock Airport', 'AZ');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E17A14AE47F953C03997E2AAB2D34140', 'KHBI', 'Asheboro Municipal Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E275FD82DD485AC04EB4AB90F2D34140', 'KLVS', 'Las Vegas Municipal Airport', 'NM');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DC68006F810C56C0158C4AEA04D44140', 'KPVE', 'Lexington-Parsons Beech River Regional Airport', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E5ED08A705D757C095B7239C16D44140', 'KMKO', 'Muskogee-Davis Regional Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A99999999F952C0B79C4B7155D54140', 'K2DP', 'Dare County Gunnery Range', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E610000026AAB706B6FC57C004E275FD82D54140', 'KOKM', 'Okmulgee Municipal Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E61000009C50888043285EC0C4CE143AAFD54140', 'KPRB', 'Paso Robles Municipal Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E61000005C8FC2F5286C5DC09626A5A0DBD74140', 'KNID', 'China Lake, Naval Air Facility', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E17A14AE475959C0295C8FC2F5D84140', 'KBGD', 'Borger, Hutchinson County Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000598638D6C57555C01A51DA1B7CD94140', 'KRNC', 'McMinnville Warren County Memorial Airport', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DCD7817346E053C052499D8026DA4140', 'KSCR', 'Siler City Municipal Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E61000000664AF777F3458C062F3716DA8DC4140', 'KCQB', 'Chandler Municipal Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A99999999E956C07D96E7C1DDDD4140', 'KBVX', 'Batesville Regional Airport', 'AR');
INSERT INTO postgis.stations VALUES ('0101000020E610000023F8DF4A765854C0F437A11001DF4140', 'KHKY', 'Hickory Regional Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E61000004260E5D022CF5DC0569A94826EDF4140', 'KDLO', 'Delano Municipal Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E61000000DE02D90A03C54C02849D74CBEE14140', 'KSVH', 'Statesville Municipal Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E610000036E50AEF721354C00E4A9869FBE34140', 'KEXX', 'Lexington, Davidson County Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E61000009B5AB6D617FF54C03815A930B6E84140', 'KTYS', 'Knoxville, McGhee Tyson Airport', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D482177D056754C0541D7233DCE84140', 'KMRN', 'Morganton-Lenoir Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000695721E527A956C050C763062AEB4140', 'KJBR', 'Jonesboro Municipal Airport', 'AR');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AE47E17A145A58C0BE13B35E0CED4140', 'KGOK', 'Guthrie Municipal Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000695721E5277953C03D0AD7A370ED4140', 'KRWI', 'Rocky Mount-Wilson Regional Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E61000008369183E22E254C0617138F3ABED4140', 'KGKT', 'Sevierville Gatlinburg - Pigeon Forge Airport', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B0389CF9D58059C0D9942BBCCBED4140', 'KDUX', 'Dumas, Moore County Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000003ECBF3E0EE9A58C03B191C25AFEE4140', 'KJWG', 'Watonga Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E61000004A24D1CB289855C0D5264EEE77F04140', 'KMBT', 'Murfreesboro Municipal Airport', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C9B08A3732915AC0224F92AE99F04140', 'KLAM', 'Los Alamos Airport', 'NM');
INSERT INTO postgis.stations VALUES ('0101000020E610000052B81E85EB4159C06F1283C0CAF14140', 'KBPC', 'Mesa Vista Ranch AP', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E61000002B1895D409B253C04A41B79734F24140', 'KRDU', 'Raleigh-Durham International Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A999999991959C03333333333F34140', 'KHHF', 'Canadian, Hemphill County Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CDCCCCCCCCEC52C0B79C4B7155F54140', 'KMQI', 'Manteo / Dare County Regional', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E61000004E621058392C55C08A3C49BA66F64140', 'KRKW', 'Rockwood Municipal Airport', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D5B2B5BE48C057C06DCA15DEE5F64140', 'KTQH', 'Tahlequah Municipal Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C2FA3F87F96253C039454772F9F74140', 'KETC', 'Tarboro-Edgecombe Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E17A14AE477556C04E452A8C2DF84140', 'KHKA', 'Blytheville Municipal Airport', 'AR');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F59CF4BEF1095CC08CF337A110F94140', 'KGCN', 'Grand Canyon National Park Airport', 'AZ');
INSERT INTO postgis.stations VALUES ('0101000020E61000007AA52C431CB75CC0E17A14AE47F94140', 'KBVU', 'Boulder City Municipal Airport', 'NV');
INSERT INTO postgis.stations VALUES ('0101000020E61000002FC03E3A753158C0B62DCA6C90F94140', 'KCUH', 'Cushing Municipal Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E61000003D0AD7A3704555C0E8DEC325C7F94140', 'KCSV', 'Crossville Memorial-Whitson Field Airport', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E61000000490DAC4C9F754C02B137EA99FFB4140', 'KDKX', 'Knoxville Downtown Airport', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000118DEE2076C85CC0B7D100DE02FD4140', 'KHND', 'Las Vegas - Henderson Executive Airport', 'NV');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A999999995956C00000000000004240', 'KDYR', 'Dyersburg Municipal Airport', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E17A14AE47A155C077A1B94E23014240', 'KMQY', 'Smyrna Airport', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000103B53E8BC8A57C0C5E6E3DA50014240', 'KFYV', 'Fayetteville, Drake Field', 'AR');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AAEA52C08369183E22024240', 'KFFA', 'Kill Devil Hills, First Flight Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E61000003ECBF3E0EE0E55C05E807D74EA024240', 'KOQT', 'Oak Ridge', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A54E4013619553C0C2DD59BBED024240', 'KLHZ', 'Franklin County Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E5ED08A705A359C00282397AFC024240', 'KDHT', 'Dalhart Municipal Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C7681D554D2453C0CFBD874B8E034240', 'KEDE', 'Edenton, Northeastern Regional Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F5673F5244C45DC0E3FC4D2844044240', 'KPTV', 'Porterville Municipal Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E8D9ACFA5CFF57C0EF38454772054240', 'KRVS', 'Tulsa - Jones Jr. Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B81E85EB51DE53C019CA897615064240', 'KBUY', 'Burlington Alamance Regional Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E61000002EFF21FDF66155C057EC2FBB27074240', 'KSRB', 'Sparta Upper Cumberland Regional Airport', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A60A462575CA5CC0459E245D33094240', 'KLAS', 'Las Vegas, McCarran International Airport', 'NV');
INSERT INTO postgis.stations VALUES ('0101000020E6100000990D32C9C81D56C07A53910A630B4240', 'KHZD', 'Huntingdon Carroll County Airport', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E61000006E8B321B64FC53C014AE47E17A0C4240', 'KGSO', 'Greensboro, Piedmont Triad International Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E610000099D87C5C1BAC55C025E99AC9370F4240', 'KBNA', 'Nashville International Airport', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C2FA3F87F9BA56C09CDCEF5014104240', 'KARG', 'Walnut Ridge Regional Airport', 'AR');
INSERT INTO postgis.stations VALUES ('0101000020E610000088F4DBD781DB55C04694F6065F104240', 'KM02', 'Dickson Municipal Airport', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E610000075B0FECF610E54C0B0C91AF510114240', 'KINT', 'Winston Salem, Smith Reynolds Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000327216F6B44558C0E960FD9FC3144240', 'KSWO', 'Stillwater Regional Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E610000019E25817B70958C0917EFB3A70164240', 'KOWP', 'William R Pogue Municipal Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000289B7285778757C01630815B77174240', 'KASG', 'Springdale Municipal', 'AR');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B48EAA2688B855C0327216F6B4174240', 'KJWN', 'John C Tune Airport', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E610000039D6C56D349455C04694F6065F184240', 'KM54', 'Lebanon Municipal Airport', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E610000084D89942E7B354C030D80DDB16194240', 'KGCY', 'Greeneville-Greene County Municipal Airport', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E610000018601F9DBAF857C0E17A14AE47194240', 'KTUL', 'Tulsa International Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000791EDC9DB56954C09A25016A6A194240', 'KTNB', 'Watauga County Hospital Heliport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E61000003ECBF3E0EE9E57C09A99999999194240', 'KSLG', 'Siloam Springs, Smith Field Airport', 'AR');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CAC342AD69CC5CC0F38E5374241B4240', 'KVGT', 'North Las Vegas Airport', 'NV');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A5315A47554554C01D03B2D7BB1B4240', 'KUKF', 'North Wilkesboro, Wilkes County Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E61000009CC420B0724C59C03F355EBA491C4240', 'KE42', 'Major Samuel B Cornelius Field Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000EA5BE674598256C0EAB298D87C1C4240', 'KTKX', 'Kennett Memorial Airport', 'MO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DE02098A1FD557C014967840D91C4240', 'KH71', 'Mid-America Industrial Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E610000072FE261422C25CC07D96E7C1DD1D4240', 'KLSV', 'Nellis Air Force Base', 'NV');
INSERT INTO postgis.stations VALUES ('0101000020E610000097FF907EFB0A53C014ED2AA4FC204240', 'KECG', 'Elizabeth City C/G Regional Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E61000006002B7EEE64957C0132C0E677E214240', 'KHRO', 'Harrison, Boone County Airport', 'AR');
INSERT INTO postgis.stations VALUES ('0101000020E610000014ED2AA4FCBE53C014AE47E17A244240', 'KTDF', 'Roxboro, Person County Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B515FBCBEE9357C053AEF02E17254240', 'KXNA', 'Northwest Arkansas Regional Airport', 'AR');
INSERT INTO postgis.stations VALUES ('0101000020E61000002DCF83BBB3DE57C02F51BD35B0254240', 'KGCM', 'Claremore Regional Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E61000002C0E677E35F158C027DA5548F9254240', 'KGAG', 'Gage Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E61000003ECBF3E0EE4A53C0AE47E17A14264240', 'KASJ', 'Ahoskie, Tri-County Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A5315A47552557C06666666666264240', 'KFLP', 'Flippin, Marion County Regional Airport', 'AR');
INSERT INTO postgis.stations VALUES ('0101000020E6100000232D95B723FC5DC049809A5AB6264240', 'KNLC', 'Lemoore Naval Air Station - Reeves Field', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E610000027A089B0E1E75DC06B2BF697DD274240', 'KHJO', 'Hanford Municipal Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A99999999D95DC0EACF7EA488284240', 'KVIS', 'Visalia Municipal Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000713D0AD7A36853C00AD7A3703D2A4240', 'KIXA', 'Halifax-Northampton Regional Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AA7A58C04963B48EAA2A4240', 'KEND', 'Vance Air Force Base / Enid', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DF4F8D976E0A55C0FBCBEEC9C32A4240', 'KJAU', 'Jacksboro Campbell County Airport', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B81E85EB511856C0EC51B81E852B4240', 'KPHT', 'Paris - Henry County Airport', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E61000008E01D9EBDD8D57C0CDCCCCCCCC2C4240', 'KVBT', 'Bentonville Municipal Airport/Louise M Thaden Field', 'AR');
INSERT INTO postgis.stations VALUES ('0101000020E61000009D4B7155D9A153C091B8C7D2872E4240', 'KHNZ', 'Henderson-Oxford Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E610000066666666668657C05036E50AEF2E4240', 'KROG', 'Rogers Executive Airport - Carter Field', 'AR');
INSERT INTO postgis.stations VALUES ('0101000020E6100000276BD443341E57C0569A94826E2F4240', 'KBPK', 'Baxter County Airport', 'AR');
INSERT INTO postgis.stations VALUES ('0101000020E6100000508D976E128B54C0736891ED7C2F4240', 'K0A9', 'Elizabethton Municipal Airport', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E61000007862D68BA17258C0EACF7EA488304240', 'KWDG', 'Enid Woodring Regional Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E61000001F85EB51B83E56C0713D0AD7A3304240', 'KUCY', 'Union City - Everett-Stewart Regional Airport', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DEC83CF2070153C0C959D8D30E334240', 'KONX', 'Currituck County Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E61000003ECBF3E0EE2E59C03333333333334240', 'KPYX', 'Perryton Ochiltree County Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B6F3FDD478A956C0C1CAA145B6334240', 'K4M9', 'Corning Municipal Airport', 'AR');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B2D7BB3FDE5355C0B0726891ED344240', 'K8A3', 'Livingston Municipal Airport', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B4AB90F293525AC058569A9482364240', 'KAXX', 'Angel Fire Airport', 'NM');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AA5A54C01630815B77374240', 'KGEV', 'Jefferson - Ashe County Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E610000096E7C1DD59E158C0799274CDE4374240', 'KWWR', 'Woodward, West Woodward Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E61000002A1DACFF73F653C01D9430D3F6374240', 'KSIF', 'Reidsville, Rockingham County NC Shiloh Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E61000001618B2BAD5C959C08CBE823463394240', 'KCAO', 'Clayton Municipal Airpark', 'NM');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AA6A5AC09A99999999394240', 'KSKX', 'Taos Regional Airport', 'NM');
INSERT INTO postgis.stations VALUES ('0101000020E6100000736891ED7C2555C09F8EC70C543A4240', 'KSCX', 'Scott Municipal Airport', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000BD35B055822354C05839B4C8763A4240', 'KMWK', 'Mount Airy/Surry County Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E42CEC69879954C05A9E0777673D4240', 'KTRI', 'Bristol / Johnson / Kingsport, Tri-City Regional Airport', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E610000046B6F3FDD44C57C0CE1951DA1B444240', 'KBBG', 'Branson', 'MO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D712F241CFBA55C0226C787AA5444240', 'KM91', 'Springfield Robertson County Airport', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F37684D382D553C0C5E6E3DA50494240', 'KDAN', 'Danville Regional Airport', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000EAE74D452AEC5CC09E245D33F94A4240', 'KINS', 'Nellis AFB - Indian Springs Auxiliary Airfield', 'NV');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B81E85EB51765EC073A25D85944B4240', 'KMRY', 'Monterey Regional Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E610000098DD9387859E55C032E6AE25E44B4240', 'K1M5', 'Portland Municipal Airport', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F5673F5244A453C0CDCCCCCCCC4C4240', 'KW63', 'Clarksville / Marks', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D6C56D34807F56C0BE9F1A2FDD4C4240', 'KMAW', 'Malden Municipal Airport', 'MO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E89FE06245AF57C02176A6D0794D4240', 'KGMJ', 'Grove Municipal Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000417DCB9C2EEF54C0751F80D4264E4240', 'K1A6', 'Middlesboro-Bell County Airport', 'KY');
INSERT INTO postgis.stations VALUES ('0101000020E61000001F9DBAF259DA55C05E9D6340F64E4240', 'KCKV', 'Clarksville Outlaw Field', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E61000002783A3E4D5015DC04850FC18734F4240', 'KDRA', 'Mercury, Desert Rock Airport', 'NV');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C2340C1F110154C0B0C91AF510514240', 'KMTV', 'Martinsville', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E61000005E807D74EA665EC037A6272CF1544240', 'KSNS', 'Salinas Municipal Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B9FC87F4DB1756C0F775E09C11554240', 'KCEY', 'Murray Kyle Oakley Field, KY', 'KY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F819170E841453C04CC3F01131554240', 'KCPK', 'Chesapeake Municipal Airport', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E61000000000000000E055C0B79C4B7155554240', 'KHOP', 'Fort Campbell U. S. Army Airfield', 'KY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F4E0EEACDDDC5DC0D9CEF753E3554240', 'KO32', 'Reedley Municipal Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E17A14AE47715EC0D7A3703D0A574240', 'KOAR', 'Fort Ord/Fritzsche', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AAD4EC81566059C008556AF640574240', 'KGUY', 'Guymon Municipal Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DF89592F862653C0AC5626FC52574240', 'KSFQ', 'Suffolk Municipal Airport', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E610000072FE2614228254C01630815B77574240', 'KVJI', 'Abingdon', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E61000006DCA15DEE55E53C0392861A6ED574240', 'KEMV', 'Emporia-Greensville Regional Airport', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000289B7285778353C06AD95A5F24584240', 'KAVC', 'South Hill, Mecklenburg-Brunswick Regional Airport', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E09C11A5BD5957C0C520B07268594240', 'KFWB', 'Branson West Muni - Emerson Field', 'MO');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A999999993953C09A99999999594240', 'KFKN', 'Franklin / J B Rose', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E61000002046088F360853C0210725CCB4594240', 'KNFE', 'Fentress, Naval Auxiliary Landing Field', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E610000083C0CAA145B653C07B14AE47E15A4240', 'KW78', 'William M Tuck Airport', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E610000075B0FECF614658C004E275FD825D4240', 'KPNC', 'Ponca City Municipal Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DC662AC423205AC0BE88B663EA5E4240', 'KRTN', 'Raton Municipal - Crews Field Airport', 'NM');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AA0E5BC0417DCB9C2E5F4240', 'KFMN', 'Farmington, Four Corners Regional Airport', 'NM');
INSERT INTO postgis.stations VALUES ('0101000020E61000007CD5CA845F5658C016F6B4C35F5F4240', 'KBKN', 'Blackwell-Tonkawa Municipal Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F5673F52443454C08369183E22624240', 'KHLX', 'Hillsville', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E61000004F0647C9AB0158C091442FA358624240', 'KBVO', 'Bartlesville Municipal Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000287E8CB96B2556C043AD69DE71624240', 'KM25', 'Mayfield Graves County Airport', 'KY');
INSERT INTO postgis.stations VALUES ('0101000020E61000007F87A2409F9456C08ACDC7B5A1624240', 'KPOF', 'Poplar Bluff Municipal Airport', 'MO');
INSERT INTO postgis.stations VALUES ('0101000020E61000009FCDAACFD57253C0A52C431CEB624240', 'KLVL', 'Lawrenceville/Brunswick Municipal Airport', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E61000007B14AE47E1AA58C042EC4CA1F3624240', 'KAVK', 'Alva Regional Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CBDB114E0BEE5DC0A4703D0AD7634240', 'KFAT', 'Fresno Air Terminal', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000789CA223B91C53C007CE1951DA634240', 'KPVG', 'Norfolk Hampton Roads Executive Airport', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E61000001CEBE2361AA053C0E9B7AF03E7644240', 'KCXE', 'Chase City Municipal Airport', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E61000009EEA909BE10C55C0A774B0FECF654240', 'KBYL', 'Williamsburg-Whitley County Airport', 'KY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B9DFA128D00153C09335EA211A694240', 'KNTU', 'Virginia Beach, Oceana, Naval Air Station', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D4F19881CA3655C02176A6D0796D4240', 'KEKQ', 'Monticello, Wayne County Airport', 'KY');
INSERT INTO postgis.stations VALUES ('0101000020E610000037A6272CF1D654C0603C8386FE6D4240', 'KI35', 'Harlan', 'KY');
INSERT INTO postgis.stations VALUES ('0101000020E610000052B81E85EBF956C0EACF7EA488704240', 'KUNO', 'West Plains Municipal Airport', 'MO');
INSERT INTO postgis.stations VALUES ('0101000020E61000002063EE5A425A5EC027C286A757724240', 'KCVH', 'Hollister, CA', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E610000024B9FC87F46356C0EC2FBB270F734240', 'KSIK', 'Sikeston Memorial Municipal Airport', 'MO');
INSERT INTO postgis.stations VALUES ('0101000020E610000066666666665654C03333333333734240', 'KMKJ', 'Marion / Wytheville', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D5B2B5BE480C53C0562B137EA9734240', 'KORF', 'Norfolk International Airport', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E25817B7D18057C04ED1915CFE734240', 'KHFJ', 'Monett', 'MO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CDCCCCCCCCB857C03F6F2A5261744240', 'KMIO', 'Miami Regional Airport', 'OK');
INSERT INTO postgis.stations VALUES ('0101000020E610000054A9D903ADDC5BC0BD00FBE8D4754240', 'KPGA', 'Page Municipal Airport', 'AZ');
INSERT INTO postgis.stations VALUES ('0101000020E61000003ECBF3E0EE1253C0FA9B508880774240', 'KNGU', 'Norfolk, Naval Air Station', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E61000000D897B2C7D725EC0F146E6913F784240', 'KWVI', 'Watsonville Municipal Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E61000000000000000405CC09A99999999794240', 'KAZC', 'Colorado City Municipal Airport', 'AZ');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A4703D0AD78B53C0DE718A8EE47A4240', 'KW31', 'Lunenburg County Airport', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E610000097A8DE1AD89A55C0257A19C5727B4240', 'KBWG', 'Bowling Green-Warren County Regional Airport', 'KY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000834C3272164053C04B3CA06CCA7D4240', 'KAKQ', 'Wakefield Municipal Airport', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E610000072FE261422A254C07D96E7C1DD7D4240', 'KLNP', 'Wise / Lonesome Pine', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E61000004968CBB914075EC012A5BDC1177E4240', 'KMAE', 'Madera Municipal Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D8648D7A887859C00000000000804240', 'KEHA', 'Elkhart-Morton County Airport', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E610000052B81E85EB215CC0E17A14AE47814240', 'KKNB', 'Kanab Municipal Airport', 'UT');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DEC83CF2077D55C0D52137C30D844240', 'KGLW', 'Glasgow Municipal Airport', 'KY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F5A10BEA5B605CC0598638D6C5854240', 'KSGU', 'St George Municipal Airport', 'UT');
INSERT INTO postgis.stations VALUES ('0101000020E61000008E01D9EBDD3D59C06666666666864240', 'KLBL', 'Liberal Municipal Airport', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E61000008FC2F5285C2755C05036E50AEF864240', 'KSME', 'Somerset-Pulaski County - J.T. Wilson Field Airport', 'KY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E42CEC69873156C025E99AC937874240', 'KPAH', 'Paducah, Barkley Regional Airport', 'KY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E71DA7E8484E56C02A6F47382D884240', 'KCIR', 'Cairo Regional Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000508D976E127354C0D578E92631884240', 'KJFZ', 'Tazewell County Airport', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E610000075841D1032665EC073A7CF69718A4240', 'KE16', 'South County Airport of Santa Clara County', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CDCCCCCCCC7C53C04963B48EAA8A4240', 'KBKT', 'Ft. Pickett / Blackstone', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E610000066666666661653C04963B48EAA8A4240', 'KLFI', 'Langley Air Force Base', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E61000006E8B321B640455C0257A19C5728B4240', 'KLOZ', 'London-Corbin Airport-Magee Field', 'KY');
INSERT INTO postgis.stations VALUES ('0101000020E610000003B2D7BB3FE457C0562B137EA98B4240', 'KCFV', 'Coffeyville Municipal Airport', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CFBD874B8E1F53C06284F068E3904240', 'KPHF', 'Newport News / Williamsburg International Airport', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000289B7285772753C0B0C91AF510914240', 'KFAF', 'Fort Eustis / Felker', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBB2B54C0B0C91AF510914240', 'KPSK', 'Dublin / New River Valley', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E2E995B20CC153C0EEEBC03923924240', 'K0V4', 'Brookneal/Campbell County Airport', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E61000000ADCBA9BA7F05AC0A7B393C151924240', 'KDRO', 'Durango-La Plata County Airport', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E36BCF2C09A057C00E4A9869FB934240', 'KJLN', 'Joplin Regional Airport', 'MO');
INSERT INTO postgis.stations VALUES ('0101000020E610000036CD3B4ED1F157C0DCD7817346944240', 'KIDP', 'Independence', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E4A08499B65759C0DB5031CEDF944240', 'KHQG', 'Hugoton Municipal Airport', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E610000083FA96395D4258C004E275FD82954240', 'KWLD', 'Winfield / Arkansas City, Strother Field', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E6100000984C158C4A8653C0BA490C022B974240', 'KW81', 'Crewe Municipal Airport', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C2340C1F116153C01630815B77974240', 'KPTB', 'Petersburg, Dinwiddie County Airport', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AA1A54C01D03B2D7BB9B4240', 'KBCB', 'Virginia Tech Airport', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000EC12D55B036556C094A46B26DF9C4240', 'KCGI', 'Cape Girardeau Regional Airport', 'MO');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B46257502CA55C0772D211FF49C4240', 'KM21', 'Muhlenberg County Airport', 'KY');
INSERT INTO postgis.stations VALUES ('0101000020E610000037A6272CF15857C03B191C25AF9E4240', 'KSGF', 'Springfield Regional Airport', 'MO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E71890BDDE2D53C0EDD808C4EB9E4240', 'KJGG', 'Williamsburg-Jamestown Airport', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E61000004CE0D6DD3C155AC028D53E1D8FA14240', 'KTAD', 'Perry Stokes Airport', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E61000000664AF777F205EC02367614F3BA44240', 'KMCE', 'Merced Regional Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000289B728577A759C0E3FC4D2844A44240', 'KSPD', 'Springfield, Comanche National Grassland', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E610000081785DBF60A358C0AAD4EC8156A44240', 'KP28', 'Medicine Lodge', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DD24068195C35AC0BF0E9C33A2A44240', 'KPSO', 'Stevens Field, Pagosa Springs', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D3307C444C4D54C07D96E7C1DDA54240', 'KBLF', 'Bluefield, Mercer County Airport', 'WV');
INSERT INTO postgis.stations VALUES ('0101000020E6100000003ACC9717285BC073F4F8BD4DA74240', 'KCEZ', 'Cortez-Montezuma County Airport', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A3AF20CD58FE53C0AA656B7D91A84240', 'KROA', 'Roanoke Regional Airport', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E61000001EC4CE143ACD53C0B0C91AF510A94240', 'KLYH', 'Lynchburg Regional Airport', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F5673F5244E057C03524EEB1F4A94240', 'KPPF', 'Parsons, Tri-City Airport', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F5673F5244745EC04963B48EAAAA4240', 'KRHV', 'San Jose / Reid / Hillv', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C2172653050756C089D2DEE00BAB4240', 'K5M9', 'Marion-crittenden County Airport', 'KY');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBB9B53C0CDCCCCCCCCAC4240', 'KFVX', 'Farmville', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E61000003D27BD6F7CD955C028D53E1D8FAD4240', 'K2I0', 'Madisonville Municipal Airport', 'KY');
INSERT INTO postgis.stations VALUES ('0101000020E61000009D2E8B89CD5355C0CB67791EDCAD4240', 'KAAS', 'Taylor County Airport', 'KY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000707CED99257B5EC027DA5548F9AD4240', 'KSJC', 'San Jose International Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F5673F5244245EC05036E50AEFAE4240', 'KMER', 'Merced / Castle Air Force Base', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E61000005E807D74EA965DC0FA9B508880AF4240', 'KBIH', 'Bishop Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E61000009F93DE37BED054C0A8E3310395B14240', 'KCPF', 'Wendell H Ford Airport', 'KY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000BB0F406A13835EC02BDEC83CF2B34240', 'KNUQ', 'Mountain View, Moffett Field', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E610000024B726DD966153C0E5D3635B06B44240', 'KFCI', 'Chesterfield County Airport', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E610000057EC2FBB27775AC06A1327F73BB84240', 'KALS', 'San Luis Valley Regional Airport', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C286A757CAAE57C044696FF085B94240', 'KPTS', 'Atkinson Municipal Airport', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E610000025E99AC937B35AC0E8DEC325C7B94240', 'KCPW', 'Pagosa Springs, Wolf Creek Pass', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000289B728577875EC01D03B2D7BBBB4240', 'KPAO', 'Palo Alto Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A835CD3B4E3559C0F2B0506B9ABF4240', 'K19S', 'Sublette Municipal Airport', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E61000003B191C25AF4A5AC06AD95A5F24C04240', 'KVTP', 'La Veta Mountain, La Veta Pass', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E610000079E92631084853C071AC8BDB68C04240', 'KW96', 'New Kent County', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E610000034F44F70B15453C04C546F0D6CC14240', 'KRIC', 'Richmond International Airport', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E610000039454772F99F5EC0E09C11A5BDC14240', 'KHAF', 'Half Moon Bay Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E61000000000000000905EC08369183E22C24240', 'KSQL', 'San Carlos Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E610000045F0BF95EC3053C02DCF83BBB3C24240', 'KFYJ', 'West Point, Middle Peninsula Regional Airport', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E610000007F0164850A454C03A234A7B83C74240', 'KPBX', 'Pike County Airport and Hatcher Field', 'KY');
INSERT INTO postgis.stations VALUES ('0101000020E61000000356B3733F3155C0F1BD1AFBEDC94240', 'KDVK', 'Stuart Powell Field Airport', 'KY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E63FA4DFBE6E59C00B46257502CA4240', 'KJHN', 'Stanton County Municipal Airport', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E6100000022B8716D95E5BC05EBA490C02CB4240', 'KBDG', 'Blanding Municipal Airport', 'UT');
INSERT INTO postgis.stations VALUES ('0101000020E61000007923F3C81FD454C03997E2AAB2CB4240', 'KJKL', 'Jackson, Carroll Airport', 'KY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E0B9F770C96354C0B0389CF9D5CC4240', 'KI16', 'Pineville, Kee Field Airport', 'WV');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E3C798BB961C53C0228E75711BCD4240', 'KW75', 'Saluda Hummel Field', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E610000000C63368E85759C05A643BDF4FCD4240', 'KULS', 'Ulysses Airport', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C2340C1F115158C05036E50AEFCE4240', 'KIAB', 'McConnell Air Force Base', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E61000009604A8A965975EC0252367614FCF4240', 'KSFO', 'San Francisco International Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000EE5A423EE8B55DC080B74082E2CF4240', 'KMMH', 'Mammoth Yosemite Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D3BCE3141D3D5EC0CEFC6A0E10D04240', 'KMOD', 'Modesto City-County Airport - Harry Sham Field', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A14F3F03451555C0B6A1629CBFD04240', 'KRGA', 'Central Kentucky Regional Airport', 'KY');
INSERT INTO postgis.stations VALUES ('0101000020E61000000F0BB5A6794F55C0A835CD3B4ED14240', 'K6I2', 'Lebanon-Springfield Airport', 'KY');
INSERT INTO postgis.stations VALUES ('0101000020E610000008E6E8F17B5B58C097A8DE1AD8D24240', 'KICT', 'Wichita Dwight D. Eisenhower National Airport', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F6285C8FC22957C00282397AFCD24240', 'KLBO', 'Lebanon', 'MO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C2340C1F11F152C03333333333D34240', 'KMFV', 'Melfa / Accomack Airport', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AF08FEB792875EC09B1BD31396D44240', 'KHWD', 'Hayward Air Terminal', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E610000014ED2AA4FCDE57C0D9942BBCCBD54240', 'KCNU', 'Chanute Martin Johnson Airport', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F0164850FC4458C02EFF21FDF6D54240', 'K3AU', 'Augusta Municipal Airport', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E610000033333333337B55C02B8716D9CED74240', 'KEKX', 'Elizabethtown Addington Field Airport', 'KY');
INSERT INTO postgis.stations VALUES ('0101000020E610000055A4C2D8425C5EC0711B0DE02DD84240', 'KTCY', 'Tracy Municipal Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E61000007923F3C81F745EC054A9D903ADD84240', 'KLVK', 'Livermore Municipal Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E610000068D0D03FC14D58C02905DD5ED2D84240', 'KBEC', 'Beech Factory Airport', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E6100000917EFB3A70325AC0A913D044D8D84240', 'K4V1', 'Walsenburg', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E61000000000000000B058C09A99999999D94240', 'KPTT', 'Pratt Municipal', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E6100000738577B988095CC060AB048BC3D94240', 'KBCE', 'Bryce Canyon Airport', 'UT');
INSERT INTO postgis.stations VALUES ('0101000020E610000039D6C56D34465CC05839B4C876DA4240', 'KCDC', 'Cedar City Municipal Airport', 'UT');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C0046EDDCD5B53C08ACDC7B5A1DA4240', 'KOFP', 'Ashland, Hanover County Municipal Airport', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E61000004A0C022B87965AC041F163CC5DDB4240', 'KRCV', 'Astronaut Kent Rominger - Del Norte', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000897B2C7DE88E5EC0CE88D2DEE0DB4240', 'KOAK', 'Oakland, Metro Oakland International Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D8648D7A880857C07D96E7C1DDDD4240', 'KTBN', 'Fort Leonard Wood', 'MO');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AACA55C01F85EB51B8DE4240', 'KOWB', 'Owensboro-Daviess County Airport', 'KY');
INSERT INTO postgis.stations VALUES ('0101000020E61000004BCD1E68054E58C0B21188D7F5DF4240', 'KAAO', 'Wichita Jabara Airport', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E61000003F575BB1BFA854C0E3A59BC420E04240', 'KSJS', 'Big Sandy Regional Airport', 'KY');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBB9B56C08369183E22E24240', 'KFAM', 'Farmington Airport', 'MO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F44F70B1A24056C012C2A38D23E24240', 'KMWA', 'Marion - Williamson County Regional Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000BC9179E40FFE58C05E807D74EAE24240', 'KDDC', 'Dodge City Regional Airport', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E6100000107A36AB3E4758C0DE02098A1FE34240', 'K1K1', 'Benton Lloyd Stearman Field', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D23AAA9A203458C0ECA353573EE34240', 'KEQA', 'El Dorado Captain Jack Thomas Airport', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E61000008143A852B34F56C031CEDF8442E44240', 'KMDH', 'Southern Illinois Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E61000000E4A9869FB4754C0F6285C8FC2E54240', 'KBKW', 'Beckley, Raleigh County Memorial Airport', 'WV');
INSERT INTO postgis.stations VALUES ('0101000020E610000082397AFCDE2256C04EEE77280AE84240', 'KHSB', 'Harrisburg-Raleigh Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E610000080F10C1AFA5F55C06A1327F73BE84240', 'KBRY', 'Samuels Field Airport', 'KY');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBBEB55C0EACF7EA488E84240', 'KEHR', 'Henderson City', 'KY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C02154A9D9FF52C0AF5FB01BB6E94240', 'KTGI', 'Tangier Island Airport', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D5E76A2BF6675EC0B515FBCBEEE94240', 'KC83', 'Byron', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000295C8FC2F5185CC0CDCCCCCCCCEC4240', 'KU55', 'Panguitch Municipal Airport', 'UT');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C971A774B01258C02979758E01ED4240', 'K13K', 'Lt. William M. Milliken Airport', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E6100000029A081B9E7A54C0F697DD9387ED4240', 'K6L4', 'Logan County Airport', 'WV');
INSERT INTO postgis.stations VALUES ('0101000020E61000009BFF571D393953C01424B6BB07EE4240', 'KXSA', 'Tappahannock-Essex County Airport', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A999999991954C05036E50AEFEE4240', 'KLWB', 'Lewisburg / Greenbrier', 'WV');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A2B437F8C2D857C09031772D21EF4240', 'KK88', 'Allen County Airport', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B324404D2D7756C017821C9430EF4240', 'KPCD', 'Perryville Regional Airport', 'MO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000BF4351A04F4E5EC06E4C4F58E2F14240', 'KSCK', 'Stockton Metropolitan Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E61000008E01D9EBDD7D55C03333333333F34240', 'KFTK', 'Fort Knox', 'KY');
INSERT INTO postgis.stations VALUES ('0101000020E610000083FA96395D2E59C01F85EB51B8F64240', 'KGCK', 'Garden City Regional Airport', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E610000039EE940ED6DD52C0D5E76A2BF6F74240', 'KWAL', 'Wallops Flight Facility Airport', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000492EFF21FDB655C0448B6CE7FBF94240', 'KKY8', 'Hancock County Airport-Ron Lewis Field', 'KY');
INSERT INTO postgis.stations VALUES ('0101000020E610000063B48EAA26FA5AC0A0FD481119FA4240', 'KTEX', 'Telluride Regional Airport', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E610000088855AD3BC6F53C0083D9B559FFB4240', 'K7W4', 'Lake Anna Airport', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B1BFEC9E3C2C57C0E9263108ACFC4240', 'KOZS', 'Camdenton Memorial Airport', 'MO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AC5626FC52835EC05036E50AEFFE4240', 'KCCR', 'Concord, Buchanan Field', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000569FABADD86F59C047382D78D1FF4240', 'K3K3', 'Syracuse-Hamilton County Municipal Airport', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A0FD4811197E53C0FE0E45813E014340', 'KLKU', 'Louisa County Airport/Freeman Field', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E61000007B14AE47E11A5EC0A4703D0AD7034340', 'KO22', 'Columbia', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000FAB31F29222755C0CEAACFD556044340', 'KLEX', 'Lexington Blue Grass Airport', 'KY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D3307C444CE155C004E275FD82054340', 'KEVV', 'Evansville Regional Airport', 'IN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A2EE0390DAE059C051BD35B055064340', 'KLHX', 'La Junta Municipal Airport', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E610000072FE2614225258C06666666666064340', 'KEWK', 'Newton City/County Airport', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E610000042CF66D5E7FE54C08FC2F5285C074340', 'KIOB', 'Mount Sterling-Montgomery County Airport', 'KY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A8E3310395455DC02B4D4A41B7074340', 'KTPH', 'Tonopah Airport', 'NV');
INSERT INTO postgis.stations VALUES ('0101000020E6100000BB0F406A137758C03815A930B6084340', 'KHUT', 'Hutchinson Municipal Airport', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A7E8482EFFAB59C0E140481630094340', 'KLAA', 'Lamar Municipal Airport', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000EA95B20C71BC53C0FD87F4DBD7094340', 'KW13', 'Eagles Nest Airport', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F6285C8FC20756C08FC2F5285C0B4340', 'KCUL', 'Carmi Municipal Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D4F19881CA8A5AC0314278B4710C4340', 'K04V', 'Saguache Municipal Airport', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E610000033333333332357C0CDCCCCCCCC0C4340', 'KAIZ', 'Kaiser Lake Ozark, Lee C Fine Memorial Airport', 'MO');
INSERT INTO postgis.stations VALUES ('0101000020E61000001B12F758FAF056C06284F068E3104340', 'KVIH', 'Rolla National Airport', 'MO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A29C6857219D53C0EF8FF7AA95114340', 'KCHO', 'Charlottesville-Albemarle Airport', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E61000005AD8D30E7FA35EC00A9DD7D825124340', 'KDVO', 'Novato / Gnoss Field', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E61000001A51DA1B7C295EC009F9A067B3124340', 'KCPU', 'San Andreas Calaveras County Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E61000007B14AE47E11A53C0C959D8D30E134340', 'KNUI', 'Webster Field, Naval Electronic Systems Engineering Activity', 'MD');
INSERT INTO postgis.stations VALUES ('0101000020E6100000516B9A779C8A53C08716D9CEF7134340', 'KGVE', 'Gordonsville Municipal Airport', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E61000004260E5D0226F55C058C51B9947164340', 'KSDF', 'Louisville Muhammad Ali International Airport', 'KY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B9DFA128D03955C06475ABE7A4174340', 'KFFT', 'Frankfort, Capital City Airport', 'KY');
INSERT INTO postgis.stations VALUES ('0101000020E61000006E4C4F58E2915EC0C3F5285C8F1A4340', 'KAPC', 'Napa County Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E86A2BF697E554C0EC51B81E851B4340', 'KSYM', 'Clyde A. Thomas Regional Airport', 'KY');
INSERT INTO postgis.stations VALUES ('0101000020E61000001CD31396786A55C0695721E5271D4340', 'KLOU', 'Louisville, Bowman Field Airport', 'KY');
INSERT INTO postgis.stations VALUES ('0101000020E61000007D7901F6D11B55C0E76F4221021E4340', 'K27K', 'Georgetown Scott County Regional Airport', 'KY');
INSERT INTO postgis.stations VALUES ('0101000020E61000005E807D74EA8253C06475ABE7A41F4340', 'KOMH', 'Orange County Airport', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CDCCCCCCCCBC55C00000000000204340', 'KHNB', 'Huntingburg', 'IN');
INSERT INTO postgis.stations VALUES ('0101000020E61000003411363CBDA65EC054742497FF204340', 'KO69', 'Petaluma Municipal Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CDCCCCCCCC7C5EC08369183E22224340', 'KSUU', 'Fairfield / Travis Air Force Base', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CDCCCCCCCC5C53C08369183E22224340', 'KEZF', 'Fredericksburg, Shannon Airport', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A99999999B953C08369183E22224340', 'KSHD', 'Staunton / Shenandoah', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E61000000D897B2C7D1A53C0562B137EA9234340', 'KNHK', 'Patuxent River, Naval Air Station', 'MD');
INSERT INTO postgis.stations VALUES ('0101000020E6100000956588635D205AC054573ECBF3244340', 'KPUB', 'Pueblo Memorial Airport', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000312592E865EE57C0B4024356B7264340', 'KUKL', 'Coffey County Airport', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E61000004B9352D0EDC752C00FB9196EC0274340', 'KOXB', 'Ocean City Municipal Airport', 'MD');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E561A1D6342353C04694F6065F284340', 'K2W6', 'St Marys County Airport', 'MD');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AD86C43D963656C019ADA3AA092A4340', 'KMVN', 'Mount Vernon Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E61000005F419AB1680C58C0A0FD4811192A4340', 'KEMP', 'Emporia Municipal Airport', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E61000001F4B1FBAA08E58C0643BDF4F8D2B4340', 'KLYO', 'Lyons-Rice County Municipal Airport', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E610000062F3716DA8E052C0B3295778972B4340', 'KSBY', 'Salisbury-Ocean City Wicomico County Regional Airport', 'MD');
INSERT INTO postgis.stations VALUES ('0101000020E610000075029A081B5657C0BF7D1D38672C4340', 'KRAW', 'Warsaw Municipal Airport', 'MO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000289B728577B758C0CDCCCCCCCC2C4340', 'KGBD', 'Great Bend, Great Bend Municipal Airport', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E61000008C4AEA0434E15DC0F697DD93872D4340', 'KBAN', 'MCMWTC Bridgeport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E610000016FBCBEEC96B57C076E09C11A52D4340', 'KGLY', 'Clinton, MO', 'MO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000EC51B81E85A354C01F85EB51B82E4340', 'KHTS', 'Huntington, Tri-State Airport', 'WV');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A5F78DAF3D6F55C07B319413ED2E4340', 'KJVY', 'Clark Regional Airport', 'IN');
INSERT INTO postgis.stations VALUES ('0101000020E610000088D7F50B76BD53C049111956F12E4340', 'KVBW', 'Bridgewater Air Park', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E97DE36BCF325EC000917EFB3A304340', 'KJAQ', 'Westover Field - Amador County Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000088F368E587D5EC06A4DF38E53304340', 'KVCB', 'Vacaville Nut Tree Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000581CCEFC6A1A56C023F8DF4A76304340', 'KFWC', 'Fairfield, Fairfield Municipal Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E61000009D4B7155D96554C0AA656B7D91304340', 'KCRW', 'Charleston, Yeager Airport', 'WV');
INSERT INTO postgis.stations VALUES ('0101000020E610000077A1B94E235D53C042EC4CA1F3324340', 'KRMN', 'Stafford Regional Airport', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E61000000A4966F50EAD5BC04CC2853C82354340', 'KHVE', 'Hanksville', 'UT');
INSERT INTO postgis.stations VALUES ('0101000020E61000009F76F86BB2405CC0F5F3A62215364340', 'KMLF', 'Milford Municipal Airport', 'UT');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F7E461A1D6465AC0D72FD80DDB364340', 'K1V6', 'Fremont County Airport', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E61000008DD13AAA9A3859C014799274CD3C4340', 'KTQK', 'Scott City Municipal Airport', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E6100000FF21FDF675945AC01DC9E53FA43F4340', 'KMYP', 'Salida - Monarch Pass', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F5673F5244B45EC00000000000404340', 'KSTS', 'Santa Rosa Sonoma County Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E61000002827DA55485353C046B1DCD26A404340', 'KNYG', 'Quantico Marine Corps Airfield - Turner Field', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E61000003D0AD7A370F95AC0713D0AD7A3404340', 'KMTJ', 'Montrose Regional Airport', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E61000000473F4F8BD5F5EC09BC937DBDC404340', 'KSAC', 'Sacramento Executive Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AF7C96E7C14556C0137EA99F37414340', 'KENL', 'Centralia Municipal Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A60F5D50DF7653C00FB4024356434340', 'KCJR', 'Culpeper Regional Airport', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E61000007593180456725EC079E9263108444340', 'KEDU', 'University Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBBBB5AC0E3FC4D2844444340', 'KGUC', 'Gunnison-Crested Butte Regional Airport', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C251F2EA1C835AC0A20BEA5BE6444340', 'KANK', 'Harriet Alexander Field Airport', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E61000001973D712F20153C0CC5D4BC807454340', 'KCGE', 'Cambridge-Dorchester Airport', 'MD');
INSERT INTO postgis.stations VALUES ('0101000020E61000002AA913D044D057C0053411363C454340', 'KOWI', 'Ottawa Municipal Airport', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E61000002BF697DD93EF54C0857CD0B359454340', 'KFGX', 'Fleming-Mason Airport', 'KY');
INSERT INTO postgis.stations VALUES ('0101000020E61000003C6BB75D68A85DC0761A69A9BC454340', 'KHTH', 'Hawthorne Industrial Airport', 'NV');
INSERT INTO postgis.stations VALUES ('0101000020E610000066666666667656C06666666666464340', 'KBLV', 'Belleville, Scott AFB/MidAmerica Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AC1C5A643BAF54C0E5D022DBF9464340', 'KDWU', 'Ashland Regional Airport', 'KY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E3C281902C525EC0B988EFC4AC474340', 'KMHR', 'Sacramento Mather Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A4A5F276848956C040FB912232484340', 'KCPS', 'St. Louis Downtown Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F2B0506B9ABF56C097900F7A364B4340', 'KFYG', 'Washington Regional Airport', 'MO');
INSERT INTO postgis.stations VALUES ('0101000020E610000008944DB9C26D53C048BF7D1D384B4340', 'KHWY', 'Warrenton-Fauquier Airport', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000156F641EF90957C095B7239C164C4340', 'KJEF', 'Jefferson City Memorial Airport', 'MO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F5BEF1B567EE55C0AE0D15E3FC4D4340', 'KAJG', 'Mount Carmel Municipal Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E61000008BFD65F7E49557C091ED7C3F354E4340', 'KLRY', 'Harrisonville Lawrence Smith Memorial Airport', 'MO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000327216F6B43D56C0EE42739D46524340', 'KSLO', 'Salem-Leckrone Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E61000000C93A98251AD53C05DFE43FAED534340', 'K8W2', 'New Market Airport', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000156F641EF9A956C07923F3C81F544340', 'KSUS', 'Spirit Of St. Louis Airport', 'MO');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A99999999595EC0B79C4B7155554340', 'KMCC', 'Sacramento, McClellan Airfield Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E61000002B1895D409A053C0AF94658863554340', 'KLUA', 'Luray Caverns', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E61000008CB96B09F91C56C0E8F692C668554340', 'KFOA', 'Flora Municipal Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D89E5912A0305AC02C9FE57970574340', 'KFCS', 'Butts Army Airfield (Fort Carson)', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DA1B7C6132D752C01C5F7B6649584340', 'KGED', 'Georgetown - Delaware Coastal Airport', 'DE');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A3923A014DC855C0280F0BB5A6594340', 'KDCY', 'Daviess County Airport', 'IN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000397F130A11665EC076FD82DDB0594340', 'KSMF', 'Sacramento International Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E610000050C763062A4B57C050C763062A5B4340', 'KDMO', 'Sedalia Memorial Airport', 'MO');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBB4B53C01D03B2D7BB5B4340', 'KDAA', 'Fort Belvoir', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C2340C1F116153C01D03B2D7BB5B4340', 'KHEF', 'Manassas Regional Airport/Harry P. Davis Field', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E61000003A234A7B830B56C0D5CF9B8A545C4340', 'KOLY', 'Olney-Noble Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000EA04341136305EC0B1E1E995B25C4340', 'KPVF', 'Placerville Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E610000033333333336357C07D96E7C1DD5D4340', 'KSZL', 'Whiteman Air Force Base', 'MO');
INSERT INTO postgis.stations VALUES ('0101000020E610000027DA5548F9355AC0C16ED8B6285F4340', 'KCWN', 'Cheyenne Mountain', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E610000059DDEA39E99756C0B81E85EB51604340', 'KSTL', 'St. Louis Lambert International Airport', 'MO');
INSERT INTO postgis.stations VALUES ('0101000020E61000003A92CB7F48135AC054742497FF604340', 'KABH', 'Ellicott-B AFA', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E61000006F1283C0CA5D55C09A779CA223614340', 'KIMS', 'Madison Municipal Airport', 'IN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000562B137EA96F5BC0E17A14AE47614340', 'KCNY', 'Moab, Canyonlands Field', 'UT');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AAD4EC8156E655C045F5D6C056614340', 'KLWV', 'Lawrenceville-Vincennes International Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E61000001EC4CE143A6958C0A4703D0AD7634340', 'KSLN', 'Salina Municipal Airport', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E61000003524EEB1F48D5AC05C8FC2F528644340', 'K7BM', 'Cottonwood Pass', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000567DAEB6627357C0F8C264AA60644340', 'KRCM', 'Skyhaven Airport', 'MO');
INSERT INTO postgis.stations VALUES ('0101000020E610000031B1F9B836045BC030F0DC7BB8644340', 'KAJZ', 'Delta/Blake Field Airport', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F5673F52440453C06666666666664340', 'KESN', 'Easton / Newman Field', 'MD');
INSERT INTO postgis.stations VALUES ('0101000020E61000008B71FE26142C5AC032384A5E9D674340', 'KCOS', 'City of Colorado Springs Municipal Airport', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E610000012BD8C62B9875AC00EDB166536684340', 'KAEJ', 'Central Colorado Regional Airport', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E610000066666666663653C0EACF7EA488684340', 'KADW', 'Camp Springs / Andrews Air Force Base', 'MD');
INSERT INTO postgis.stations VALUES ('0101000020E6100000156F641EF90D57C0AA656B7D91684340', 'KCOU', 'Columbia Regional Airport', 'MO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E960FD9FC3B857C0D3C1FA3F87694340', 'KIXD', 'Olathe, New Century Aircenter', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B8E4B8533AB654C073A25D85946B4340', 'KPMH', 'Greater Portsmouth Regional Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E610000047205ED72F4253C09B1BD313966C4340', 'KDCA', 'Washington/Reagan National Airport', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C2340C1F11D158C0CDCCCCCCCC6C4340', 'KHYS', 'Hays Regional Airport', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CC0BB08F4EAF57C0CDCCCCCCCC6C4340', 'KOJC', 'Olathe, Johnson County Executive Airport', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E36BCF2C09B458C02B4D4A41B76F4340', 'KRSL', 'Russell Municipal Airport', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B4AB90F293F653C0C5E6E3DA50714340', 'KEKN', 'Elkins-Randolph County-Jennings Randolph Field', 'WV');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A4E4D539068256C0E0F3C308E1714340', 'KALN', 'St. Louis Regional Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E610000044FAEDEBC0FF5DC06C04E275FD724340', 'KTVL', 'Lake Tahoe Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E61000006DC5FEB27B565EC0F8C264AA60744340', 'KLHM', 'Lincoln Regional Karl Harder Field', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CE8DE9094B8654C0BE13B35E0C754340', 'K3I2', 'Point Pleasant, Mason County Airport', 'WV');
INSERT INTO postgis.stations VALUES ('0101000020E61000004E621058399053C03D0AD7A370754340', 'KFRR', 'Front Royal-warren County Airport', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E610000048E17A14AE9B56C09E7B0F971C774340', 'KSET', 'St. Charles, St. Charles County Smartt Airport', 'MO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000713D0AD7A35C53C06475ABE7A4774340', 'KIAD', 'Washington/Dulles International Airport', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E61000007D0569C6A2E957C00664AF777F784340', 'KFOE', 'Topeka, Forbes Field', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F8C264AA60245AC0062FFA0AD2784340', 'KFLY', 'Meadow Lake Airport', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E610000076FD82DDB02B57C00C3CF71E2E794340', 'KVER', 'Jesse Viertel Memorial Airport', 'MO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AFEB17EC86455EC0E71DA7E8487A4340', 'KAUN', 'Auburn Municipal Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E0B9F770C99757C097A8DE1AD87A4340', 'KLXT', 'Lee''s Summit Municipal Airport', 'MO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F5673F5244345AC01D03B2D7BB7B4340', 'KAFF', 'Air Force Academy', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000744694F6063B53C0933A014D847D4340', 'KCGS', 'College Park Airport', 'MD');
INSERT INTO postgis.stations VALUES ('0101000020E610000097FF907EFBA454C021CD58349D7D4340', 'KI43', 'James A Rhodes Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D8648D7A88C853C07D96E7C1DD7D4340', 'KW99', 'Petersburg, Grant County Airport', 'WV');
INSERT INTO postgis.stations VALUES ('0101000020E61000001ADD41EC4C1F53C07B14AE47E17E4340', 'KNAK', 'Annapolis, United States Naval Academy', 'MD');
INSERT INTO postgis.stations VALUES ('0101000020E61000000000000000F05DC09D8026C2867F4340', 'KMEV', 'Minden-Tahoe Airport', 'NV');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C2340C1F111154C00000000000804340', 'KW22', 'Buckhannon, Upshur County Regional Airport', 'WV');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D6E253008CCD57C0B0C91AF510814340', 'KLWC', 'Lawrence, Lawrence Municipal Airport', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E8305F5E80E955C00473F4F8BD814340', 'KRSV', 'Robinson Municipal Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AABA52C08369183E22824340', 'KWWD', 'Wildwood, Cape May County Airport', 'NJ');
INSERT INTO postgis.stations VALUES ('0101000020E610000062DBA2CC062B55C0D95A5F24B4854340', 'KCVG', 'Cincinnati/Northern Kentucky International Airport', 'KY');
INSERT INTO postgis.stations VALUES ('0101000020E610000045F0BF95EC605AC04AD235936F864340', 'K4BM', 'Wilkerson Pass', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F8AA9509BF3058C0C993A46B26874340', 'KFRI', 'Fort Riley - Marshall AAF', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E610000072FE2614222256C0F0332E1C08894340', 'K1H2', 'Effingham County Memorial Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C3B645990DE857C0E17A14AE47894340', 'KTOP', 'Topeka, Philip Billard Municipal Airport', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A167B3EA730D55C0D200DE02098A4340', 'KI69', 'Batavia Clermont County Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C2340C1F113153C04963B48EAA8A4340', 'KFME', 'Fort Meade / Tipton', 'MD');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F5673F52446453C04963B48EAA8A4340', 'KJYO', 'Leesburg / Godfrey', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E61000003EE8D9ACFA4C57C04E621058398C4340', 'KMHL', 'Marshall Memorial Municipal Airport', 'MO');
INSERT INTO postgis.stations VALUES ('0101000020E610000023F8DF4A76645EC0F819170E848C4340', 'KMYV', 'Marysville, Yuba County Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E610000086AC6EF59C1A55C0C47762D68B8D4340', 'KLUK', 'Cincinnati Municipal Airport Lunken Field', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F5673F52443459C0672C9ACE4E8E4340', 'KOEL', 'Oakley Municipal Airport', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E6100000276BD44334A657C01630815B778F4340', 'KMKC', 'Kansas City Downtown Airport', 'MO');
INSERT INTO postgis.stations VALUES ('0101000020E610000090662C9ACECC5EC04EB9C2BB5C904340', 'KUKI', 'Ukiah Municipal Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBB5B5EC0B0C91AF510914340', 'KBAB', 'Marysville, Beale Air Force Base', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E61000008E01D9EBDDDD52C0B0C91AF510914340', 'KDOV', 'Dover Air Force Base', 'DE');
INSERT INTO postgis.stations VALUES ('0101000020E61000001CD3139678225BC077A1B94E23914340', 'KGJT', 'Grand Junction Regional Airport', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E610000081785DBF602B58C0C5E6E3DA50914340', 'KMHK', 'Manhattan Municipal Airport', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E6100000289B728577A755C0D1AE42CA4F924340', 'KBMG', 'Bloomington, Monroe County Airport', 'IN');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A999999998953C03333333333934340', 'KOKV', 'Winchester Regional', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E61000004694F6065FF456C05C8FC2F528944340', 'KMYJ', 'Mexico Memorial Airport', 'MO');
INSERT INTO postgis.stations VALUES ('0101000020E61000009352D0ED256B56C04D2D5BEB8B944340', 'K3LF', 'Litchfield Municipal Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E61000004D4A41B7974A53C0FD304278B4954340', 'KGAI', 'Gaithersburg - Montgomery County Airport', 'MD');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F949B54FC72B53C0A75CE15D2E964340', 'KBWI', 'Baltimore-Washington International Airport', 'MD');
INSERT INTO postgis.stations VALUES ('0101000020E610000062670A9DD7EE5DC07FF6234564984340', 'KCXP', 'Carson City Airport', 'NV');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AA0EB9196EE652C02BFBAE08FE9B4340', 'K33N', 'Delaware Airpark', 'DE');
INSERT INTO postgis.stations VALUES ('0101000020E61000001F85EB51B88E54C05C8FC2F5289C4340', 'KUNI', 'Ohio U/Athen-Albany', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DAE1AFC91A295AC063B9A5D5909C4340', 'KMNH', 'Elbert Mountain - Monument Pass', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E61000001C0B0A8332405EC0B3B112F3AC9C4340', 'KGOO', 'Nevada County Air Park', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E610000011FC6F253B945AC04CC3F011319D4340', 'KLXV', 'Leadville, Lake County Airport', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D235936FB6B75AC02159C0046E9D4340', 'KASE', 'Aspen-Pitkin County Airport', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000832F4CA60A9259C0D027F224E99E4340', 'KITR', 'Burlington - Carson County Airport', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000BD5296218E3155C09A779CA223A14340', 'KI67', 'Cincinnati W Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A999999997955C08369183E22A24340', 'KBAK', 'Columbus / Bakalar', 'IN');
INSERT INTO postgis.stations VALUES ('0101000020E610000049809A5AB6EA59C025581CCEFCA24340', 'KLIC', 'Limon Municipal Airport', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C5E6E3DA502D5EC09E0C8E9257A34340', 'KBLU', 'Emigrant Gap, Blue Canyon Nyack Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A0FD481119B65CC0F6285C8FC2A54340', 'KELY', 'Ely Airport', 'NV');
INSERT INTO postgis.stations VALUES ('0101000020E610000002F1BA7EC1AE57C0CBDB114E0BA64340', 'KMCI', 'Kansas City International Airport', 'MO');
INSERT INTO postgis.stations VALUES ('0101000020E610000075B0FECF610E54C06666666666A64340', 'KCKB', 'Clarksburg Benedum Airport', 'WV');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D8648D7A88085EC0EACF7EA488A84340', 'KTRK', 'Truckee-Tahoe', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CCD1E3F736E75BC083177D0569AA4340', 'K41U', 'Manti-Ephraim Airport', 'UT');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DDB5847CD09357C0C3F5285C8FAA4340', 'KGPH', 'Mosby Midwest National Air Center Airport', 'MO');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AA1A53C04963B48EAAAA4340', 'KMTN', 'Baltimore / Martin', 'MD');
INSERT INTO postgis.stations VALUES ('0101000020E61000008A93FB1D8A5055C0642310AFEBAB4340', 'KHLB', 'Batesville Airport', 'IN');
INSERT INTO postgis.stations VALUES ('0101000020E610000099D87C5C1B5C54C05C8FC2F528AC4340', 'KPKB', 'Parkersburg, Mid-Ohio Valley Regional Airport', 'WV');
INSERT INTO postgis.stations VALUES ('0101000020E61000001EFE9AAC512155C07C7E18213CAE4340', 'KHAO', 'Butler County Regional Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E61000003EE8D9ACFAC452C03468E89FE0AE4340', 'KMIV', 'Millville Municipal Airport', 'NJ');
INSERT INTO postgis.stations VALUES ('0101000020E61000009C8A54185B6C59C0D7A3703D0AAF4340', 'KGLD', 'Goodland, Renner Field', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E61000009335EA211AF558C01D9430D3F6AF4340', 'KHLC', 'Hill City Municipal Airport', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E61000002670EB6E9E205CC0B0C91AF510B14340', 'KDTA', 'Delta Municipal Airport', 'UT');
INSERT INTO postgis.stations VALUES ('0101000020E610000066666666667E53C0DD5ED218ADB34340', 'KMRB', 'Eastern WV Regional Airport/Shepherd Field', 'WV');
INSERT INTO postgis.stations VALUES ('0101000020E6100000085A8121AB5753C0B6F3FDD478B54340', 'KFDK', 'Frederick Municipal Airport', 'MD');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F5673F5244D85AC02D3E05C078B64340', 'K5SM', 'Sunlight', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E61000008E01D9EBDDF154C0A6F27684D3B64340', 'KILN', 'Wilmington, Airborne Airpark Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E610000087DC0C37E0AB5DC0AC5626FC52B74340', 'KNFL', 'Fallon, Naval Air Station', 'NV');
INSERT INTO postgis.stations VALUES ('0101000020E610000068226C787AC154C04694F6065FB84340', 'KRZT', 'Chillicothe Ross County Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E610000074417DCB9CD455C0FFB27BF2B0B84340', 'KHUF', 'Terre Haute Regional Airport', 'IN');
INSERT INTO postgis.stations VALUES ('0101000020E61000002ECA6C9049A452C0A79196CADBB94340', 'KACY', 'Atlantic City International Airport', 'NJ');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C7F484251E1055C09E98F56228BB4340', 'KI68', 'Warren County Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C8EA56CF491B57C0D751D50451BB4340', 'KMBY', 'Omar N Bradley Airport', 'MO');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AA0A53C01D03B2D7BBBB4340', 'KAPG', 'Phillips Army Air Field / Aberdeen', 'MD');
INSERT INTO postgis.stations VALUES ('0101000020E610000018265305A34C5DC0C03E3A75E5BB4340', 'KTMT', 'Austin Airport', 'NV');
INSERT INTO postgis.stations VALUES ('0101000020E61000006FF59CF4BE895AC0FF092E56D4BC4340', 'KCCU', 'Copper Mountain - Red Cliff Pass', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E61000008E01D9EBDD1156C04CC3F01131BD4340', 'KMTO', 'Mattoon / Charleston, Coles County Memorial Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C425C79DD2675EC0AC39403047BF4340', 'KOVE', 'Oroville Municipal Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000991249F4323255C03F355EBA49C04340', 'KOXD', 'Miami University Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E610000050C763062AF15DC0C51B9947FEC04340', 'KRNO', 'Reno Tahoe International Airport', 'NV');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F9F719170EEE5AC0E449D23593C34340', 'KRIL', 'Garfield County Regional Airport', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F7065F984C1955C08716D9CEF7C34340', 'KMWO', 'Hook Field Municipal Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E61000001B12F758FA5456C08E40BCAE5FC44340', 'KTAZ', 'Taylorville Municipal Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E61000007D0569C6A26958C0B4AB90F293C64340', 'KCNK', 'Concordia, Blosser Municipal Airport', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E61000005CE674594C365AC0085A8121ABC74340', 'KAPA', 'Denver - Centennial Airport', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F4FDD478E9DA54C0B7D100DE02C94340', 'KI23', 'Fayette County Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CB10C7BAB8D553C035EF384547CA4340', 'K2G4', 'Garrett County Airport', 'MD');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F3AB3940307355C0DE8E705AF0CA4340', 'KGEZ', 'Shelbyville Municipal Airport', 'IN');
INSERT INTO postgis.stations VALUES ('0101000020E61000009C8A54185B005DC01B12F758FACC4340', 'KP68', 'Eureka Airport ASOS', 'NV');
INSERT INTO postgis.stations VALUES ('0101000020E61000006666666666005DC0D39FFD4811CD4340', 'K05U', 'Eureka Airport AWOS', 'NV');
INSERT INTO postgis.stations VALUES ('0101000020E6100000780B24287E4053C012143FC6DCCD4340', 'KDMW', 'Carroll County Regional Jack B Poage Field', 'MD');
INSERT INTO postgis.stations VALUES ('0101000020E61000000E32C9C859B05BC0D9EBDD1FEFCD4340', 'KPUC', 'Price - Carbon County Regional Airport', 'UT');
INSERT INTO postgis.stations VALUES ('0101000020E610000034F44F70B1B053C002F1BA7EC1CE4340', 'KCBE', 'Greater Cumberland Regional Airport', 'WV');
INSERT INTO postgis.stations VALUES ('0101000020E61000001283C0CAA18555C01C7C613255D04340', 'KHFY', 'Greenwood Municipal Airport', 'IN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D578E92631B455C06FF085C954D14340', 'KGPC', 'Putnam County Regional Airport', 'IN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B9DFA128D0B156C0E8DEC325C7D14340', 'KPPQ', 'Pittsfield Penstone Municipal Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CBA145B6F35D53C0C3F5285C8FD24340', 'KRSP', 'Camp David', 'MD');
INSERT INTO postgis.stations VALUES ('0101000020E6100000FE43FAEDEBFA53C01EA7E8482ED34340', 'KMGW', 'Morgantown Municipal-Hart Field', 'WV');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AABA5AC03333333333D34340', 'KEGE', 'Eagle County Regional', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B98D06F016F85DC0F697DD9387D54340', 'KRTS', 'Reno/Stead', 'NV');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C68A1A4CC3E652C058E2016553D64340', 'KILG', 'Wilmington, New Castle County Airport', 'DE');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A5315A4755FF54C09B8F6B43C5D84340', 'KI19', 'Lewis A. Jackson Regional Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F46C567DAEEA55C02F8672A25DD94340', 'KPRG', 'Edgar County Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E61000001F85EB51B86E53C091442FA358DA4340', 'KHGR', 'Hagerstown, Washington County Regional Airport', 'MD');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F819170E84305AC073F4F8BD4DDB4340', 'KBKF', 'Buckley Air Force Base Airport', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E61000006EA301BC059255C04DDBBFB2D2DC4340', 'KIND', 'Indianapolis International Airport', 'IN');
INSERT INTO postgis.stations VALUES ('0101000020E610000071AC8BDB68DC56C09487855AD3DC4340', 'KHAE', 'Hannibal Regional Airport', 'MO');
INSERT INTO postgis.stations VALUES ('0101000020E610000041BCAE5FB09157C05AF0A2AF20DD4340', 'KEZZ', 'Cameron Memorial Airport', 'MO');
INSERT INTO postgis.stations VALUES ('0101000020E61000006744696FF03555C0FE43FAEDEBE04340', 'KRID', 'Richmond Municipal Airport', 'IN');
INSERT INTO postgis.stations VALUES ('0101000020E61000002A1DACFF73AA54C045F0BF95ECE04340', 'KLHQ', 'Lancaster, Fairfield County Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E6100000105839B4C8B258C0C520B07268E14340', 'KK82', 'Smith Center', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E61000003F709527107359C005F86EF3C6E14340', 'KSYF', 'St Francis', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E610000047205ED72FBA57C0D1AE42CA4FE24340', 'KSTJ', 'St. Joseph, Rosecrans Memorial Airport', 'MO');
INSERT INTO postgis.stations VALUES ('0101000020E61000008CF84ECC7A8F56C073637AC212E34340', 'KIJX', 'Jacksonville Municipal Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E61000005F419AB168225AC0D5EC815660E44340', 'KCFO', 'Colorado Air and Space Port Airport', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000BB9BA73AE4705AC06FD8B628B3E54340', 'K0CO', 'Berthoud Pass', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E61000009BE61DA7E8765EC0982F2FC03EE64340', 'KCIC', 'Chico Municipal Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A5315A47556557C0EACF7EA488E84340', 'KCDJ', 'Chillicothe Agri-Science Center', 'MO');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBBBB54C0EACF7EA488E84340', 'KLCK', 'Rickenbacker Air National Guard Base', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E61000003ECBF3E0EE9255C09A99999999E94340', 'KEYE', 'Indianapolis, Eagle Creek Airpark', 'IN');
INSERT INTO postgis.stations VALUES ('0101000020E61000009D2E8B89CD3756C027C286A757EA4340', 'KDEC', 'Decatur Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E610000033333333330355C04963B48EAAEA4340', 'KFFO', 'Dayton / Wright-Patterson Air Force Base', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E61000003BC269C18B2259C0F4E0EEACDDEA4340', 'KOIN', 'Oberlin Municipal Airport', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F6285C8FC2F554C0CFBD874B8EEB4340', 'KSGH', 'Springfield-Beckley Municipal Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E6100000FBAE08FEB74259C0A4C2D84290EB4340', 'KADT', 'Atwood-Rawlins County City-County Airport', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E6100000764F1E166A7955C08716D9CEF7EB4340', 'KMQJ', 'Indianapolis Mount Comfort Airport', 'IN');
INSERT INTO postgis.stations VALUES ('0101000020E61000000BB5A679C76B56C01C25AFCE31EC4340', 'KSPI', 'Springfield - Abraham Lincoln Capital Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CBBE2B82FF295AC04EB9C2BB5CEC4340', 'KDEN', 'Denver International Airport', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000BA83D89942F958C0541D7233DCEC4340', 'KNRN', 'Norton Municipal Airport', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E3361AC05B2858C068226C787AED4340', 'KMYZ', 'Marysville Municipal Airport', 'KS');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C3D8429083CE52C0F949B54FC7EF4340', 'KPHL', 'Philadelphia International Airport', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DB166536C8C854C0BAA0BE654EF34340', 'KTZR', 'Columbus, Bolton Field Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AA465AC0014D840D4FF34340', 'KBJC', 'Broomfield / Jeffco', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E61000000725CCB4FD0D55C00E4A9869FBF34340', 'KDAY', 'Dayton International Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E61000007923F3C81F3853C02F51BD35B0F54340', 'KTHV', 'York, York Airport', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A69BC420B09252C02DB29DEFA7F64340', 'KMJX', 'Miller Air Park', 'NJ');
INSERT INTO postgis.stations VALUES ('0101000020E610000021B0726891DD54C0567DAEB662F74340', 'KUYF', 'London Madison County Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E61000001F2E39EE94CC56C0728A8EE4F2F74340', 'KUIN', 'Quincy Regional Airport-Baldwin Field', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E4DA5031CEB552C046B1DCD26AF84340', 'KVAY', 'Mount Holly, South Jersey Regional Airport', 'NJ');
INSERT INTO postgis.stations VALUES ('0101000020E61000009335EA211A7954C06284F068E3F84340', 'KZZV', 'Zanesville Municipal Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DB8AFD65F76454C0CDCCCCCCCCFC4340', 'KCDI', 'Cambridge Municipal Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C9E53FA4DFBA55C022FDF675E0FC4340', 'KCFJ', 'Crawfordsville Municipal Airport', 'IN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000289B728577F752C07D96E7C1DDFD4340', 'KMQS', 'Chester County Airport', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000289B728577B356C06666666666FE4340', 'KI63', 'Mount Sterling Municipal Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B7627FD93DE552C0A6B8AAECBBFE4340', 'KOQN', 'Brandywine Regional Airport', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E610000043E21E4B1FB854C0D712F241CFFE4340', 'KCMH', 'John Glenn Columbus International Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E61000007E00529B38435AC05AD8D30E7F014440', 'KEIK', 'Erie Municipal Airport', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E61000006666666666A652C08369183E22024440', 'KWRI', 'Mcguire Air Force Base', 'NJ');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A999999999D54C05E807D74EA024440', 'KVTA', 'Newark Heath Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E61000006ABC7493189055C0CEA5B8AAEC034440', 'KTYQ', 'Indianapolis', 'IN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DD41EC4CA11156C0AA60545227044440', 'KCMI', 'University of Illinois - Willard', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D4601A868F9652C0715AF0A2AF044440', 'KNEL', 'Lakehurst Naval Air Station', 'NJ');
INSERT INTO postgis.stations VALUES ('0101000020E6100000295C8FC2F5C053C03EE8D9ACFA044440', 'K2G9', 'Somerset County Airport', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000890EDCDC734E5AC0DCFE4B080C054440', 'KBDU', 'Boulder Municipal Airport', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E61000007E18213CDAF85AC0A1F831E6AE054440', 'KEEO', 'Meeker Airport', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E61000009274CDE49B975AC0895E46B1DC064440', 'K20V', 'Kremmling, Mc Elroy Airfield', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E610000043CA4FAA7DA45DC0F085C954C1084440', 'KLOL', 'Lovelock, Derby Field Airport', 'NV');
INSERT INTO postgis.stations VALUES ('0101000020E61000000CC85EEFFEC454C01990BDDEFD094440', 'KOSU', 'Columbus, Ohio State University Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E61000006E4C4F58E2E557C0A0FD4811190A4440', 'KFNB', 'Falls City, Brenner Field Airport', 'NE');
INSERT INTO postgis.stations VALUES ('0101000020E610000082397AFCDEC052C0A0FD4811190A4440', 'KPNE', 'Philadelphia, Northeast Philadelphia Airport', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DB166536C8A053C05E807D74EA0A4440', 'KHMZ', 'Bedford, Bedford County Airport', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000268DD13AAA7A5AC0C1560916870B4440', 'KGNB', 'Granby-Grand County Airport', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B0389CF9D5305BC00E677E35070C4440', 'K4V0', 'Rangely Airport', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E23B31EBC52257C0314278B4710C4440', 'KIRK', 'Kirksville, Kirksville Regional Airport', 'MO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F3936A9F8E8F59C0F168E388B50C4440', 'K2V5', 'Wray Municipal Airport', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AF25E4839EAD59C0AF946588630D4440', 'K2V6', 'Yuma Municipal Airport', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E61000003E05C078066755C0CBB91457950D4440', 'KAID', 'Anderson Municipal Airport', 'IN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000BB7EC16ED81253C09D465A2A6F0F4440', 'KLNS', 'Lancaster Airport', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E61000009C33A2B437F054C08CB96B09F9104440', 'KI74', 'Urbana Grimes Field', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E610000072FE2614221254C0B0C91AF510114440', 'KAFJ', 'Washington County Airport', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C58F31772DD152C0B64AB0389C114440', 'KLOM', 'Philadelphia - Wings Field Airport', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E610000082E2C798BBEA5BC0C3F5285C8F124440', 'KSPK', 'Spanish Fork Municipal Airport', 'UT');
INSERT INTO postgis.stations VALUES ('0101000020E61000006AD95A5F24905EC0FA0AD28C45134440', 'KRBL', 'Red Bluff Municipal Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B62DCA6C906558C008E6E8F17B134440', 'KHJH', 'Hebron Municipal Airport', 'NE');
INSERT INTO postgis.stations VALUES ('0101000020E6100000649291B3B05556C01C7C613255144440', 'KAAA', 'Logan County Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F5673F52444A5AC00DE02D90A0144440', 'KLMO', 'Vance Brand Airport', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000FE0E45813E2954C0D9942BBCCB154440', 'KHLG', 'Wheeling Ohio County Airport', 'WV');
INSERT INTO postgis.stations VALUES ('0101000020E61000001D03B2D7BBCD59C0672C9ACE4E164440', 'KAKO', 'Colorado Plains Regional Airport', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D8648D7A888852C01630815B77174440', 'KBLM', 'Belmar-Farmingdale', 'NJ');
INSERT INTO postgis.stations VALUES ('0101000020E61000009886E12362985BC01B0DE02D90184440', 'KU69', 'Duchesne', 'UT');
INSERT INTO postgis.stations VALUES ('0101000020E610000090831266DA3053C0DB166536C8184440', 'KMDT', 'Harrisburg International Airport', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E610000092B3B0A71DE655C0D3C1FA3F87194440', 'KDNV', 'Danville, Vermilion County Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E61000005D50DF32A72559C01990BDDEFD194440', 'KMCK', 'McCook Municipal Airport', 'NE');
INSERT INTO postgis.stations VALUES ('0101000020E6100000832F4CA60A2255C0B5A679C7291A4440', 'KVES', 'Versailles Darke County Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E61000008E01D9EBDDED5BC01D03B2D7BB1B4440', 'KPVU', 'Provo Municipal Airport', 'UT');
INSERT INTO postgis.stations VALUES ('0101000020E610000082E2C798BB3653C08E3BA583F51B4440', 'KCXY', 'Harrisburg, Capital City Airport', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E61000008351499D80D654C0A2B437F8C21C4440', 'KMRT', 'Marysville Union County Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E61000003A58FFE7305955C027DA5548F91D4440', 'KMIE', 'Muncie, Delaware County-Johnson Field', 'IN');
INSERT INTO postgis.stations VALUES ('0101000020E610000004E275FD82E352C09FE57970771E4440', 'KPTW', 'Pottstown Limerick Airport', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E610000055A4C2D842DA53C0D044D8F0F4224440', 'KLBE', 'Latrobe / Westmoreland', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000EB73B515FBA355C0FB5C6DC5FE224440', 'KFKR', 'Frankfort Municipal Airport', 'IN');
INSERT INTO postgis.stations VALUES ('0101000020E610000003B2D7BB3FB452C081785DBF60234440', 'KTTN', 'Trenton, Mercer County Airport', 'NJ');
INSERT INTO postgis.stations VALUES ('0101000020E61000002C6519E258C754C07958A835CD234440', 'KDLZ', 'Delaware Municipal Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E61000003333333333835BC0A4703D0AD7234440', 'K74V', 'Roosevelt', 'UT');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DAACFA5C6D0956C0DBC4C9FD0E254440', 'KTIP', 'Rantoul National Aviation Center Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DCD78173469453C09161156F64264440', 'KAOO', 'Altoona - Blair County Airport', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E610000000000000003058C06666666666264440', 'KBIE', 'Beatrice Municipal', 'NE');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A9DE1AD82AB553C055C1A8A44E284440', 'KJST', 'Johnstown - Cambria County Airport', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E61000003D9B559FABA154C0C3D32B65192A4440', 'K4I3', 'Knox County Airfield', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E6100000247F30F0DCC752C04339D1AE422A4440', 'KDYL', 'Doylestown Airport', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E610000016A4198BA6F359C098A3C7EF6D2A4440', 'KFMM', 'Fort Morgan Municipal Airport', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C3F5285C8FBA57C085EB51B81E2D4440', 'KEVU', 'Maryville Northwest Missouri Regional Airport', 'MO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000622D3E05C0AC5AC02F8672A25D2D4440', 'KC07', 'Walton Peak', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E61000007B4E7ADFF8FA53C0289B7285772D4440', 'KAGC', 'Pittsburgh - Allegheny County Airport', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E61000008638D6C56DF454C08126C286A72F4440', 'KEDJ', 'Bellefontaine Regional Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E61000005A9E077767FD52C0CF4E0647C92F4440', 'KRDG', 'Reading Regional Airport', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C22FF5F3A6245EC095B7239C16304440', 'KSVE', 'Susanville Municipal Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000069E7B0F97D252C012F758FAD0314440', 'KCKZ', 'Pennridge Airport', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000713D0AD7A3BC55C0CDCCCCCCCC344440', 'KLAF', 'Lafayette, Purdue University Airport', 'IN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D8648D7A88285AC01630815B77374440', 'KGXY', 'Greeley-Weld County Airport', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D5CF9B8A54D852C04772F90FE9374440', 'KUKT', 'Quakertown Airport', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C7F484251E2453C00E84640113384440', 'KMUI', 'Muir Army Air Field / Indiantown', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000666B7D91D0605BC0B1E1E995B2384440', 'KVEL', 'Vernal Airport', 'UT');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C2340C1F11415AC09A99999999394440', 'KFNL', 'Fort Collins/Loveland - Northern Colorado Regional Airport', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A5315A4755D558C09A99999999394440', 'KHDE', 'Brewster Field Airport', 'NE');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CC28965B5ADB56C02CB7B41A123B4440', 'KEOK', 'Keokuk Municipal Airport', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E61000008C101E6D1C5B54C04DD6A887683C4440', 'KPHD', 'New Philadelphia, Harry Clever Field', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E610000086AC6EF59C3A56C0BE13B35E0C3D4440', 'KBMI', 'Central Illinois Regional Airport at Bloomington-Normal', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E610000068B3EA73B5DB5BC0693A3B191C3D4440', 'KHCR', 'Heber City Municipal-Russ McDonald Field Airport', 'UT');
INSERT INTO postgis.stations VALUES ('0101000020E61000008E01D9EBDDCD5AC07D96E7C1DD3D4440', 'KHDN', 'Hayden, Yampa Valley Airport', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000EC51B81E856B55C01F85EB51B83E4440', 'KMZZ', 'Marion Municipal Airport', 'IN');
INSERT INTO postgis.stations VALUES ('0101000020E61000003D44A33B88E15AC05EF415A4193F4440', 'KCAG', 'Craig-Moffat Airport', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DEE522BE131355C0904E5DF92C3F4440', 'KAXV', 'Neil Armstrong Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D07EA4880C1154C00664AF777F404440', 'KPIT', 'Pittsburgh International Airport', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E61000003B014D840D935EC0E71890BDDE414440', 'KRDD', 'Redding Municipal Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E61000001A6EC0E787B75AC07DD0B359F5414440', 'KSBS', 'Steamboat Springs', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E6100000289B7285776759C08369183E22424440', 'KIML', 'Imperial Municipal Airport', 'NE');
INSERT INTO postgis.stations VALUES ('0101000020E610000033E197FA79A956C0D8B628B341424440', 'KMQB', 'Macomb Municipal Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F5673F52448455C0E3FC4D2844444440', 'KOKK', 'Kokomo Municipal Airport', 'IN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000317C444C89085FC082FFAD64C7464440', 'KFOT', 'Fortuna Rohnerville Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AC1C5A643BDF52C0295C8FC2F5484440', 'KXLL', 'Allentown Queen City Municipal Airport', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D235936FB69159C0B003E78C28494440', 'KHEQ', 'Holyoke Airport', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E610000024B9FC87F4375DC0E9263108AC4C4440', 'KBAM', 'Battle Mountain - Lander County Airport', 'NV');
INSERT INTO postgis.stations VALUES ('0101000020E61000006666666666F657C0CDCCCCCCCC4C4440', 'KAFK', 'Nebraska City Municipal Airport', 'NE');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F7E978CC409B58C094A46B26DF4C4440', 'KHSI', 'Hastings Municipal Airport', 'NE');
INSERT INTO postgis.stations VALUES ('0101000020E61000008ACDC7B5A1165CC00A4B3CA06C4E4440', 'KTVY', 'Bolinder Field-Tooele Valley Airport', 'UT');
INSERT INTO postgis.stations VALUES ('0101000020E610000002D4D4B2B5D059C0A6272CF1804E4440', 'KSTK', 'Sterling Municipal Airport', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E61000007CD5CA845FC454C05036E50AEF4E4440', 'KMNN', 'Marion, Marion Municipal Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E61000008126C286A78F52C0744694F6064F4440', 'KLDJ', 'Linden Airport', 'NJ');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AC730CC85EFF5BC0014D840D4F4F4440', 'KU42', 'Salt Lake City Municipal 2 Airport', 'UT');
INSERT INTO postgis.stations VALUES ('0101000020E6100000666B7D91D0AA52C0CE88D2DEE04F4440', 'KSMQ', 'Somerville, Somerset Airport', 'NJ');
INSERT INTO postgis.stations VALUES ('0101000020E610000085EB51B81EF559C0713D0AD7A3504440', 'K1NW', 'November (Grover)', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E61000005D50DF32A77957C03815A930B6504440', 'KLWD', 'Lamoni Municipal Airport', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E61000006666666666C653C0B0C91AF510514440', 'KIDI', 'Indiana / Stewart Field', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000BB9BA73AE47052C0849ECDAACF514440', 'KJFK', 'New York, Kennedy International Airport', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E605D847A7DC52C01EA7E8482E534440', 'KABE', 'Allentown, Lehigh Valley International Airport', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A999999998955C03333333333534440', 'KGUS', 'Grissom Air Force Base / Peru', 'IN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000BEBC00FBE8D456C0787FBC57AD544440', 'KFSW', 'Fort Madison Municipal Airport', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000EF0390DAC46B56C03D0AD7A370554440', 'KPIA', 'General Downing-Peoria International Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E610000097A8DE1AD88A52C08FC2F5285C574440', 'KEWR', 'Newark International Airport', 'NJ');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D8648D7A886853C01630815B77574440', 'KRVL', 'Reedsville / Mifflin', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E61000008B6CE7FBA93957C001DE02098A574440', 'KTVK', 'Centerville Municipal Airport', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E61000001F85EB51B8DE59C09A99999999594440', 'K1MW', 'MIKE (HAXTUN)', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E61000007F6ABC74938052C044FAEDEBC0594440', 'KJRB', 'New York Downtown Manhattan', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000889D29745E0155C08ACDC7B5A15A4440', 'KAOH', 'Lima Allen County Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A9A44E4013B155C0D0B359F5B95A4440', 'KMCX', 'Monticello White County Airport', 'IN');
INSERT INTO postgis.stations VALUES ('0101000020E61000001D5A643BDF9755C05EBA490C025B4440', 'KGGP', 'Logansport/Cass County Airport', 'IN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CE8DE9094B825CC02367614F3B5C4440', 'KENV', 'Wendover / Air Force Auxillary Field', 'UT');
INSERT INTO postgis.stations VALUES ('0101000020E61000006F2A52616CC157C0D4B7CCE9B25C4440', 'KICL', 'Schenck Field Airport', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E61000000000000000C058C07D96E7C1DD5D4440', 'KEAR', 'Kearney Municipal Airport', 'NE');
INSERT INTO postgis.stations VALUES ('0101000020E61000006A183E22A65A52C0C4995FCD015E4440', 'KFRG', 'Farmingdale - Republic Airport', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E610000061545227A0915AC01D386744695F4440', 'K33V', 'Walden-Jackson County Airport', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AADA57C00000000000604440', 'KSDA', 'Shenandoah Municipal', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E61000002B6A300DC3FD5BC058AD4CF8A5624440', 'KSLC', 'Salt Lake City International Airport', 'UT');
INSERT INTO postgis.stations VALUES ('0101000020E6100000FCFB8C0B07C856C0740CC85EEF624440', 'KBRL', 'Burlington Regional Airport', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F1D7648D7A1854C082902C6002634440', 'KBVI', 'Beaver County Airport', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B81E85EB517852C01D03B2D7BB634440', 'KLGA', 'New York, La Guardia Airport', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E61000008E01D9EBDD7D52C0E3FC4D2844644440', 'KNYC', 'New York City, Central Park', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CDCCCCCCCCFC53C0E3FC4D2844644440', 'KBTP', 'Butler County Airport/K W Scholter Field', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E61000000473F4F8BDF158C0F0C4AC1743654440', 'KLXN', 'Lexington, Jim Kelly Field Airport', 'NE');
INSERT INTO postgis.stations VALUES ('0101000020E6100000FF3EE3C2814652C08B4F01309E654440', 'KISP', 'Islip, Long Island Mac Arthur Airport', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AA9A52C06666666666664440', 'KMMU', 'Morristown Municipal', 'NJ');
INSERT INTO postgis.stations VALUES ('0101000020E610000003CFBD874B0A54C0C22FF5F3A6664440', 'KPJC', 'Zelienople Municipal Airport', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000410E4A98693753C04DF8A57EDE684440', 'KSEG', 'Selinsgrove Penn Valley Airport', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E610000077A1B94E23A154C00CC85EEFFE684440', 'KMFD', 'Mansfield Lahm Regional Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E61000009274CDE49B3752C05A0D897B2C694440', 'KHWV', 'Shirley, Brookhaven Airport', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E61000006A4DF38E53F25CC0444C89247A694440', 'KEKO', 'Elko Regional Airport', 'NV');
INSERT INTO postgis.stations VALUES ('0101000020E610000045F0BF95EC3058C075B0FECF616A4440', 'KLNK', 'Lincoln Municipal Airport', 'NE');
INSERT INTO postgis.stations VALUES ('0101000020E61000003659A31EA22752C02922C32ADE6C4440', 'KFOK', 'The Gabreski Airport', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E61000001AC05B20415D55C01361C3D32B6D4440', 'KHHG', 'Huntington Municipal Airport', 'IN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A857CA32C47553C0938C9C853D6D4440', 'KUNV', 'State College - University Park Airport', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000842A357BA08352C0446E861BF06D4440', 'KTEB', 'Teterboro Airport', 'NJ');
INSERT INTO postgis.stations VALUES ('0101000020E610000090662C9ACE2655C0DFA63FFB916E4440', 'KVNW', 'Van Wert County Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E610000009168733BF7854C00FB9196EC06F4440', 'KBJJ', 'Wooster, Wayne County Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E610000092B3B0A71D9252C04E452A8C2D704440', 'KCDW', 'Caldwell, Essex County Airport', 'NJ');
INSERT INTO postgis.stations VALUES ('0101000020E61000000000000000005AC0454772F90F714440', 'K1OW', 'Oscar', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E61000006475ABE7A47F58C0581CCEFC6A724440', 'KAUH', 'Aurora Municipal Airport', 'NE');
INSERT INTO postgis.stations VALUES ('0101000020E61000009626A5A0DB6758C0F4A62215C6724440', 'KJYR', 'York Municipal Airport', 'NE');
INSERT INTO postgis.stations VALUES ('0101000020E6100000562B137EA9735DC0257A19C572734440', 'KWMC', 'Winnemucca Municipal Airport', 'NV');
INSERT INTO postgis.stations VALUES ('0101000020E61000002E043928615C54C0B610E4A084754440', 'KCAK', 'Akron Canton Regional Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CDCCCCCCCCEC59C0F6285C8FC2754440', 'K1LW', 'Lima - Grover', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E61000004F401361C32756C060B01BB62D764440', 'KPNT', 'Pontiac Municipal Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000761A69A9BC9B56C01D38674469774440', 'KGBG', 'Galesburg Municipal Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E610000026AAB706B6E056C05A0D897B2C794440', 'KMPZ', 'Mount Pleasant Municipal Airport', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D6390664AFCB55C04C1AA37554794440', 'KRZL', 'Rensselaer Jasper County Airport', 'IN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000103B53E8BCFA57C09A99999999794440', 'KPMV', 'Plattsmouth Municipal Airport', 'NE');
INSERT INTO postgis.stations VALUES ('0101000020E610000000000000009458C04963B48EAA7A4440', 'KGRI', 'Grand Island, Central Nebraska Regional Airport', 'NE');
INSERT INTO postgis.stations VALUES ('0101000020E61000007923F3C81F1052C0B43C0FEECE7A4440', 'KHTO', 'East Hampton Airport', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CDCCCCCCCCCC59C088855AD3BC7B4440', 'K1JW', 'Juliet - Peetz', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E61000000938842A354D55C038842A357B7C4440', 'KFWA', 'Fort Wayne International Airport', 'IN');
INSERT INTO postgis.stations VALUES ('0101000020E610000030815B77F3065FC04CC3F011317D4440', 'KACV', 'Eureka, Arcata Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E8D9ACFA5CFF52C052F2EA1C037E4440', 'KHZL', 'Hazleton Municipal Airport', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000BA2C26361FAF52C0E140481630814440', 'K12N', 'Aeroflex-Andover Airport', 'NJ');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D4F19881CAEA54C00473F4F8BD814440', 'KFDY', 'Findlay Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C2340C1F11D157C08369183E22824440', 'KRDK', 'Red Oak', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C976BE9F1A9757C0ED9925016A824440', 'KCSQ', 'Creston Municipal Airport', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000064CE0D6DD5856C065C22FF5F3824440', 'KC75', 'Marshall County Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E61000002A1DACFF731A54C0179F02603C834440', 'KUCP', 'New Castle Municipal Airport', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000289B7285775757C0E3FC4D2844844440', 'KCNC', 'Chariton', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000022B8716D9FE54C06ADE718A8E844440', 'KOWX', 'Ottawa Putnam County Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E610000055F65D11FCDF5AC069520ABABD844440', 'KDWX', 'Dixon Airport', 'WY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000327216F6B45D54C0CDCCCCCCCC844440', 'KAKR', 'Akron Fulton International Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A3AF20CD589A53C027DA5548F9854440', 'KFIG', 'Clearfield-Lawrence Airport', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A94D9CDCEFFE56C0910F7A36AB864440', 'KFFL', 'Fairfield Municipal Airport', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E61000000057B263236C57C03B191C25AF864440', 'KI75', 'Osceola Municipal Airport', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E61000007784D382176D52C032207BBDFB874440', 'KHPN', 'White Plains - Westchester County Airport', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A80018CFA08B55C015747B4963884440', 'KRCR', 'Rochester Fulton County Airport', 'IN');
INSERT INTO postgis.stations VALUES ('0101000020E61000003BFC3559A3F655C03F74417DCB884440', 'KIKK', 'Greater Kankakee Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E61000009B5AB6D617FB51C0A852B3075A894440', 'KMTP', 'Montauk Airport', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000BB0F406A13BF59C006F52D73BA8C4440', 'KSNY', 'Sidney Municipal Airport', 'NE');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AD2F12DA721C57C0306475ABE78C4440', 'KOTM', 'Ottumwa Regional Airport', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E610000024D1CB2896FD5BC03CF71E2E398E4440', 'KHIF', 'Hill Air Force Base', 'UT');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A99999999F957C05036E50AEF8E4440', 'KOFF', 'Omaha / Offutt Air Force Base', 'NE');
INSERT INTO postgis.stations VALUES ('0101000020E61000002C0E677E357159C0AC5626FC528F4440', 'KOGA', 'Ogallala, Searle Field Airport', 'NE');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E23B31EBC52A59C08109DCBA9B8F4440', 'KLBF', 'North Platte Regional Airport', 'NE');
INSERT INTO postgis.stations VALUES ('0101000020E61000001F85EB51B8DE59C0713D0AD7A3904440', 'K1KW', 'Kilo (Dix)', 'NE');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C45A7C0A80375AC08CF337A110914440', 'KFEW', 'Francis E Warren Air Force Base Heliport', 'WY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B5FD2B2B4DD852C076FD82DDB0914440', 'KMPO', 'Pocono Mountains Municipal Airport', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E61000001C7C613255085AC0083D9B559F934440', 'K82V', 'Pine Bluffs Municipal Airport', 'WY');
INSERT INTO postgis.stations VALUES ('0101000020E610000096CFF23CB8335AC0C72E51BD35944440', 'KCYS', 'Cheyenne Airport', 'WY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000522CB7B41A4852C08CD651D504954440', 'KBDR', 'Bridgeport, Sikorsky Memorial Airport', 'CT');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B3CD8DE909E551C099D36531B1954440', 'KBID', 'Block Island State Airport', 'RI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CCB4FD2B2BB953C09E245D33F9964440', 'KDUJ', 'Du Bois - Jefferson County Airport', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AAEA59C01630815B77974440', 'KIBM', 'Kimball Municipal Airport/Robert E Arraj Field', 'NE');
INSERT INTO postgis.stations VALUES ('0101000020E6100000BB0F406A13015CC01BBB44F5D6984440', 'KOGD', 'Ogden-Hinckley Airport', 'UT');
INSERT INTO postgis.stations VALUES ('0101000020E6100000417DCB9C2E0758C0B0C91AF510994440', 'KMLE', 'Omaha, Millard Airport', 'NE');
INSERT INTO postgis.stations VALUES ('0101000020E61000008750A5660FA852C02FDD240681994440', 'KFWN', 'Sussex Airport', 'NJ');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E3A59BC4205054C07B14AE47E19A4440', 'KPOV', 'Portage County Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A1BE654E971F57C037A6272CF19C4440', 'KOOA', 'Oskaloosa Municipal Airport', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E78C28ED0D2658C074B515FBCB9E4440', 'KAHQ', 'Wahoo', 'NE');
INSERT INTO postgis.stations VALUES ('0101000020E61000007E6FD39FFD3A53C082CAF8F7199F4440', 'KIPT', 'Williamsport - Lycoming County Airport', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B2BAD573D28351C00664AF777FA04440', 'KACK', 'Nantucket Memorial Airport', 'MA');
INSERT INTO postgis.stations VALUES ('0101000020E61000007EC68503212B54C0AA656B7D91A04440', 'KYNG', 'Youngstown-Warren Regional Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E610000038F8C264AAF057C03D0AD7A370A14440', 'KCBF', 'Council Bluffs', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DB166536C83852C0E8DEC325C7A14440', 'KHVN', 'New Haven, Tweed-New Haven Airport', 'CT');
INSERT INTO postgis.stations VALUES ('0101000020E61000003524EEB1F4C15BC042EC4CA1F3A24440', 'KEVW', 'Evanston-Uinta County Burns Field', 'WY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F6285C8FC27555C06C5B94D920A34440', 'KASW', 'Warsaw Municipal Airport', 'IN');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AAEA56C0E3FC4D2844A44440', 'KAWG', 'Washington', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000289B7285774757C06666666666A64440', 'KOXV', 'Knoxville', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E61000006ABC7493184455C09EEFA7C64BA74440', 'KGWB', 'Auburn De Kalb County Airport', 'IN');
INSERT INTO postgis.stations VALUES ('0101000020E610000072F90FE9B7F957C0ABCFD556ECA74440', 'KOMA', 'Omaha - Eppley Airfield', 'NE');
INSERT INTO postgis.stations VALUES ('0101000020E6100000630B410E4A945EC0E31934F44FA84440', 'KMHS', 'Mount Shasta', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000691D554D106B5AC08D976E1283A84440', 'KLAR', 'Laramie Regional Airport', 'WY');
INSERT INTO postgis.stations VALUES ('0101000020E610000085EB51B81EB559C0295C8FC2F5A84440', 'K1HW', 'Hotel (Gurley)', 'NE');
INSERT INTO postgis.stations VALUES ('0101000020E610000050C763062A0352C052B81E85EBA94440', 'KGON', 'Groton / New London Airport', 'CT');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C3F5285C8FAA55C00AD7A3703DAA4440', 'KOXI', 'Starke County Airport', 'IN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E17A14AE47115AC00AD7A3703DAA4440', 'K1AW', 'Alpha (Burns)', 'WY');
INSERT INTO postgis.stations VALUES ('0101000020E610000008E6E8F17B1B55C0C959D8D30EAB4440', 'KDFI', 'Defiance Memorial Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E6100000FF3EE3C281EE52C081785DBF60AB4440', 'KAVP', 'Wilkes-Barre / Scranton International Airport', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E610000008E6E8F17B8B54C0C7681D554DAC4440', 'KLPR', 'Lorain County Regional Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E61000007EC6850321F351C0E960FD9FC3AC4440', 'KWST', 'Westerly State Airport', 'RI');
INSERT INTO postgis.stations VALUES ('0101000020E61000000820B589934956C01B2FDD2406AD4440', 'KVYS', 'Illinois Valley Regional Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A99999999C956C05036E50AEFAE4440', 'KMUT', 'Muscatine', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E610000033333333339355C05036E50AEFAE4440', 'KC65', 'Plymouth', 'IN');
INSERT INTO postgis.stations VALUES ('0101000020E61000003333333333F359C08FC2F5285CAF4440', 'K1DW', 'Delta - Kimball', 'NE');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F437A110015F52C0C173EFE192AF4440', 'KDXR', 'Danbury Municipal Airport', 'CT');
INSERT INTO postgis.stations VALUES ('0101000020E6100000289B728577F753C0B0C91AF510B14440', 'KFKL', 'Franklin, Venango Regional Airport', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E61000007CD5CA845F2052C077A1B94E23B14440', 'KSNC', 'Chester Airport', 'CT');
INSERT INTO postgis.stations VALUES ('0101000020E61000000742B280099A5BC01904560E2DB24440', 'KFBR', 'Fort Bridger', 'WY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AC90F2936AA751C0B5FD2B2B4DB24440', 'KMVY', 'Marthas Vineyard Airport', 'MA');
INSERT INTO postgis.stations VALUES ('0101000020E61000003333333333C357C03333333333B34440', 'KAIO', 'Atlantic', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBB3B57C03333333333B34440', 'KPEA', 'Pella Municipal Airport', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CD1E6805867654C0392861A6EDB34440', 'KCLE', 'Cleveland Hopkins International Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E610000043FF04172BA053C086200725CCB44440', 'KOYM', 'St Marys Municipal Airport', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E5D022DBF90658C0BE30992A18B54440', 'KBTA', 'Blair Municipal Airport', 'NE');
INSERT INTO postgis.stations VALUES ('0101000020E610000014E81379921A56C09ED2C1FA3FB74440', 'KC09', 'Morris Muni-James R Washburn Field Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A99999999E958C01630815B77B74440', 'KBBW', 'Broken Bow Municipal Airport', 'NE');
INSERT INTO postgis.stations VALUES ('0101000020E610000062105839B4B45AC0CD237F30F0B84440', 'KSAA', 'Saratoga', 'WY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CFA0A17F82A156C09A081B9E5EB94440', 'KMLI', 'Moline Quad-City Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C2340C1F112158C09A99999999B94440', 'KFET', 'Fremont Municipal Airport', 'NE');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A5315A47555558C09A99999999B94440', 'KOLU', 'Columbus Municipal Airport', 'NE');
INSERT INTO postgis.stations VALUES ('0101000020E610000076711B0DE0BF55C01288D7F50BBA4440', 'KVPZ', 'Valparaiso Porter County Municipal Airport', 'IN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D8648D7A884852C07D96E7C1DDBD4440', 'KOXC', 'Waterbury-Oxford Airport', 'CT');
INSERT INTO postgis.stations VALUES ('0101000020E61000000E2DB29DEF235EC084D89942E7BD4440', 'KAAT', 'Alturas', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E610000066666666668652C00000000000C04440', 'KSWF', 'Newburgh / Stewart', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000295C8FC2F59052C05A0D897B2CC14440', 'KMGJ', 'Montgomery, Orange County Airport', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E61000001B12F758FA3452C0FE0E45813EC14440', 'KMMK', 'Meriden Markham Municipal Airport', 'CT');
INSERT INTO postgis.stations VALUES ('0101000020E61000004182E2C798B754C060764F1E16C24440', 'KPCW', 'Port Clinton Carl R Keller Field Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E61000002FC03E3A750B56C0BC0512143FC24440', 'KJOT', 'Joliet Regional Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E61000000000000000005AC0C3F5285C8FC24440', 'K1BW', 'Bravo (Pine Bluffs)', 'NE');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C6A70018CF6A54C0FA0AD28C45C34440', 'KBKL', 'Cleveland, Burke Lakefront Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A3AF20CD587255C09E0C8E9257C34440', 'KGSH', 'Goshen Municipal Airport', 'IN');
INSERT INTO postgis.stations VALUES ('0101000020E610000063B48EAA26D251C0A4703D0AD7C34440', 'KUUU', 'Newport State Airport', 'RI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000EBFF1CE6CB6957C00E32C9C859C44440', 'KDSM', 'Des Moines International Airport', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F645425BCEE155C0E17A14AE47C54440', 'KIGQ', 'Lansing Municipal Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000569FABADD8035CC06744696FF0C54440', 'KBMC', 'Brigham City Regional Airport', 'UT');
INSERT INTO postgis.stations VALUES ('0101000020E61000000D897B2C7DDE54C0C7D79E5912C84440', 'KTDZ', 'Toledo Executive Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E61000003ECBF3E0EE5E54C0EACF7EA488C84440', 'KCGF', 'Cleveland / Cuyahoga', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E61000005EBA490C02AF55C0E17A14AE47C94440', 'KPPO', 'La Porte Municipal Airport', 'IN');
INSERT INTO postgis.stations VALUES ('0101000020E61000000473F4F8BDD557C0B43C0FEECECA4440', 'KHNR', 'Harlan Municipal Airport', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A1A17F828BF354C0D0B8702024CB4440', 'KTOL', 'Toledo Express Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E61000007B14AE47E1EA59C0EC51B81E85CB4440', 'K1CW', 'Charlie (Gering)', 'NE');
INSERT INTO postgis.stations VALUES ('0101000020E61000004E452A8C2D445BC0D52137C30DCC4440', 'KRKS', 'Rock Springs-Sweetwater County Airport', 'WY');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AADA51C0CDCCCCCCCCCC4440', 'KOQU', 'N. Kingston / Quonset', 'RI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CAFD0E45810656C07099D36531CD4440', 'KLOT', 'Lewis University Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E61000004703780B240855C012A5BDC117CE4440', 'KUSE', 'Wauseon Fulton County Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A75CE15D2EDA55C01F9DBAF259CE4440', 'KGYY', 'Gary Regional Airport', 'IN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000397F130A11A656C09F02603C83CE4440', 'KDVN', 'Davenport Municipal Airport', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000295C8FC2F5BC58C0799274CDE4CF4440', 'KODX', 'Ord, Evelyn Sharp Field Airport', 'NE');
INSERT INTO postgis.stations VALUES ('0101000020E610000048A7AE7C960D54C0AA436E861BD04440', 'KGKJ', 'Port Meadville Airport', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AD86C43D967852C031B1F9B836D04440', 'KPOU', 'Poughkeepsie, Dutchess County Airport', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000022B8716D9E256C0AEB6627FD9D14440', 'KIOW', 'Iowa City Municipal Airport', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C2340C1F11A151C03333333333D34440', 'KFMH', 'Otis Air National Guard Base', 'MA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000137EA99F374157C0E8DEC325C7D54440', 'KTNU', 'Newton Municipal Airport - Earl Johnson Field', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F0C4AC17439151C0E76F422102D64440', 'KHYA', 'Hyannis, Barnstable Municipal-Boardman Airport', 'MA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000FE0E45813EBD51C04AD235936FD64440', 'KEWB', 'New Bedford Regional Airport', 'MA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D8648D7A885854C01630815B77D74440', 'KLNN', 'Willoughby', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AF08FEB7927F51C00000000000D84440', 'KCQX', 'Chatham Municipal Airport', 'MA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000314278B4716457C072C45A7C0AD84440', 'KIKV', 'Ankeny Regional Airport', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E61000003333333333B352C09A99999999D94440', 'KMSV', 'Monticello, Sullivan County International Airport', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E61000006DCA15DEE5BA57C00473F4F8BDD94440', 'KADU', 'Audubon County Airport', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E61000006ADE718A8EB455C06EA301BC05DA4440', 'KMGC', 'Michigan City Municipal Airport', 'IN');
INSERT INTO postgis.stations VALUES ('0101000020E61000006E8B321B649455C0103B53E8BCDA4440', 'KSBN', 'South Bend International Airport', 'IN');
INSERT INTO postgis.stations VALUES ('0101000020E61000002575029A082F57C05F29CB10C7DA4440', 'KGGI', 'Grinnell Municipal Airfield', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E610000000000000008055C01D03B2D7BBDB4440', 'KEKM', 'Elkhart Municipal', 'IN');
INSERT INTO postgis.stations VALUES ('0101000020E610000012A0A696ADDB51C0F1D7648D7ADC4440', 'KPVD', 'Providence, Theodore Francis Green State Airport', 'RI');
INSERT INTO postgis.stations VALUES ('0101000020E610000013F241CF669D5AC0F7E461A1D6DC4440', 'KEHY', 'Elk Mountain AWOS', 'WY');
INSERT INTO postgis.stations VALUES ('0101000020E61000004C378941605953C0F08AE07F2BDD4440', 'KN38', 'Wellsboro Johnston Airport', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A8A9656B7D8358C0766C04E275DD4440', 'KBVN', 'Albion Municipal Airport', 'NE');
INSERT INTO postgis.stations VALUES ('0101000020E6100000327216F6B42952C0AE47E17A14DE4440', 'KHFD', 'Hartford-Brainard Airport', 'CT');
INSERT INTO postgis.stations VALUES ('0101000020E6100000446E861BF0E954C035B56CAD2FDE4440', 'KDUH', 'Lambertville, Toledo Suburban Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000FD4D2844C00B52C010CCD1E3F7DE4440', 'KIJD', 'Willimantic, Windham Airport', 'CT');
INSERT INTO postgis.stations VALUES ('0101000020E6100000069E7B0F976A56C09031772D21DF4440', 'KSQI', 'Sterling Rockfalls', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E610000081785DBF600B58C043FF04172BE24440', 'KTQE', 'Tekamah Municipal Airport', 'NE');
INSERT INTO postgis.stations VALUES ('0101000020E610000054008C67D01E56C018601F9DBAE24440', 'KARR', 'Aurora Municipal Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F9BD4D7FF69D5EC0D7A3703D0AE34440', 'KSIY', 'Montague Siskiyou County Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AD86C43D962C54C0DD989EB0C4E34440', 'KHZY', 'Ashtabula - Northeast Ohio Regional Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E6100000707CED99250F5FC087DC0C37E0E34440', 'KCEC', 'Crescent City, Jack McNamara Field Airport', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AAD4EC8156F055C08E40BCAE5FE44440', 'KMDW', 'Chicago Midway Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000639CBF0985F65BC031D3F6AFACE44440', 'KLGU', 'Logan-Cache Airport', 'UT');
INSERT INTO postgis.stations VALUES ('0101000020E6100000268DD13AAAA853C0E7E3DA5031E64440', 'KBFD', 'Bradford Regional Airport', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000315F5E807DCC5AC0657094BC3AE74440', 'KRWL', 'Rawlins Municipal Airport', 'WY');
INSERT INTO postgis.stations VALUES ('0101000020E610000099D87C5C1B5C55C0E36BCF2C09E84440', 'KIRS', 'Sturgis, Kirsch Municipal Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E610000058A835CD3B8A57C0448B6CE7FBE94440', 'KPRO', 'Perry Municipal Airport', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E59B6D6E4C9556C0A75CE15D2EEA4440', 'KCWI', 'Clinton Municipal Airport', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E610000001C11C3D7EE559C010CCD1E3F7EE4440', 'KBFF', 'Scottsbluff, Heilig Field', 'NE');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A27F828B150555C0BB0F406A13EF4440', 'KADG', 'Adrian, Lenawee County Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E610000096E7C1DD59C151C0C7D79E5912F04440', 'KTAN', 'Taunton Municipal Airport', 'MA');
INSERT INTO postgis.stations VALUES ('0101000020E610000058FFE7305FEE56C069006F8104F14440', 'KCID', 'Cedar Rapids Airport', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AC1C5A643B4556C03C66A032FEF14440', 'KRPJ', 'Rochelle Municipal-Koritz Field Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B56CAD2F121056C0103B53E8BCF24440', 'KDPA', 'West Chicago, Dupage Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A661F88898AE51C0C7681D554DF44440', 'KPYM', 'Plymouth Municipal Airport', 'MA');
INSERT INTO postgis.stations VALUES ('0101000020E61000000000000000E051C0B79C4B7155F54440', 'KSFZ', 'Pawtucket, North Central State Airport', 'RI');
INSERT INTO postgis.stations VALUES ('0101000020E61000002FC03E3A752555C012BD8C62B9F54440', 'KJYM', 'Hillsdale Municipal Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000FD9FC37C794355C0A5BDC11726F74440', 'KOEB', 'Branch County Memorial Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E61000006C956071382D56C0C156091687F74440', 'KDKB', 'De Kalb Taylor Municipal Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E610000048E17A14AE2B52C0C7D79E5912F84440', 'KBDL', 'Windsor Locks, Bradley International Airport', 'CT');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B2BAD573D2DB54C0B81E85EB51F84440', 'KTTF', 'Monroe, Custer Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000925CFE43FA6555C0B459F5B9DAFA4440', 'KHAI', 'Haines Memorial Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E61000005F419AB1682459C06C5B94D920FB4440', 'KTIF', 'Thedford, Thomas County Airport', 'NE');
INSERT INTO postgis.stations VALUES ('0101000020E61000006E4C4F58E2F955C05A9E077767FD4440', 'KORD', 'Chicago-O''Hare International Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E61000001D9430D3F65B58C004E275FD82FD4440', 'KOFK', 'Norfolk, Stefan Memorial Airport', 'NE');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D8648D7A88D857C07D96E7C1DDFD4440', 'KDNS', 'Denison', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000034356B77A0656C0F44F70B1A2FE4440', 'K06C', 'Schaumburg Regional Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E61000009274CDE49B6757C0E65C8AABCAFE4440', 'KAMW', 'Ames Municipal Airport', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E61000007767EDB60B8756C012F758FAD0054540', 'KSFY', 'Tri-Township Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E610000066666666667657C06666666666064540', 'KBNW', 'Boone Municipal', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E610000072FE261422B257C06666666666064540', 'KCIN', 'Carroll', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E61000004BB0389CF93B5AC0F437A11001074540', 'KEAN', 'Phifer Airfield - Wheatland', 'WY');
INSERT INTO postgis.stations VALUES ('0101000020E61000003333333333B359C0AC5626FC52074540', 'KAIA', 'Alliance Municipal Airport', 'NE');
INSERT INTO postgis.stations VALUES ('0101000020E610000012C2A38D230A5AC0E4F736FDD9074540', 'KTOR', 'Torrington Municipal Airport', 'WY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E7525C55F68D51C0B610E4A084094540', 'KPVC', 'Provincetown Municipal Airport', 'MA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C3F5285C8F125FC0D3C1FA3F87094540', 'KBOK', 'Brookings Airport', 'OR');
INSERT INTO postgis.stations VALUES ('0101000020E610000048E17A14AE0B54C00AD7A3703D0A4540', 'KERI', 'Erie International Airport', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C217265305AB51C031992A18950C4540', 'KGHG', 'Marshfield Airport', 'MA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000BF4351A04FCA54C07F87A2409F0C4540', 'KONZ', 'Grosse Ile Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F437A110017F53C0F6285C8FC20D4540', 'KELZ', 'Wellsville Municipal Airport', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E61000007862D68BA13A57C0751F80D4260E4540', 'KMIW', 'Marshalltown Municipal Airport', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E61000006002B7EEE6F955C01630815B770F4540', 'KPWK', 'Chicago / Wheeling, Pal-Waukee Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CD3B4ED1919A55C0FF3EE3C281104540', 'KBEH', 'Southwest Michigan Regional Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000BC79AA436E6E5EC0F4C308E1D1124540', 'KLMT', 'Klamath Falls International Airport', 'OR');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C2340C1F11D153C03333333333134540', 'KJHW', 'Chautauqua County/Jamestown Airport', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E8DEC325C73953C0F2B5679604144540', 'KELM', 'Elmira / Corning Regional Airport', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E61000003AE97DE36B195EC06B9F8EC70C144540', 'KLKV', 'Lake County Airport', 'OR');
INSERT INTO postgis.stations VALUES ('0101000020E61000008B4F01309E2D52C0314278B471144540', 'KBAF', 'Westfield, Barnes Municipal Airport', 'MA');
INSERT INTO postgis.stations VALUES ('0101000020E61000007EC6850321CB51C03F8C101E6D184540', 'KOWD', 'Norwood Memorial Airport', 'MA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000156F641EF94556C054A9D903AD184540', 'KRFD', 'Greater Rockford Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E610000072FE2614222252C09A99999999194540', 'KCEF', 'Chicopee Falls / Westover Air Force Base', 'MA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C6A70018CFFE52C0A661F888981A4540', 'KBGM', 'Binghamton Regional Airport', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E61000009E0C8E9257C751C050C763062A1B4540', 'KMQE', 'East Milton', 'MA');
INSERT INTO postgis.stations VALUES ('0101000020E61000005D50DF32A70157C00E4A9869FB1B4540', 'KVTI', 'Vinton Veterans Memorial Airpark Airport', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E3FC4D2844CA56C039D6C56D341C4540', 'KMXO', 'Monticello Regional Airport', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E61000008FC2F5285CEF54C062F3716DA81C4540', 'KARB', 'Ann Arbor Municipal Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C2340C1F111152C03333333333734540', 'KEEN', 'Keene, Dillant-Hopkins Airport', 'NH');
INSERT INTO postgis.stations VALUES ('0101000020E610000014D044D8F06255C0A1D634EF381D4540', 'KAZO', 'Kalamazoo/Battle Creek International Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E610000049A297512CD554C08B4F01309E1D4540', 'KDTW', 'Detroit Metropolitan Wayne County Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E61000004F0647C9ABE154C0DFF8DA334B1E4540', 'KYIP', 'Detroit, Willow Run Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B9C2BB5CC49753C0A60F5D50DF1E4540', 'KOLE', 'Cattaraugus County-Olean Airport', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C6A70018CF3E58C05036E50AEF1E4540', 'KLCG', 'Wayne Municipal Airport', 'NE');
INSERT INTO postgis.stations VALUES ('0101000020E6100000BE6A65C22F6556C06BB75D68AE1F4540', 'KFEP', 'Albertus Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E610000012143FC6DCD55BC0D5E76A2BF61F4540', 'K1U7', 'Bear Lake County Airport', 'ID');
INSERT INTO postgis.stations VALUES ('0101000020E61000005E9D6340F63C55C00E15E3FC4D204540', 'KRMY', 'Brooks Field Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000516B9A779C2E5AC0B7627FD93D214540', 'KGUR', 'Camp Guernsey', 'WY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000738577B9881D55C0A18499B67F214540', 'KJXN', 'Jackson County Airport - Reynolds Field', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E610000087DC0C37E0F751C08ACDC7B5A1224540', 'KORH', 'Worcester Regional Airport', 'MA');
INSERT INTO postgis.stations VALUES ('0101000020E61000008FFCC1C0734F55C0A4AA09A2EE274540', 'KBTL', 'Battle Creek Executive Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E61000006E8B321B649055C0543A58FFE72C4540', 'KLWA', 'South Haven Area Regional Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E610000054A9D903ADC051C0751F80D4262E4540', 'KBOS', 'Boston, Logan International Airport', 'MA');
INSERT INTO postgis.stations VALUES ('0101000020E61000009CF9D51C20B85EC06B82A8FB00304540', 'KMFR', 'Rogue Valley International Airport', 'OR');
INSERT INTO postgis.stations VALUES ('0101000020E6100000FE65F7E461AD56C090DAC4C9FD324540', 'KDBQ', 'Dubuque Regional Airport', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E61000008DD13AAA9A1858C0EC51B81E85334540', 'KSUX', 'Sioux Gateway Airport', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E610000014E8137992C054C072FE261422344540', 'KDET', 'Coleman A Young Municipal Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A5DAA7E3311B5FC0850838842A354540', 'K4S1', 'Gold Beach Municipal Airport', 'OR');
INSERT INTO postgis.stations VALUES ('0101000020E6100000616C21C841F755C0CAE0287975364540', 'KUGN', 'Chicago/Waukegan Regional Airport', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E61000009CE1067C7E5252C0ED2AA4FCA4364540', 'KPSF', 'Pittsfield Municipal Airport', 'MA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000BD00FBE8D47757C06440F67AF7374540', 'KEBS', 'Webster City Municipal Airport', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBBFB56C09A99999999394540', 'KIIB', 'Independence Municipal Airport', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBBAB58C01D03B2D7BB3B4540', 'KONL', 'O''Neill / Baker Field', 'NE');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E99AC937DBD251C01D774A07EB3B4540', 'KBED', 'Laurence G Hanscom Field Airport', 'MA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E17A14AE475157C03F355EBA493C4540', 'KIFA', 'Iowa Falls Municipal Airport', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000FF5BC98E8D9E5CC06891ED7C3F3D4540', 'KTWF', 'Joslin Field - Magic Valley Regional Airport', 'ID');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A5315A47551D53C0A6F27684D33E4540', 'KITH', 'Ithaca Tompkins Regional Airport', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E61000005D50DF32A7D153C09E7B0F971C3F4540', 'KDKK', 'Chautauqua County / Dunkirk Airport', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E610000022E010AAD4D85EC068AED3484B414540', 'K3S8', 'Grants Pass Airport', 'OR');
INSERT INTO postgis.stations VALUES ('0101000020E61000003CBD529621325BC0EEEBC03923424540', 'KFWZ', 'South Pass', 'WY');
INSERT INTO postgis.stations VALUES ('0101000020E610000081785DBF60CB54C02176A6D079454540', 'KVLL', 'Oakland/Troy Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E610000029ED0DBE30715CC06F1283C0CA454540', 'KBYI', 'Burley Municipal Airport', 'ID');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBB8B57C06666666666464540', 'KFOD', 'Fort Dodge', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E61000007CD5CA845FF051C058AD4CF8A5464540', 'KFIT', 'Fitchburg Municipal Airport', 'MA');
INSERT INTO postgis.stations VALUES ('0101000020E61000004F0647C9AB1957C010CCD1E3F7464540', 'KALO', 'Waterloo Municipal Airport', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E61000009B5AB6D6171B55C03F8C101E6D484540', 'KTEW', 'Mason Jewett Field Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E610000012BD8C62B96D53C06284F068E3484540', 'KDSV', 'Dansville Municipal Airport', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000718FA50F5D1252C0295C8FC2F5484540', 'KORE', 'Orange Municipal Airport', 'MA');
INSERT INTO postgis.stations VALUES ('0101000020E61000004B9352D0ED3355C0D3C1FA3F87494540', 'KFPK', 'Charlotte, Fitch H Beach Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E610000056BC9179E4FF58C061376C5B94494540', 'KANW', 'Ainsworth Regional Airport', 'NE');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E5ED08A705875BC0F5B9DA8AFD494540', 'KBPI', 'Big Piney - Marbleton Airport', 'WY');
INSERT INTO postgis.stations VALUES ('0101000020E61000006A183E22A6BA51C02DCF83BBB34A4540', 'KBVY', 'Beverly Municipal Airport', 'MA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A5315A4755775DC06B60AB048B4B4540', 'KREO', 'Rome', 'OR');
INSERT INTO postgis.stations VALUES ('0101000020E610000044FAEDEBC00D53C007CE1951DA4B4540', 'KN03', 'Cortland County-Chase Field', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E36BCF2C09FC55C05C8FC2F5284C4540', 'KENW', 'Kenosha Regional Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E61000003ECBF3E0EECE57C0CDCCCCCCCC4C4540', 'KSLB', 'Storm Lake', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000BADA8AFD65D75EC0CDCCCCCCCC4C4540', 'KSXT', 'Sexton Summit', 'OR');
INSERT INTO postgis.stations VALUES ('0101000020E61000002FC03E3A75B554C068E89FE0624D4540', 'KMTC', 'Selfridge Air National Guard Base', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E61000006B65C22FF56556C0DE76A1B94E4F4540', 'KEFT', 'Monroe Municipal Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000ADC090D5AD4256C04FAF9465884F4540', 'KJVL', 'Janesville-Rock County', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E610000014ED2AA4FCFE54C0AA656B7D91504540', 'KOZW', 'Howell, Livingston County Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E610000050C763062A4353C0D1AE42CA4F524540', 'KPEO', 'Penn Yan Airport', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E61000000AD7A3703DDA54C094A46B26DF544540', 'KPTK', 'Pontiac, Oakland County International Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C1CAA145B61356C0F1BA7EC16E584540', 'KBUU', 'Burlington Municipal Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F86BB2463D9C56C07F130A1170584540', 'KPVB', 'Platteville Municipal Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E61000005B423EE8D94A52C03E963E7441594540', 'KAQW', 'North Adams Harriman-and-West Airport', 'MA');
INSERT INTO postgis.stations VALUES ('0101000020E61000006E5166834CBC5BC0F35487DC0C5B4540', 'KAFO', 'Afton', 'WY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AE2AFBAE08C851C097900F7A365B4540', 'KLWM', 'Lawrence Municipal Airport', 'MA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A306D3307C4E57C09B38B9DFA15C4540', 'KHPT', 'Hampton Municipal Airport', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E61000005EF415A4199D5CC09335EA211A5D4540', 'KJER', 'Jerome County Airport', 'ID');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AF08FEB792E357C06FBBD05CA75D4540', 'KCKP', 'Cherokee Municipal Airport', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E610000047205ED72F8655C0FA9B5088805F4540', 'KBIV', 'Holland - West Michigan Regional Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000176536C8247352C06475ABE7A45F4540', 'KALB', 'Albany International Airport', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C2340C1F117157C00000000000604540', 'KCAV', 'Clarion', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AAD4EC8156F455C09335EA211A614540', 'KRAC', 'Racine, Batten International Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F584251E500C58C025CCB4FD2B634540', 'KLRJ', 'Le Mars Municipal Airport', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E610000051DA1B7C612655C04F3BFC3559634540', 'KLAN', 'Capital Region International Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D74CBED9E6E051C0008C67D0D0634540', 'KASH', 'Nashua - Boire Field Airport', 'NH');
INSERT INTO postgis.stations VALUES ('0101000020E6100000314278B471585AC06FBBD05CA7654540', 'KDGW', 'Douglas, Converse County Airport', 'WY');
INSERT INTO postgis.stations VALUES ('0101000020E61000006475ABE7A4735BC0D9942BBCCB654540', 'KPNA', 'Pinedale, Ralph Wenz Field Airport', 'WY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000569FABADD81756C0832F4CA60A664540', 'K57C', 'East Troy Municipal Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AA8A59C06666666666664540', 'KGRN', 'Gordon Municipal', 'NE');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D21DC4CE140052C008556AF640674540', 'KAFN', 'Jaffrey Airport-Silver Ranch', 'NH');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A661F888982E5BC0D5B2B5BE48684540', 'KLND', 'Lander', 'WY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A0FD481119C659C033333333336B4540', 'KCDR', 'Chadron, Chadron Municipal Airport', 'NE');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E7357689EAE352C0B21188D7F56B4540', 'KVGC', 'Hamilton Municipal Airport', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBB7B52C0CDCCCCCCCC6C4540', 'KSCH', 'Schenectady Airport', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DA5548F9492359C06002B7EEE66D4540', 'KVTN', 'Valentine, Miller Field', 'NE');
INSERT INTO postgis.stations VALUES ('0101000020E61000002FC03E3A756155C0F8AA9509BF704540', 'KGRR', 'Grand Rapids, Gerald R. Ford International Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E610000054008C67D08E56C028F224E99A714540', 'KMRJ', 'Iowa County Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E61000004772F90FE94F52C09FABADD85F724540', 'KDDH', 'Bennington Morse State Airport', 'VT');
INSERT INTO postgis.stations VALUES ('0101000020E6100000EE42739D469E5AC07B14AE47E1724540', 'KCPR', 'Casper, Natrona County International Airport', 'WY');
INSERT INTO postgis.stations VALUES ('0101000020E610000032772D211FA254C0639CBF0985744540', 'KPHN', 'St Clair County International Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000EA043411361C53C0A245B6F3FD744540', 'K6B9', 'Skaneateles Aero Drome', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D8648D7A885858C0B79C4B7155754540', 'KYKN', 'Yankton, Chan Gurney Municipal Airport', 'SD');
INSERT INTO postgis.stations VALUES ('0101000020E6100000450DA661F8B05CC08599B67F65754540', 'KGNG', 'Gooding Municipal Airport', 'ID');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CA1AF5108D245CC0D9942BBCCB754540', 'KPIH', 'Pocatello Regional Airport', 'ID');
INSERT INTO postgis.stations VALUES ('0101000020E6100000BD1DE1B4E0DB51C0D7868A71FE764540', 'KMHT', 'Manchester Airport', 'NH');
INSERT INTO postgis.stations VALUES ('0101000020E61000001D5A643BDF4355C0F2D24D6210784540', 'KY70', 'Ionia County Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000102384471BAF53C07172BF4351784540', 'KBUF', 'Greater Buffalo International Airport', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E61000006E4C4F58E2F955C00AD7A3703D7A4540', 'KMKE', 'Milwaukee, General Mitchell International Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E61000001D9430D3F6EF54C01D03B2D7BB7B4540', 'KFNT', 'Flint, Bishop International Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C364AA60540A58C035B56CAD2F7E4540', 'KSXK', 'Sioux County Regional Airport', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E610000074EFE192E30855C0BB0F406A137F4540', 'KRNP', 'Owosso Community Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E61000006519E258179552C0DD989EB0C47F4540', 'KNY0', 'Fulton County Airport', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E61000000FB9196EC0C756C02619390B7B824540', 'KPDC', 'Prairie Du Chien Municipal Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E61000002176A6D079A159C0FA0AD28C45834540', 'KIEN', 'Pine Ridge, Pine Ridge Airport', 'SD');
INSERT INTO postgis.stations VALUES ('0101000020E610000030478FDFDB8A53C0F2D24D6210844540', 'KGVQ', 'Genesee County Airport', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B6A1629CBF0F56C08CDB68006F854540', 'KUES', 'Waukesha County Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000289B728577F75CC06666666666864540', 'KMUO', 'Mountain Home Air Force Base', 'ID');
INSERT INTO postgis.stations VALUES ('0101000020E61000000ABFD4CF9B1C5BC0B21188D7F5874540', 'KRIW', 'Riverton Regional Airport', 'WY');
INSERT INTO postgis.stations VALUES ('0101000020E61000004C37894160D154C08D976E1283884540', 'KD95', 'Lapeer Dupont-lapeer', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000289B7285772757C0EACF7EA488884540', 'KCCY', 'Charles City', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C2340C1F119157C04963B48EAA8A4540', 'KAXA', 'Algona', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F5673F5244B451C04963B48EAA8A4540', 'KPSM', 'Pease Air Force Base / Portsmouth', 'NH');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B97020240BBC53C0EE3D5C72DC8D4540', 'KIAG', 'Niagara Falls International Airport', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E610000086AC6EF59C0653C027DA5548F98D4540', 'KSYR', 'Syracuse Hancock International Airport', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A7CB6262F30156C044A852B3078E4540', 'KMWC', 'Milwaukee-Timmerman', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000692E81A5046256C066B56565A08E4540', 'KC29', 'Middleton Muni - Morey Field', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CC0BB08F4E6B53C05036E50AEF8E4540', 'KROC', 'Greater Rochester International Airport', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A0FD4811195656C01990BDDEFD914540', 'KMSN', 'Madison, Dane County Regional-Truax Field', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E61000003B8DB454DE5457C096ECD808C4934540', 'KMCW', 'Mason City Municipal Airport', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E61000008FC2F5285CAB56C00E4A9869FB934540', 'KOVS', 'Boscobel Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CC6262F371CD57C0A8C64B3789954540', 'KSPW', 'Spencer Municipal Airport', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000312592E8652E56C02F8B89CDC7954540', 'KRYV', 'Watertown', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000707CED99258F55C06002B7EEE6954540', 'KMKG', 'Muskegon County Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E61000006D567DAEB6C25BC0BA6B09F9A0974540', 'K46U', 'Alpine', 'WY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D97C5C1B2AE051C083A3E4D5399A4540', 'KCON', 'Concord Municipal Airport', 'NH');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F5B9DA8AFD8B56C07B6B60AB049B4540', 'KLNR', 'Lone Rock Tri-County Regional Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A5315A4755F557C01D03B2D7BB9B4540', 'KSHL', 'Sheldon', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A99999999D952C07D96E7C1DD9D4540', 'KRME', 'Griffiss Air Force Base / Rome', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DE718A8EE4D65EC059DDEA39E99D4540', 'KRBG', 'Roseburg Regional Airport', 'OR');
INSERT INTO postgis.stations VALUES ('0101000020E6100000884B8E3BA54753C0FCFB8C0B079E4540', 'KSDC', 'Williamson-Sodus Airport', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E61000000E2DB29DEF6757C0AE47E17A149E4540', 'KFXY', 'Forest City Municipal Airport', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E610000010406A1327BB51C02B6A300DC3A34540', 'KDAW', 'Rochester - Skyhaven Airport', 'NH');
INSERT INTO postgis.stations VALUES ('0101000020E61000003ECBF3E0EEEE56C0E3FC4D2844A44540', 'KDEH', 'Decorah', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F2B56796042C55C01AA3755435A94540', 'KAMN', 'Alma, Gratiot Community Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000BB0F406A136752C0562B137EA9AB4540', 'KGFL', 'Glens Falls, Floyd Bennett Memorial Airport', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E61000007A53910A632152C0A4703D0AD7AB4540', 'KVSF', 'Hartness State Springfield Airport', 'VT');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B0389CF9D51853C0543A58FFE7AC4540', 'KFZY', 'Fulton, Oswego County Airport', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E610000052B81E85EBF558C01990BDDEFDB14540', 'KICR', 'Winner, Bob Wiley Field Airport', 'SD');
INSERT INTO postgis.stations VALUES ('0101000020E61000008E01D9EBDDAD51C03333333333B34540', 'KSFM', 'Sanford Regional Airport', 'ME');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B2BAD573D2AF57C09E0C8E9257B34540', 'KEST', 'Estherville Municipal Airport', 'IA');
INSERT INTO postgis.stations VALUES ('0101000020E61000004182E2C7980F5FC0BDA94885B1B54540', 'KOTH', 'Southwest Oregon Regional Airport', 'OR');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C6DCB5847C0856C0834C327216B64540', 'KETB', 'West Bend Municipal Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000EC12D55B032D56C09817601F9DB64540', 'KUNU', 'Juneau, Dodge County Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E5B8533A58F754C05E68AED348B74540', 'KHYX', 'Saginaw County H W Browne Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E610000019C5724BAB7F55C06A1327F73BB84540', 'KFFX', 'Fremont Municipal Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E61000000664AF777FDC54C02DCF83BBB3BA4540', 'KCFS', 'Caro, Tuscola Area Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000098A1F63EE0E5BC088855AD3BCBB4540', 'KTBX', 'Boysen', 'WY');
INSERT INTO postgis.stations VALUES ('0101000020E61000003333333333935CC00000000000C04540', 'KSUN', 'Hailey, Friedman Memorial Airport', 'ID');
INSERT INTO postgis.stations VALUES ('0101000020E610000011FC6F253B045CC04963B48EAAC24540', 'KIDA', 'Idaho Falls Regional Airport', 'ID');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D6C56D34807156C06C21C84109C34540', 'KDLL', 'Baraboo Wisconsin Dells Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000575BB1BFEC7E56C0B37BF2B050C34540', 'KC35', 'Reedsburg Municipal Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E61000007ADFF8DA330555C04182E2C798C34540', 'KMBS', 'MBS International Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CDCCCCCCCC3C52C0E3FC4D2844C44540', 'KRUT', 'Rutland-Southern Vermont Regional Airport', 'VT');
INSERT INTO postgis.stations VALUES ('0101000020E6100000711B0DE02D6C5BC02E90A0F831C64540', 'KDUB', 'Dubois Municipal Airport', 'WY');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AADA51C0EACF7EA488C84540', 'KLCI', 'Laconia Municipal Airport', 'NH');
INSERT INTO postgis.stations VALUES ('0101000020E61000003EEDF0D7640F5DC00DC347C494C84540', 'KBOI', 'Boise Air Terminal', 'ID');
INSERT INTO postgis.stations VALUES ('0101000020E610000011FC6F253B3058C08BE07F2BD9C94540', 'KFSD', 'Sioux Falls, Foss Field', 'SD');
INSERT INTO postgis.stations VALUES ('0101000020E610000068226C787A215DC01895D40968CA4540', 'KMAN', 'Nampa Municipal Airport', 'ID');
INSERT INTO postgis.stations VALUES ('0101000020E6100000BAA0BE654EBD5DC0B285200725CC4540', 'KBNO', 'Burns Municipal Airport', 'OR');
INSERT INTO postgis.stations VALUES ('0101000020E61000003ECBF3E0EEAE5BC0CDCCCCCCCCCC4540', 'KJAC', 'Jackson Hole Airport', 'WY');
INSERT INTO postgis.stations VALUES ('0101000020E61000003ECBF3E0EE2E55C05036E50AEFCE4540', 'KMOP', 'Mount Pleasant Municipal Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E610000099D36531B10D58C09D9D0C8E92CF4540', 'KLYV', 'Quentin Aanenson Field Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E61000007DCB9C2E8B1352C02AA913D044D04540', 'KLEB', 'Lebanon Municipal Airport', 'NH');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E73A8DB454285DC0F5B9DA8AFDD14540', 'KEUL', 'Caldwell Industrial Airport', 'ID');
INSERT INTO postgis.stations VALUES ('0101000020E610000008E6E8F17B9351C0276BD44334D24540', 'KPWM', 'Portland International Jetport', 'ME');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AA9A57C03333333333D34540', 'KFRM', 'Fairmont Municipal Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E61000003ECBF3E0EEBE57C03333333333D34540', 'KMJQ', 'Jackson Municipal Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A5315A4755E557C03333333333D34540', 'KOTG', 'Worthington Municipal Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E61000003B53E8BCC61055C0696FF085C9D44540', 'KIKW', 'Jack Barstow Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBB3B57C0B79C4B7155D54540', 'KAUM', 'Austin Municipal', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C993A46B260B57C051888043A8D64540', 'KFKA', 'Preston, Fillmore County Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000289B7285775757C01630815B77D74540', 'KAEL', 'Albert Lea Municipal Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E610000014D044D8F0185BC07A36AB3E57DB4540', 'KHSG', 'Hot Springs County Airport', 'WY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F5673F52446055C014AE47E17ADC4540', 'KRQB', 'Big Rapids, Roben-Hood Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000EC51B81E85E759C0BD00FBE8D4DD4540', 'KCUT', 'Custer County Airport', 'SD');
INSERT INTO postgis.stations VALUES ('0101000020E6100000FC8C0B0742C65BC05036E50AEFDE4540', 'KDIJ', 'Driggs-Reed Memorial Airport', 'ID');
INSERT INTO postgis.stations VALUES ('0101000020E61000007CD5CA845FD458C08369183E22E24540', 'K9V9', 'Chamberlain Municipal Airport', 'SD');
INSERT INTO postgis.stations VALUES ('0101000020E610000072FE2614228258C08369183E22E24540', 'KMHE', 'Mitchell Municipal Airport', 'SD');
INSERT INTO postgis.stations VALUES ('0101000020E61000008FDFDBF4671F56C08351499D80E24540', 'KFLD', 'Fond Du Lac County Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E61000003F52448655F655C0D7FA22A12DE34540', 'KSBM', 'Sheboygan County Memorial Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000861BF0F961F051C0EC34D25279E34540', 'K1P1', 'Plymouth Municipal Airport', 'NH');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F0DC7BB8E4BE54C0ACCABE2B82E34540', 'KBAX', 'Huron County Memorial Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A1BE654E97F35BC03C889D2974EA4540', 'KRXE', 'Rexburg-Madison County Airport', 'ID');
INSERT INTO postgis.stations VALUES ('0101000020E6100000302AA913D08856C0DE9387855AEB4540', 'K82C', 'New Lisbon Mauston Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E610000051F701486DD056C0AA656B7D91F04540', 'KLSE', 'La Crosse Regional Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CDCCCCCCCC5C5EC0B0C91AF510F14540', 'KS21', 'Sunriver', 'OR');
INSERT INTO postgis.stations VALUES ('0101000020E61000007FD93D7958145AC06FF085C954F14540', 'KECS', 'Mondell Field', 'WY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000289B7285771F57C01D03B2D7BBF34540', 'KRST', 'Rochester International Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E61000009BC937DBDCC657C0F1D7648D7AF44540', 'KMWM', 'Windom Municipal Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E610000051F701486DC05EC04260E5D022F74540', 'K77S', 'Hobby Field Airport', 'OR');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C2340C1F119156C01630815B77F74540', 'KVOK', 'Volk / Camp Douglas', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E610000025E99AC937AF56C04963B48EAAFA4540', 'KCMY', 'Sparta / Fort McCoy Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E610000084D382177D6D51C02C82FFAD64FB4540', 'KIWI', 'Wiscasset Airport', 'ME');
INSERT INTO postgis.stations VALUES ('0101000020E610000090831266DAFC5AC072BF4351A0FB4540', 'KWRL', 'Worland Municipal Airport', 'WY');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A999999999955C01D03B2D7BBFB4540', 'KLDM', 'Ludington, Mason County Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B9A5D590B82356C0D673D2FBC6FB4540', 'KOSH', 'Wittman Regional Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E61000009031772D21075FC02041F163CCFD4540', 'K6S2', 'Florence Municipal Airport', 'OR');
INSERT INTO postgis.stations VALUES ('0101000020E6100000EEEBC039234652C0E78C28ED0DFE4540', 'K6B0', 'Middlebury State Airport', 'VT');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D07EA4880C1358C08369183E22FE4540', 'KPQN', 'Pipestone Municipal Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F6402B3064A357C0BCCB457C27FE4540', 'KJYG', 'St. James Municipal Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000BF823463D1BC51C09817601F9DFE4540', 'KIZG', 'Fryeburg, Eastern Slopes Regional Airport', 'ME');
INSERT INTO postgis.stations VALUES ('0101000020E610000067614F3BFCF157C0C286A757CAFE4540', 'KDVP', 'Slayton Municipal Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E61000007A53910A630153C010CCD1E3F7FE4540', 'KART', 'Watertown International Airport', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E61000001CF0F96184405DC0C425C79DD2014640', 'KONO', 'Ontario Municipal Airport', 'OR');
INSERT INTO postgis.stations VALUES ('0101000020E6100000152411757A4558C03AD67BE019024640', 'KMDS', 'Madison Municipal Airport', 'SD');
INSERT INTO postgis.stations VALUES ('0101000020E61000000C022B87163557C05FB532E197024640', 'KTOB', 'Dodge Center Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000FB22A12DE71E57C018265305A3024640', 'K9MN', 'Rochester - St. Mary''s Hospital Heliport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E610000002F1BA7EC1B254C0B43C0FEECE024640', 'KP58', 'Port Hope', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E610000008E6E8F17B5356C0D3307C444C054640', 'KY50', 'Wautoma Municipal Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E610000036E50AEF72C359C0BD00FBE8D4054640', 'KRAP', 'Rapid City Regional Airport', 'SD');
INSERT INTO postgis.stations VALUES ('0101000020E610000072FE2614229251C06666666666064640', 'KLEW', 'Auburn-Lewiston', 'ME');
INSERT INTO postgis.stations VALUES ('0101000020E61000003ECBF3E0EEEE52C06666666666064640', 'KGTB', 'Fort Drum / Wheeler-Sack U.S. Army Airfield', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E61000001CD31396786659C0D13FC1C58A064640', 'KPHP', 'Philip Airport', 'SD');
INSERT INTO postgis.stations VALUES ('0101000020E610000066666666664651C0EACF7EA488084640', 'KRKD', 'Rockland, Knox County Regional Airport', 'ME');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F33CB83B6B6357C07E6FD39FFD084640', 'KACQ', 'Waseca Municipal Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CDCCCCCCCCEC56C04963B48EAA0A4640', 'KONA', 'Winona Municipal Airport-Max Conrad Field', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F7E461A1D64C5EC095D40968220C4640', 'KBDN', 'Bend Airport AWOS', 'OR');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B554DE8E705057C0A5F78DAF3D0F4640', 'KOWA', 'Owatonna Degner Regional Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E610000012BD8C62B9CD5EC0B0C91AF510114640', 'KEUG', 'Eugene, Mahlon Sweet Field', 'OR');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBBEB55C0B0C91AF510114640', 'KMTW', 'Manitowoc County Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E61000006666666666C659C03333333333134640', 'KRCA', 'Ellsworth Air Force Base', 'SD');
INSERT INTO postgis.stations VALUES ('0101000020E610000011FC6F253B2452C0276BD443341A4640', 'KMPV', 'Barre / Montpelier, Knapp State Airport', 'VT');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C0046EDDCDBB5CC02DCF83BBB31A4640', 'KSNT', 'Stanley Ranger Station', 'ID');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AA7A57C01D03B2D7BB1B4640', 'KMKT', 'Mankato Regional Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E610000088F4DBD7810B55C0C8073D9B551F4640', 'KY31', 'West Branch Community Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F7AFAC3429E757C0320395F1EF1F4640', 'KTKC', 'Tracy Municipal Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E610000055FB743C66B656C072A774B0FE1F4640', 'KBCK', 'Black River Falls Area Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E61000004209336DFF485EC0A9D903ADC0204640', 'KRDM', 'Redmond Roberts Field', 'OR');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D061BEBC002156C0F0A7C64B37214640', 'KATW', 'Appleton-Outagamie', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A25016A6AD351C0B4E55C8AAB224640', 'KMWN', 'Mount Washington', 'NH');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CCD1E3F7368F55C07BBDFBE3BD224640', 'KMBL', 'Manistee County - Blacker Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E610000045F0BF95EC5A55C06475ABE7A4234640', 'KCAD', 'Wexford County Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000FD87F4DBD7395EC0DBF97E6ABC244640', 'KS39', 'Prineville Airport', 'OR');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F5673F52443458C06666666666264640', 'KBKX', 'Brookings Municipal Airport', 'SD');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E5ED08A7057351C0F0332E1C08294640', 'KAUG', 'Augusta State Airport', 'ME');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F20C1AFA27A057C0378E588B4F294640', 'KULM', 'New Ulm Municipal Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E61000008E3BA583F55357C0AE9E93DE372A4640', 'KFBL', 'Faribault Municipal Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E61000007A19C5724B4156C0105839B4C82A4640', 'KPCZ', 'Waupaca Municipal Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E61000003B191C25AF625AC0257A19C5722B4640', 'KGCC', 'Gillette-Campbell County Airport', 'WY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000707CED99252B55C037A6272CF12C4640', 'KHTL', 'Houghton Lake, Roscommon County Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B62DCA6C907556C027DA5548F92D4640', 'KISW', 'Wisconsin Rapids, Alexander Field South Wood County Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E61000005760C8EA56E351C050FC1873D72E4640', 'KHIE', 'Whitefield - Mount Washington Regional Airport', 'NH');
INSERT INTO postgis.stations VALUES ('0101000020E6100000001DE6CB0BAE5AC0624A24D1CB304640', 'KBYG', 'Buffalo - Johnson County Airport', 'WY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CE8DE9094B1259C00CC85EEFFE304640', 'KPIR', 'Pierre Regional Airport', 'SD');
INSERT INTO postgis.stations VALUES ('0101000020E610000086AC6EF59C8E58C0617138F3AB314640', 'KHON', 'Huron Regional Airport', 'SD');
INSERT INTO postgis.stations VALUES ('0101000020E61000001B12F758FA8C52C0D1AE42CA4F324640', 'KSLK', 'Saranac Lake, Adirondack Regional Airport', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E4141DC9E5BD5DC00F45813E91334640', 'KGCD', 'Grant County Regional Airport', 'OR');
INSERT INTO postgis.stations VALUES ('0101000020E6100000053411363C0152C0598638D6C5354640', 'K1V4', 'St. Johnsbury - Fairbanks', 'VT');
INSERT INTO postgis.stations VALUES ('0101000020E6100000289B7285771751C09A99999999394640', 'KBHB', 'Hancock County-Bar Harbor Airport', 'ME');
INSERT INTO postgis.stations VALUES ('0101000020E6100000289B728577D754C09A99999999394640', 'KOSC', 'Oscoda-Wurtsmith Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F5673F5244F457C09A99999999394640', 'KMML', 'Southwest Minnesota Regional Airport - Marshall/Ryan Field', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E61000008B4F01309E4952C06B48DC63E93B4640', 'KBTV', 'Burlington International Airport', 'VT');
INSERT INTO postgis.stations VALUES ('0101000020E61000008D9C853DED4057C0A25D85949F3C4640', 'KSYN', 'Stanton Airfield', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E610000009168733BF0856C07632384A5E3D4640', 'KGRB', 'Green Bay, Austin Straubel International Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E610000072FE261422F259C07D96E7C1DD3D4640', 'KSPF', 'Spearfish / Clyde Ice', 'SD');
INSERT INTO postgis.stations VALUES ('0101000020E610000072FE261422D25EC00000000000404640', 'KCVO', 'Corvallis Municipal Airport', 'OR');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C2340C1F11415BC08369183E22424640', 'KCOD', 'Cody', 'WY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000302AA913D0045BC0A779C7293A424640', 'KGEY', 'South Big Horn County Airport', 'WY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AB9509BFD48D5CC06DE7FBA9F1424640', 'KLLJ', 'Challis Airport', 'ID');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBB6B51C0E3FC4D2844444640', 'KWVL', 'Waterville Robert LaFleur Airport', 'ME');
INSERT INTO postgis.stations VALUES ('0101000020E61000003D0AD7A3702752C07120240B98444640', 'KMVL', 'Morrisville-Stowe State Airport', 'VT');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D1747632386256C00B410E4A98454640', 'KSTE', 'Stevens Point Municipal Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E610000030815B77F39A5BC02F51BD35B0454640', 'KP60', 'Yellowstone Lake', 'WY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000707CED9925C557C08386FE092E464640', 'KRWF', 'Redwood Falls Municipal Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E610000028E1F890260152C03858EEBBD8484640', 'KCDA', 'Caledonia County Airport', 'VT');
INSERT INTO postgis.stations VALUES ('0101000020E6100000452FA3586ECB51C00473F4F8BD494640', 'KBML', 'Berlin Municipal Airport', 'NH');
INSERT INTO postgis.stations VALUES ('0101000020E61000002B4D4A41B7035FC0EE42739D464A4640', 'KONP', 'Newport Municipal Airport', 'OR');
INSERT INTO postgis.stations VALUES ('0101000020E61000009B20EA3E001F57C007CE1951DA4B4640', 'KRGK', 'Red Wing Regional Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E610000014799274CD2E56C0BB44F5D6C04E4640', 'KCLI', 'Clintonville Municipal Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B0389CF9D58C55C00000000000504640', 'KFKS', 'Frankfort Dow Memorial Field Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A661F888984E57C09C8A54185B504640', 'KLVN', 'Minneapolis, Airlake Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E610000000000000008C56C0617138F3AB514640', 'KMFI', 'Marshfield Municipal Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E61000008E01D9EBDD5D52C03333333333534640', 'KPBG', 'Plattsburgh International Airport ', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CEAACFD556245AC05B423EE8D9544640', 'KW43', 'Hulett Municipal Airport', 'WY');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B462575024A5EC0B003E78C28554640', 'KS33', 'Madras Municipal Airport', 'OR');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F88DAF3DB3BC52C09817601F9D564640', 'KPTD', 'Potsdam Municipal Airport/Damon Field', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E61000006A183E22A62E55C0BB0F406A13574640', 'KGOV', 'Grayling Army Airfield', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E61000006F1283C0CADD52C0AC39403047574640', 'KOGS', 'Ogdensburg International Airport', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000289B728577C75BC01630815B77574640', 'KWYS', 'West Yellowstone', 'MT');
INSERT INTO postgis.stations VALUES ('0101000020E61000001B2FDD24061158C04C378941605D4640', 'KCNB', 'Canby Airfield', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E61000005C035B25586455C0F4328AE5965E4640', 'KTVC', 'Cherry Capital Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AF08FEB792E357C07FF6234564604640', 'KGDB', 'Granite Falls Municipal Airport/Lenzen-Roe Memorial Field', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E61000006F1283C0CA8557C0371AC05B20614640', 'KGYL', 'Glencoe Municipal Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000382D78D157BE5AC02F698CD651614640', 'KSHR', 'Sheridan County Airport', 'WY');
INSERT INTO postgis.stations VALUES ('0101000020E61000009D853DEDF0C157C0F20703CFBD634640', 'KOVL', 'Olivia Regional Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E610000049111956F16A56C0DD989EB0C4634640', 'KCWA', 'Mosinee', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A4703D0AD72356C0DBF97E6ABC644640', 'KEZS', 'Shawano Municipal Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E61000006E8B321B643451C0CBDB114E0B664640', 'KBGR', 'Bangor International Airport', 'ME');
INSERT INTO postgis.stations VALUES ('0101000020E6100000399CF9D51C5E57C02D5BEB8B846A4640', 'KFCM', 'Minneapolis - Flying Cloud Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E610000089B5F81400DB55C0BAF770C9716B4640', 'KSUE', 'Door County Cherryland Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000BD00FBE8D4735DC0DDEF5014E86B4640', 'KBKE', 'Baker Municipal Airport', 'OR');
INSERT INTO postgis.stations VALUES ('0101000020E6100000FB912232AC9857C044A852B3076E4640', 'KHCD', 'Hutchinson Municipal Airport-Butler Field', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E61000006B9F8EC70C4257C0834C3272166E4640', 'KSGS', 'South St. Paul Municipal-Richard E. Flemi', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AC1C5A643BDF56C0740CC85EEF6E4640', 'KEAU', 'Chippewa Valley Regional Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E61000005F29CB10C7325BC0AC8BDB68006F4640', 'KPOY', 'Powell Municipal Airport', 'WY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000431CEBE236FA55C0E4141DC9E56F4640', 'KOCQ', 'Oconto J. Douglas Bake Municipal Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E61000006A183E22A64E57C0F0332E1C08714640', 'KMSP', 'Minneapolis-St. Paul International Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E61000004C89247A190F52C0EFE6A90EB9714640', 'KEFK', 'Northeast Kingdom International Airport', 'VT');
INSERT INTO postgis.stations VALUES ('0101000020E61000001D554D1075F756C0BC5CC47762724640', 'KLUM', 'Menomonie Municipal Airport-Score Field', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DF32A7CB62065DC05839B4C876724640', 'KMYL', 'McCall Airport', 'ID');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B62DCA6C904958C0C0046EDDCD734640', 'KATY', 'Watertown Municipal Airport', 'SD');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AB2688BA0FC05EC0AB9509BFD4734640', 'KSLE', 'Salem - McNary Field', 'OR');
INSERT INTO postgis.stations VALUES ('0101000020E61000008D976E12831C5BC0465F419AB1744640', 'KU68', 'Cowley', 'WY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D50451F7016856C05F0CE544BB764640', 'KAUW', 'Wausau Downtown Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E61000000820B589934357C0C1E270E657774640', 'KSTP', 'Downtown Holman Field', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E610000092B3B0A71DB652C0CF4E0647C9774640', 'KMSS', 'Massena International-Richards Field', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C32ADEC83C4652C042870A1F5B784640', 'KFSO', 'Franklin County State Airport', 'VT');
INSERT INTO postgis.stations VALUES ('0101000020E6100000488AC8B08AED57C0809A5AB6D67B4640', 'KMVE', 'Montevideo-Chippewa County Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DDCD531D720B58C0F59CF4BEF17D4640', 'KDXX', 'Madison-Lac Qui Parle County Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E610000034F44F70B14C55C0EDD3F198817E4640', 'KACB', 'Bellaire, Antrim County Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E610000003098A1F63AA51C01F85EB51B87E4640', 'K8B0', 'Steven A Bean Municipal Airport', 'ME');
INSERT INTO postgis.stations VALUES ('0101000020E61000006D567DAEB63657C0C7BAB88D06804640', 'K21D', 'Lake Elmo Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000FC3559A31E2C55C043E21E4B1F824640', 'KGLR', 'Gaylord Regional Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E61000001EC4CE143A8159C095B7239C16844640', 'KD07', 'Faith', 'SD');
INSERT INTO postgis.stations VALUES ('0101000020E61000002A1DACFF735657C00000000000884640', 'KMIC', 'Minneapolis, Crystal Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E61000007923F3C81FE454C05A0D897B2C894640', 'KAPN', 'Alpena County Regional Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E61000001F11532289A057C04703780B248C4640', 'KLJF', 'Litchfield Municipal Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C503CAA65C9356C0F6402B30648D4640', 'KMDZ', 'Taylor County Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C3B645990DC857C060CD0182398E4640', 'KBDH', 'Willmar Municipal Airport - John L. Rice Field', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D8648D7A88785CC05036E50AEF8E4640', 'KSMN', 'Salmon, Lemhi County Airport', 'ID');
INSERT INTO postgis.stations VALUES ('0101000020E6100000938C9C853DE955C0C7116BF129904640', 'KMNM', 'Menominee - Marinette Twin County Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E61000002B1895D409CC55C09A081B9E5E914640', 'K3D2', 'Ephraim-Gibraltar Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E610000021CD58349D4D57C02788BA0F40924640', 'KANE', 'Minneapolis / Blaine', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E61000008EAF3DB3242257C0261E5036E5924640', 'KRNH', 'New Richmond Municipal Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D7DD3CD5214756C0B97020240B944640', 'KAIG', 'Langlade County Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E61000003524EEB1F47557C0AAD4EC8156944640', 'KCFE', 'Buffalo Municipal Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E610000023F8DF4A76C85EC09335EA211A994640', 'KMMV', 'McMinnville Municipal Airport', 'OR');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F65D11FC6F6D56C0EF1B5F7B66994640', 'KRRL', 'Merrill Municipal Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E61000009C508880430058C022C32ADEC89C4640', 'KAQP', 'Appleton Municipal Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B79C4B71557F57C08A8EE4F21F9E4640', 'KMGG', 'Maple Lake Municipal Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E61000007A36AB3E57B15EC081ECF5EE8F9F4640', 'KUAO', 'Aurora State Airport', 'OR');
INSERT INTO postgis.stations VALUES ('0101000020E610000008E6E8F17B235CC0295C8FC2F5A04640', 'KDLN', 'Dillon Airport', 'MT');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AFEB17EC86E95BC050AA7D3A1EA34640', 'KEKS', 'Ennis - Big Sky Airport', 'MT');
INSERT INTO postgis.stations VALUES ('0101000020E610000063B9A5D590805DC0B020CD5834A54640', 'KLGD', 'La Grande/Union County Airport', 'OR');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A8E33103955155C0F437A11001A74640', 'KCVX', 'Charlevoix Municipal Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E610000050C763062A1B58C09E7B0F971CA74640', 'KVVV', 'Ortonville Muncipal-Martinson Field Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F7E461A1D6E856C09D11A5BDC1A74640', 'KY23', 'Chetek Municipal Southworth Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B1506B9A772C57C0F224E99AC9A74640', 'KOEO', 'L O Simenstad Municipal Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E610000036C8242367E957C0A6D0798D5DAA4640', 'KBBB', 'Benson Municipal Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E61000000DDE57E542505DC0C90050C58DAD4640', 'KJSY', 'Joseph State Airport AWOS', 'OR');
INSERT INTO postgis.stations VALUES ('0101000020E610000017BCE82B48AF57C0DD5ED218ADAF4640', 'KPEX', 'Paynesville Municipal Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E61000004260E5D022BB55C0B6847CD0B3B14640', 'K2P2', 'Washington Island', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F2B5679604F454C095B7239C16B44640', 'KPZQ', 'Rogers City, Presque Isle County Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E61000007923F3C81FF45EC004E275FD82B54640', 'KTMK', 'Tillamook Airport', 'OR');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F37684D382F156C004E275FD82B54640', 'KRPD', 'Rice Lake Regional-Carl''s Field Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E61000002A1DACFF733A55C02D3E05C078B64640', 'KMGN', 'Harbor Springs Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E61000004AD235936F9A58C0F8AA9509BFB84640', 'KABR', 'Aberdeen Regional Airport', 'SD');
INSERT INTO postgis.stations VALUES ('0101000020E610000096218E75716351C0A4880CAB78BB4640', 'KGNR', 'Greenville', 'ME');
INSERT INTO postgis.stations VALUES ('0101000020E6100000008C67D0D07356C0B9196EC0E7BB4640', 'KTKV', 'Tomahawk Regional Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E610000096438B6CE7BF56C0BA490C022BBF4640', 'KRCX', 'Ladysmith - Rusk County Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C286A757CAFE56C054E3A59BC4C04640', 'KUBE', 'Cumberland', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D7FA22A12D9B5DC053B3075A81C14640', 'KMEH', 'Meacham', 'OR');
INSERT INTO postgis.stations VALUES ('0101000020E6100000088F368E58135CC0EACF7EA488C44640', 'KRVF', 'Ruby Valley Field Airport', 'MT');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A835CD3B4E8357C0280F0BB5A6C54640', 'KSTC', 'St. Cloud Regional Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E61000003E5C72DC29BD5EC0C3D32B6519C64640', 'KHIO', 'Portland-Hillsboro Airport', 'OR');
INSERT INTO postgis.stations VALUES ('0101000020E610000063B48EAA261A59C06666666666C64640', 'KMBG', 'Mobridge Municipal Airport', 'SD');
INSERT INTO postgis.stations VALUES ('0101000020E6100000556AF6402B9A5EC0D13FC1C58AC64640', 'KTTD', 'Portland-Troutdale Airport', 'OR');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B7973446EB5057C079E9263108C84640', 'KCBG', 'Cambridge Municipal Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E61000000569C6A2E96657C04E62105839C84640', 'KPNM', 'Princeton', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B0FECF61BE3255C0CE70033E3FC84640', 'KPLN', 'Pellston Regional Airport of Emmet County', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E61000008E01D9EBDDFD57C0EACF7EA488C84640', 'KMOX', 'Morris Municipal Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E610000014ED2AA4FCA65EC031CEDF8442CC4640', 'KPDX', 'Portland International Airport', 'OR');
INSERT INTO postgis.stations VALUES ('0101000020E61000002237C30DF8E259C07632384A5ECD4640', 'K2WX', 'Buffalo', 'SD');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C2120F289B4A5EC0D0F23CB83BCF4640', 'KDLS', 'The Dalles Municipal Airport', 'WA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B2D7BB3FDEA95EC0DDEA39E97DCF4640', 'KVUO', 'Pearson Airfield', 'WA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000895E46B1DC5E56C0A2EE0390DAD04640', 'KRHI', 'Rhinelander-Oneida County Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E610000078D1579066D457C0A67EDE54A4D24640', 'KGHW', 'Glenwood Municipal Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D5B2B5BE482C51C05E807D74EAD24640', 'KMLT', 'Millinocket Municipal Airport', 'ME');
INSERT INTO postgis.stations VALUES ('0101000020E61000001EC4CE143A2155C0562B137EA9D34640', 'KSLH', 'Cheboygan County Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E610000036E50AEF723F58C08B4F01309ED54640', 'K8D3', 'Sisseton Municipal Airport', 'SD');
INSERT INTO postgis.stations VALUES ('0101000020E61000008EE9094B3C625EC06E6E4C4F58D64640', 'K4S2', 'Ken Jernstedt Airfield', 'OR');
INSERT INTO postgis.stations VALUES ('0101000020E610000003B2D7BB3F6455C08DD13AAA9AD84640', 'KSJX', 'Beaver Island Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E61000003E22A644123D57C0F06DFAB31FD94640', 'KROS', 'Rush City Regional Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E61000005A9E077767B55DC0DA5548F949D94640', 'KPDT', 'Eastern Oregon Regional Airport at Pendleton', 'OR');
INSERT INTO postgis.stations VALUES ('0101000020E610000034F44F70B19C5BC0D3C1FA3F87D94640', 'KLVM', 'Livingston, Mission Field Airport', 'MT');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A999999999956C09A99999999D94640', 'KPBH', 'Phillips / Price County', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F168E388B5305BC0603C8386FED94640', 'K6S8', 'Laurel Municipal', 'MT');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C173EFE192BB57C0350C1F1153DA4640', 'KD39', 'Sauk Centre Municipal Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CBBE2B82FFC555C094BC3AC780DC4640', 'KESC', 'Delta County Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000183E22A644EA5AC017BCE82B48DF4640', 'K00U', 'Big Horn County Airport', 'MT');
INSERT INTO postgis.stations VALUES ('0101000020E6100000304CA60A46B75EC043AD69DE71E24640', 'KSPB', 'Scappoose Industrial Airpark', 'OR');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E9D495CFF22258C01500E31934E44640', 'KETH', 'Wheaton Municipal Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CE8DE9094BCA5BC094A46B26DFE44640', 'KBZN', 'Bozeman, Gallatin Field', 'MT');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C286A757CA7E5BC048BF7D1D38E74640', 'K6S0', 'Big Timber', 'MT');
INSERT INTO postgis.stations VALUES ('0101000020E61000002DCF83BBB3225BC0C8EA56CF49E74640', 'KBIL', 'Billings Logan International Airport', 'MT');
INSERT INTO postgis.stations VALUES ('0101000020E61000002237C30DF80656C031B1F9B836E84640', 'KIMT', 'Iron Mountain / Kingsford, Ford Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A4703D0AD71757C0C5E6E3DA50E94640', 'KRZN', 'Siren, Burnett County Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E610000026AAB706B6D05DC0210725CCB4E94640', 'KHRI', 'Hermiston Municipal Airport', 'OR');
INSERT INTO postgis.stations VALUES ('0101000020E610000011E4A084992855C0E6965643E2EE4640', 'KMCD', 'Mackinac Island Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E61000001EC4CE143AD957C0417DCB9C2EEF4640', 'KAXN', 'Alexandria, Chandler Field', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E61000000113B875375157C04B1FBAA0BEF14640', 'KJMR', 'Mora Municipal Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E610000060E5D022DBB757C0F33CB83B6BF34640', 'K14Y', 'Todd Field Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E610000030D80DDB165156C0C16ED8B628F74640', 'KEGV', 'Eagle River Union Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E61000003ECBF3E0EE6E56C01630815B77F74640', 'KARV', 'Minocqua/Woodruff, Lakeland Airport/Noble F. Lee Memorial Field', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000919BE1067C085DC023F8DF4A76F84640', 'KGIC', 'Grangeville - Idaho County Airport', 'ID');
INSERT INTO postgis.stations VALUES ('0101000020E610000066666666669657C09A99999999F94640', 'KLXL', 'Little Falls/Morrison County Airport-Lindbergh Field', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A4703D0AD71F5CC0276BD44334FA4640', 'KBTM', 'Butte, Bert Mooney Airport', 'MT');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F437A110018B55C0E960FD9FC3FC4640', 'KISQ', 'Manistique, Schoolcraft County Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E61000004FAF946588EF54C0FE43FAEDEB004740', 'KDRM', 'Drummond Island Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A8E3310395A959C0A852B3075A014740', 'KHEI', 'Hettinger Municipal Airport', 'ND');
INSERT INTO postgis.stations VALUES ('0101000020E610000001DE02098A3957C07380608E1E034740', 'K04W', 'Hinckley Field of Dreams Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DEC83CF2079757C081CF0F23840B4740', 'KRYM', 'Ray S Miller Army Airfield', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000984C158C4A925DC015C616821C0C4740', 'KALW', 'Walla Walla Regional Airport', 'WA');
INSERT INTO postgis.stations VALUES ('0101000020E61000001E8A027D22B95EC07BDAE1AFC90E4740', 'KKLS', 'Southwest Washington Regional Airport', 'WA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D5CF9B8A547856C06C09F9A0670F4740', 'KD25', 'Manitowish Waters Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E61000003B191C25AFF250C00FB9196EC00F4740', 'KHUL', 'Houlton International Airport', 'ME');
INSERT INTO postgis.stations VALUES ('0101000020E6100000556AF6402BE65CC03C889D2974124740', 'KP69', 'Lowell', 'ID');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B62DCA6C904D56C03997E2AAB2134740', 'KLNL', 'Land O''Lakes, Kings Land O''Lakes Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E610000014AE47E17AF85EC095B7239C16144740', 'KAST', 'Astoria Regional Airport', 'OR');
INSERT INTO postgis.stations VALUES ('0101000020E61000005726FC523FD359C09A94826E2F154740', 'KBWW', 'Bowman Regional Airport', 'ND');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D3BCE3141D8558C003780B2428164740', 'K2D5', 'Oakes Municipal Airport', 'ND');
INSERT INTO postgis.stations VALUES ('0101000020E610000077BE9F1A2F6958C04ED1915CFE1B4740', 'KGWR', 'Gwinner', 'ND');
INSERT INTO postgis.stations VALUES ('0101000020E610000000000000001059C05C8FC2F5281C4740', 'K7L2', 'Linton', 'ND');
INSERT INTO postgis.stations VALUES ('0101000020E61000008E01D9EBDD1D55C00000000000204740', 'KCIU', 'Sault Ste Marie, Chippewa County International Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C095ECD808885CC0B1A206D330204740', 'K6S5', 'Hamilton', 'MT');
INSERT INTO postgis.stations VALUES ('0101000020E61000004BAB21718FC75DC08351499D80224740', 'KPSC', 'Tri-Cities Airport', 'WA');
INSERT INTO postgis.stations VALUES ('0101000020E610000012F758FAD00958C09B559FABAD244740', 'KFFM', 'Fergus Falls Municipal Airport-Einar Mickel', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E61000007AC7293A92D35DC0B3EF8AE07F274740', 'KRLD', 'Richland Airport', 'WA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F0C4AC17435D55C0B2BAD573D2274740', 'KERY', 'Newberry, Luce County Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000151DC9E53FF456C0F163CC5D4B284740', 'KOLG', 'Solon Springs Municipal Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E610000075029A081BFE5DC0C442AD69DE294740', 'K1S5', 'Sunnyside Municipal Airport', 'WA');
INSERT INTO postgis.stations VALUES ('0101000020E610000014AE47E17A105AC0F819170E842C4740', 'KBHK', 'Baker Municipal Airport', 'MT');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D3307C444CD955C0F0C4AC17432D4740', 'KSAW', 'Marquette, Sawyer International Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E610000045F0BF95EC405DC01D9430D3F62F4740', 'KLWS', 'Lewiston-Nez Perce County Airport', 'ID');
INSERT INTO postgis.stations VALUES ('0101000020E6100000842A357BA0B357C0F8AA9509BF304740', 'KSAZ', 'Staples Municipal Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E610000040DEAB56268857C0ACADD85F76334740', 'KBRD', 'Brainerd - Crow Wing County Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E61000005D50DF32A7A955C0465F419AB1344740', 'KP53', 'Munising Lakeshore Observation', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E61000004C8E3BA5833357C0DA5548F949354740', 'KMZH', 'Moose Lake Carlton County Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E610000018601F9DBA785AC0E65C8AABCA364740', 'KMLS', 'Miles City, Frank Wiley Field Airport', 'MT');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C1ADBB79AACD57C0A80018CFA0394740', 'KADC', 'Wadena Municipal Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000895E46B1DC1655C07632384A5E3D4740', 'KANJ', 'Sault Ste. Marie', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E61000003333333333735BC00000000000404740', 'K1KM', 'Kilo - Harlowton', 'MT');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D8648D7A888856C0E3FC4D2844444740', 'KIWD', 'Ironwood, Gogebic-Iron County Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E61000007094BC3AC7BA56C0D2E3F736FD454740', 'KASX', 'John F Kennedy Memorial Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E610000045BB0A293F6B57C060EAE74D45464740', 'KAIT', 'Aitkin Municipal Airport - Steve Kurtz Field', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000EE258DD13A225EC01C25AFCE31484740', 'KYKM', 'Yakima Air Terminal - McAllister Field', 'WA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000014D840D4FFF5BC09A081B9E5E4D4740', 'KHLN', 'Helena Regional Airport', 'MT');
INSERT INTO postgis.stations VALUES ('0101000020E610000072FE2614226251C05036E50AEF4E4740', 'K40B', 'Clayton Lake', 'ME');
INSERT INTO postgis.stations VALUES ('0101000020E61000002E1C08C9025457C03A75E5B33C4F4740', 'KHZX', 'Mc Gregor - Isedor Iverson Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CDCCCCCCCC1C5EC0211FF46C56554740', 'K1YT', 'Vagabond Army Airfield', 'WA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DE718A8EE4BE5EC02DB29DEFA7564740', 'KCLS', 'Chehalis-Centralia Airport', 'WA');
INSERT INTO postgis.stations VALUES ('0101000020E610000033333333330351C01630815B77574740', 'KPQI', 'Presque Isle', 'ME');
INSERT INTO postgis.stations VALUES ('0101000020E61000009964E42CEC0557C05DDC460378574740', 'KSUW', 'Richard I. Bong Airport', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E61000009C33A2B4372057C0680586AC6E594740', 'KCOQ', 'Cloquet Carlton County Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DE54A4C2D80257C022A64412BD5C4740', 'KDYT', 'Duluth - Sky Harbor Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E61000000CCD751A69475DC07ADFF8DA335F4740', 'KPUW', 'Pullman / Moscow Regional Airport', 'WA');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A999999993959C0C3F5285C8F624740', 'KY19', 'Mandan', 'ND');
INSERT INTO postgis.stations VALUES ('0101000020E610000023F8DF4A763059C05C8FC2F528644740', 'KBIS', 'Bismarck Municipal Airport', 'ND');
INSERT INTO postgis.stations VALUES ('0101000020E61000006ADE718A8EB056C0772D211FF4644740', 'K4R5', 'La Pointe - Major Gilbert Field', 'WI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AC5626FC52B359C0CBDB114E0B664740', 'KDIK', 'Dickinson Municipal Airport', 'ND');
INSERT INTO postgis.stations VALUES ('0101000020E61000003B014D840D7759C02B1895D409684740', 'KD57', 'Glen Ullin Regional Airport', 'ND');
INSERT INTO postgis.stations VALUES ('0101000020E6100000184339D1AEF857C0C3B645990D6A4740', 'KDTL', 'Detroit Lakes Airport-Wething Field', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E610000024B9FC87F43B5BC088635DDC466B4740', 'KMVH', 'N BAR Ranch Airport', 'MT');
INSERT INTO postgis.stations VALUES ('0101000020E61000004B766C04E22958C07AC7293A926B4740', 'KJKJ', 'Moorhead Municipal Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C05B2041F10B57C01D9430D3F66B4740', 'KDLH', 'Duluth International Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E610000090831266DA0051C0F437A110016F4740', 'KCAR', 'Caribou Municipal Airport', 'ME');
INSERT INTO postgis.stations VALUES ('0101000020E6100000EE42739D46C457C0C16ED8B628734740', 'KPKD', 'Park Rapids Municipal Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E610000052B81E85EB855CC07D96E7C1DD754740', 'KMSO', ' Missoula International Airport', 'MT');
INSERT INTO postgis.stations VALUES ('0101000020E610000059DDEA39E93358C04AD235936F764740', 'KFAR', 'Fargo, Hector International Airport', 'ND');
INSERT INTO postgis.stations VALUES ('0101000020E610000053793BC269AB58C0F437A11001774740', 'KJMS', 'Jamestown Municipal Airport', 'ND');
INSERT INTO postgis.stations VALUES ('0101000020E61000001F85EB51B8FE59C0D7A3703D0A774740', 'K20U', 'Beach', 'ND');
INSERT INTO postgis.stations VALUES ('0101000020E6100000FED478E9268158C0637FD93D79784740', 'KBAC', 'Valley City', 'ND');
INSERT INTO postgis.stations VALUES ('0101000020E61000007B14AE47E1FA5EC0C7681D554D7C4740', 'KHQM', 'Hoquiam, Bowerman Airport', 'WA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B9DFA128D0B95EC09B1BD313967C4740', 'KOLM', 'Olympia Airport', 'WA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D07EA4880C8D57C002F1BA7EC17E4740', 'KXVG', 'Longville Municipal Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E61000007CED992501225EC0FFCA4A9352844740', 'KELN', 'Ellensburg Bowers Field', 'WA');
INSERT INTO postgis.stations VALUES ('0101000020E61000009D4B7155D95D5BC0DFF8DA334B864740', 'KLWT', 'Lewistown Municipal Airport', 'MT');
INSERT INTO postgis.stations VALUES ('0101000020E61000000000000000F056C06666666666864740', 'KTWM', 'Two Harbors', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CDCCCCCCCC8C5BC0CDCCCCCCCC8C4740', 'K1CM', 'Windham', 'MT');
INSERT INTO postgis.stations VALUES ('0101000020E61000000000000000405BC0CDCCCCCCCC8C4740', 'K1NM', 'November', 'MT');
INSERT INTO postgis.stations VALUES ('0101000020E6100000EE7C3F355E925EC05A643BDF4F8D4740', 'KPLU', 'Pierce County-Thun Field', 'WA');
INSERT INTO postgis.stations VALUES ('0101000020E61000003333333333A35EC05036E50AEF8E4740', 'KGRF', 'Fort Lewis / Gray U. S. Army Airfield', 'WA');
INSERT INTO postgis.stations VALUES ('0101000020E61000003333333333335AC0B0C91AF510914740', 'KGDV', 'Glendive, Dawson Community Airport', 'MT');
INSERT INTO postgis.stations VALUES ('0101000020E61000003ECBF3E0EE9E5EC03333333333934740', 'KTCM', 'Tacoma / McChord Air Force Base', 'WA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F7065F984CA957C023DBF97E6A944740', 'KY49', 'Walker Municipal Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E61000001FA2D11DC41E56C0FE0E45813E954740', 'KCMX', 'Houghton County Memorial Airport', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F5108DEE20D45DC03F3A75E5B3984740', 'KMWH', 'Grant County Airport', 'WA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C2340C1F116157C01D03B2D7BB9B4740', 'KGPZ', 'Grand Rapids/Itasca County Airport-Gordon Newstrom Field', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000EC12D55B03C95EC02D3E05C0789E4740', 'KSHN', 'Shelton Sanderson Field', 'WA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DCBA9BA73ADA56C09C50888043A04740', 'KBFW', 'Silver Bay', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000BADA8AFD65FB57C0D34D621058A14740', 'K3N8', 'Mahnomen County Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E610000082397AFCDEA45EC00AD7A3703DA24740', 'KTIW', 'Tacoma Narrows Airport', 'WA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000419FC893A4555EC0C1FF56B263A34740', 'KSMP', 'Stampede Pass', 'WA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000562B137EA91351C014AE47E17AA44740', 'KFVE', 'Frenchville, Northern Aroostook Regional Airport', 'ME');
INSERT INTO postgis.stations VALUES ('0101000020E61000003333333333B35BC06666666666A64740', 'K1AM', 'Raynesford', 'MT');
INSERT INTO postgis.stations VALUES ('0101000020E61000000000000000E05BC06666666666A64740', 'K1IM', 'India', 'MT');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A99999999395BC06666666666A64740', 'K1OM', 'Roy', 'MT');
INSERT INTO postgis.stations VALUES ('0101000020E6100000EC12D55B03E15DC08FC2F5285CA74740', 'KEPH', 'Ephrata Municipal Airport', 'WA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000713D0AD7A3BC5AC0210725CCB4A94740', 'KJDN', 'Jordan Airport', 'MT');
INSERT INTO postgis.stations VALUES ('0101000020E61000006666666666065CC00AD7A3703DAA4740', 'K1GM', 'Golf', 'MT');
INSERT INTO postgis.stations VALUES ('0101000020E610000014AE47E17A745BC0713D0AD7A3B04740', 'K1DM', 'Delta', 'MT');
INSERT INTO postgis.stations VALUES ('0101000020E610000088635DDC463557C0DBDC989EB0B04740', 'KHIB', 'Chisholm-Hibbing Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E61000003468E89FE00C5EC0573ECBF3E0B24740', 'KEAT', 'Wenatchee - Pangborn Memorial Airport', 'WA');
INSERT INTO postgis.stations VALUES ('0101000020E61000005F29CB10C78658C0D95F764F1EB64740', 'KS32', 'Cooperstown', 'ND');
INSERT INTO postgis.stations VALUES ('0101000020E610000059A31EA2D11F57C0BB270F0BB5B64740', 'KEVM', 'Eveleth-Virginia Municipal Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B56CAD2F12945EC045F0BF95ECB84740', 'KSEA', 'Seattle-Tacoma International Airport', 'WA');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A99999999C958C09A99999999B94740', 'K46D', 'Carrington', 'ND');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CA54C1A8A45A5BC0355EBA490CBA4740', 'K1EM', 'Echo', 'MT');
INSERT INTO postgis.stations VALUES ('0101000020E6100000895E46B1DCEA5CC08369183E22BA4740', 'KMLP', 'Mullan Pass, Mullan Pass Vor', 'MT');
INSERT INTO postgis.stations VALUES ('0101000020E61000000000000000F855C0DD989EB0C4BB4740', 'KP59', 'Copper Harbor', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E610000023F8DF4A76D85BC09B1BD31396BC4740', 'KGTF', 'Falls, Great Falls International Airport', 'MT');
INSERT INTO postgis.stations VALUES ('0101000020E610000096CFF23CB88D5EC0CF49EF1B5FBF4740', 'KRNT', 'Renton Municipal Airport', 'WA');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBBCB5BC00000000000C04740', 'KGFA', 'Malmstrom Air Force Base', 'MT');
INSERT INTO postgis.stations VALUES ('0101000020E61000000000000000B05EC00000000000C04740', 'KPWT', 'Bremerton National Airport', 'WA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DA8F149161BB57C0D46531B1F9C04740', 'KBJI', 'Bemidji', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E61000004703780B24945EC0A04FE449D2C54740', 'KBFI', 'Boeing Field - King County International Airport', 'WA');
INSERT INTO postgis.stations VALUES ('0101000020E610000001C11C3D7EF157C087DC0C37E0CB4740', 'KFSE', 'Fosston Municipal Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E61000003333333333135CC0CDCCCCCCCCCC4740', 'K1FM', 'Foxtrot', 'MT');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A99999999695DC05036E50AEFCE4740', 'KSKA', 'Fairchild Air Force Base', 'WA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E8DEC325C7615DC0DD0720B589CF4740', 'KGEG', 'Spokane International Airport', 'WA');
INSERT INTO postgis.stations VALUES ('0101000020E61000007923F3C81F5C59C04963B48EAAD24740', 'KN60', 'Garrison', 'ND');
INSERT INTO postgis.stations VALUES ('0101000020E61000000664AF777F545DC00FB9196EC0D74740', 'KSFF', 'Spokane, Felts Field', 'WA');
INSERT INTO postgis.stations VALUES ('0101000020E61000007FD93D7958FC5BC0E17A14AE47D94740', 'K1HM', 'Hotel', 'MT');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CDCCCCCCCC0C5AC09A99999999D94740', 'KSDY', 'Sidney-Richland', 'MT');
INSERT INTO postgis.stations VALUES ('0101000020E6100000832F4CA60A9656C01DC9E53FA4DF4740', 'KGNA', 'The Bay of Grand Marais', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F5673F5244345DC08369183E22E24740', 'KCOE', 'Coeur d''Alene Airport - Pappy Boyington Field', 'ID');
INSERT INTO postgis.stations VALUES ('0101000020E61000003DF20703CF6957C0AA9A20EA3EE44740', 'KFOZ', 'Bigfork Municipal Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000BA6B09F9A0FB58C0304CA60A46E54740', 'K5H4', 'Harvey Municipal Airport', 'ND');
INSERT INTO postgis.stations VALUES ('0101000020E61000000000000000D059C06666666666E64740', 'KS25', 'Watford City', 'ND');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A5315A4755F556C0EACF7EA488E84740', 'KELO', 'Ely, Ely Municipal Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A80018CFA02B57C0BED9E6C6F4E84740', 'KCQM', 'Cook Municipal Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E61000007077D66EBB9856C06519E25817EB4740', 'KCKC', 'Grand Marais/Cook County Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F90FE9B7AF2758C0C173EFE192EB4740', 'KCKN', 'Crookston Municipal Field', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E61000008048BF7D1D925EC0EE08A7052FF64740', 'KPAE', 'Everett Snohomish County', 'WA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000EC51B81E85235FC00000000000F84740', 'KUIL', 'Quillayute State Airport', 'WA');
INSERT INTO postgis.stations VALUES ('0101000020E610000048E17A14AE4B58C0A852B3075AF94740', 'KGFK', 'Grand Forks International Airport', 'ND');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A999999995958C01D03B2D7BBFB4740', 'KRDR', 'Grand Forks Air Force Base', 'ND');
INSERT INTO postgis.stations VALUES ('0101000020E610000053793BC2695B5DC0465F419AB1FC4740', 'KDEW', 'Deer Park Airport', 'WA');
INSERT INTO postgis.stations VALUES ('0101000020E610000082A8FB00A43657C011DF89592F024840', 'KORB', 'Orr Regional Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AEF02E17F1B35EC033DC80CF0F074840', 'K0S9', 'Port Townsend Jefferson County International Airport', 'WA');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBB0B58C0EACF7EA488084840', 'KTVF', 'Thief River Falls Regional Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E610000037A6272CF1645AC095B7239C160C4840', 'KOLF', 'Wolf Point, Clayton Airport', 'MT');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AABA58C05036E50AEF0E4840', 'KDVL', 'Devils Lake Municipal Airport', 'ND');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E674594C6CE05EC08109DCBA9B0F4840', 'KCLM', 'Port Angeles Fairchild International Airport', 'WA');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A99999999D95EC0B0C91AF510114840', 'KNOW', 'Port Angeles Coast Guard Air Station', 'WA');
INSERT INTO postgis.stations VALUES ('0101000020E610000054E3A59BC4A057C025E99AC937134840', 'KVWU', 'Waskish Municipal Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B9C7D2872E8A5EC03F355EBA49144840', 'KAWO', 'Arlington Municipal Airport', 'WA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000EF0390DAC4A75AC081785DBF601B4840', 'KGGW', 'Glasgow International Airport', 'MT');
INSERT INTO postgis.stations VALUES ('0101000020E61000003E7958A8355159C031CEDF8442204840', 'KMOT', 'Minot International Airport', 'ND');
INSERT INTO postgis.stations VALUES ('0101000020E61000005C2041F1631E57C0D3307C444C214840', 'KCDD', 'Crane Lake - Scotts Seaplane Base', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000EBAD81AD12F059C0D36A48DC63214840', 'KXWA', 'Williston Basin International Airport', 'ND');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A4703D0AD7235DC09F8EC70C54264840', 'KSZT', 'Sandpoint, Sandpoint Airport', 'ID');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B462575029A59C08351499D80264840', 'K08D', 'Stanley Municipal Airport', 'ND');
INSERT INTO postgis.stations VALUES ('0101000020E610000082397AFCDE905CC05036E50AEF264840', 'KGPI', 'Kalispell, Glacier Park International Airport', 'MT');
INSERT INTO postgis.stations VALUES ('0101000020E61000007C0F971C77AA5EC0B6F3FDD4782D4840', 'KNUW', 'Whidbey Island Naval Air Station - Ault Field', 'WA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E6797077D6FA5AC010CCD1E3F72E4840', 'KM75', 'Malta Airport', 'MT');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A99999999B959C0713D0AD7A3304840', 'KD60', 'Tioga', 'ND');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E17A14AE470159C0713D0AD7A3304840', 'KRUG', 'Rugby', 'ND');
INSERT INTO postgis.stations VALUES ('0101000020E610000048E17A14AE5758C03333333333334840', 'KGAF', 'Grafton', 'ND');
INSERT INTO postgis.stations VALUES ('0101000020E610000066666666665659C0B79C4B7155354840', 'KMIB', 'Minot Air Force Base', 'ND');
INSERT INTO postgis.stations VALUES ('0101000020E61000000FB4024356095EC0B537F8C264364840', 'KS52', 'Methow Valley', 'WA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DA722EC555E15DC0971C774A073B4840', 'KOMK', 'Omak Airport', 'WA');
INSERT INTO postgis.stations VALUES ('0101000020E61000003ECBF3E0EE9A5EC0E3FC4D28443C4840', 'KBVS', 'Burlington/Mount Vernon, Skagit Regional Airport', 'WA');
INSERT INTO postgis.stations VALUES ('0101000020E61000001F85EB51B8CE58C03D0AD7A3703D4840', 'K9D7', 'Cando', 'ND');
INSERT INTO postgis.stations VALUES ('0101000020E61000001DE6CB0BB0C15EC0C3F5285C8F424840', 'KFHR', 'Friday Harbor Airport', 'WA');
INSERT INTO postgis.stations VALUES ('0101000020E610000090831266DA705BC02176A6D079454840', 'KHVR', 'Havre City-County Airport', 'MT');
INSERT INTO postgis.stations VALUES ('0101000020E61000003BC269C18B785DC06FBBD05CA7454840', 'K63S', 'Colville Municipal Airport', 'WA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C5E6E3DA505957C08109DCBA9B474840', 'KINL', 'Falls International Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B56CAD2F12185CC07D96E7C1DD4D4840', 'KCTB', 'Cut Bank Municipal Airport', 'MT');
INSERT INTO postgis.stations VALUES ('0101000020E6100000FC8C0B0742BA5EC08ACDC7B5A15A4840', 'KORS', 'Eastsound, Orcas Island Airport', 'WA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DE718A8EE4125DC0B0726891ED5C4840', 'K65S', 'Boundary County Airport', 'ID');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C58F31772DA757C062A1D634EF5C4840', 'KBDE', 'Baudette International Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A0C37C79013C58C007F0164850604840', 'KHCO', 'Hallock Municipal Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DA1B7C61329958C00E4FAF9465604840', 'KD55', 'Langdon', 'ND');
INSERT INTO postgis.stations VALUES ('0101000020E6100000381092054C6858C0FFCA4A9352644840', 'K2C8', 'Cavalier', 'ND');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E40F069E7B215AC07E52EDD3F1644840', 'KPWD', 'Plentywood', 'MT');
INSERT INTO postgis.stations VALUES ('0101000020E610000034BA83D899A25EC00AF4893C49664840', 'KBLI', 'Bellingham International Airport', 'WA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CDCCCCCCCCEC57C0CDCCCCCCCC6C4840', 'KROX', 'Roseau Municipal Airport/Rudy Billberg Field', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E610000048E17A14AEE758C0713D0AD7A3704840', 'K06D', 'Rolla', 'ND');
INSERT INTO postgis.stations VALUES ('0101000020E61000003333333333D359C0D7A3703D0A774840', 'KD50', 'Crosby', 'ND');
INSERT INTO postgis.stations VALUES ('0101000020E61000002766BD18CAD557C041B7973446774840', 'KRRT', 'Warroad International Memorial Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000446E861BF07958C01557957D57784840', 'K96D', 'Walhalla Municipal Airport', 'ND');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A99999999B957C0EACF7EA488A84840', 'KFGN', 'Flag Island', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D218ADA3AA1466C09C8A54185BF04940', 'PADK', 'Adak Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000944DB9C2BBC365401D03B2D7BB5B4A40', 'PASY', 'Shemya, Eareckson AFB', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000397F130A11D164C03333333333F34A40', 'PADU', 'Unalaska Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E61000006FF085C954B364C03480B74082124B40', 'PAUT', 'Akun Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E61000000664AF777F7260C0DB166536C8904B40', 'PAMM', 'Metlakatla Seaplane Base', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D218ADA3AA9A60C09A99999999994B40', 'PAHY', 'Hydaburg Seaplane Base', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DA5548F9495764C0E3FC4D28449C4B40', 'PACD', 'Cold Bay Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000611A868F881064C0EACF7EA488A84B40', 'PASD', 'Sand Point', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E61000002783A3E4D57660C004E275FD82AD4B40', 'PAKT', 'Ketchikan International Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A01A2FDD24A260C03411363CBDCA4B40', 'PAKW', 'Klawock Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E610000085EB51B81E2564C01B2FDD2406014C40', 'PAOU', 'Nelson Lagoon', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B493C151F2CB63C09626A5A0DB274C40', 'PAJC', 'Chignik Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000944DB9C2BB8B60C07D96E7C1DD3D4C40', 'PAWG', 'Wrangell', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D97C5C1B2A3565C0BC9179E40F4A4C40', 'PAPB', 'George Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000151DC9E53F9E60C0029A081B9E664C40', 'PAPG', 'Petersburg', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E61000006CB2463D44D463C09A99999999794C40', 'PAPH', 'Port Heiden Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F0A7C64B37BD60C008AC1C5A647B4C40', 'PAFE', 'Kake Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E61000003D9B559FABEB60C0A01A2FDD24864C40', 'PASI', 'Sitka Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C780ECF5EE4665C0B79C4B7155954C40', 'PASN', 'St. Paul Island Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D218ADA3AAD260C00000000000C04C40', 'PAGN', 'Angoon', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E610000000000000001063C00000000000E04C40', 'PADQ', 'Kodiak Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E61000006891ED7C3FED60C023DBF97E6A0C4D40', 'PAOH', 'Hoonah Seaplane Base', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000AAD4EC8156AC63C02B4D4A41B7174D40', 'PAII', 'Egegik Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000003ACC97170B61C094C151F2EA184D40', 'PAEL', 'Elfin Cove Seaplane Base', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C11C3D7E6FD260C05A9E0777672D4D40', 'PAJN', 'Juneau International Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E61000006666666666F660C0B79C4B7155354D40', 'PAGS', 'Gustavus Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E61000006BF12900C69463C09817601F9D564D40', 'PAKN', 'King Salmon Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E610000014D044D8F0D063C06D567DAEB66A4D40', 'PFCL', 'Clarks Point Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E61000004182E2C798E163C0E63FA4DFBE7E4D40', 'PAMB', 'Manokotak', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000FAB31F29223A64C08369183E22824D40', 'PAPM', 'Platinum', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000611A868F88D063C06666666666864D40', 'PADL', 'Dillingham Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CDCCCCCCCC0C64C06666666666864D40', 'PATG', 'Togiak Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000956588635DF060C06519E258179F4D40', 'PAHN', 'Haines Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E610000076711B0DE07C63C005C58F3177A94D40', 'PAIG', 'Igiugig', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E61000003CBD5296214A62C0AA8251499DB84D40', 'PAMD', 'Middleton Island Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D122DBF97EAA63C09A99999999B94D40', 'PANW', 'New Stuyahok', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E61000006666666666F662C09A99999999B94D40', 'PASO', 'Seldovia Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000EA95B20C71EA60C0B5A679C729BA4D40', 'PAGY', 'Skagway', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E61000002EE7525C557561C08369183E22C24D40', 'PAYA', 'Yakutat', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E61000009FE5797077EF62C03333333333D34D40', 'PAHO', 'Homer Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E61000003F355EBA49A863C0931804560EDD4D40', 'PAJZ', 'Koliganek', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CDCCCCCCCC5C63C00000000000E04D40', 'PAIL', 'Iliamna Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E61000002237C30DF88064C0732EC55565F74D40', 'PAKI', 'Kipnuk Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E61000006666666666AE62C05036E50AEF0E4E40', 'PAWD', 'Seward', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000FAB31F29224A63C09A99999999194E40', 'PALJ', 'Port Alsworth Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000611A868F88C864C05036E50AEF2E4E40', 'PAMY', 'Mekoryuk Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000397F130A11E162C07D96E7C1DD3D4E40', 'PASX', 'Soldotna', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DA5548F9492F62C05036E50AEF3E4E40', 'PACV', 'Cordova, Merle K (Mudhole) Smith Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D93D7958A8A364C087E123624A444E40', 'PAOO', 'Toksook Bay', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A4703D0AD7E762C0A852B3075A494E40', 'PAEN', 'Kenai Municipal Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C6A70018CF3A64C0C0046EDDCD634E40', 'PABE', 'Bethel Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D218ADA3AA9A62C0E3FC4D2844644E40', 'PATO', 'Portage Glacier', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000611A868F884862C0B0C91AF510914E40', 'PAVD', 'Valdez 2', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000FE261422E0BF62C09F8EC70C54964E40', 'PANC', 'Ted Stevens Anchorage International Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C780ECF5EEBE62C01630815B77974E40', 'PALH', 'Anchorage, Lake Hood Seaplane Base', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E61000003333333333BB62C01D03B2D7BB9B4E40', 'PAMR', 'Anchorage, Merrill Field Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E353008C67B962C07FF6234564A04E40', 'PAED', 'Anchorage, Elmendorf Air Force Base', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CDCCCCCCCCB462C08369183E22A24E40', 'PAFR', 'Ft. Richardson / Bryant U. S. Army Heliport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000611A868F88B062C0B79C4B7155B54E40', 'PABV', 'Birchwood Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E61000006CB2463D44C464C08369183E22C24E40', 'PAHP', 'Hooper Bay Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000575BB1BFEC0A64C086C954C1A8C44E40', 'PALG', 'Kalskag', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D3307C444CB162C01AA3755435C94E40', 'PAWS', 'Wasilla Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000889D29745EF163C0581CCEFC6ACA4E40', 'PANI', 'Aniak Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D218ADA3AAA262C0CDCCCCCCCCCC4E40', 'PAAQ', 'Palmer, Palmer Municipal Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F54A5986382A64C03333333333E34E40', 'PARS', 'Russian Mission', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E61000008E06F01648B264C087A757CA32EC4E40', 'PACM', 'Scammon Bay', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E61000002EE7525C556562C01630815B77F74E40', 'PAZK', 'Eureka, Skelton Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A999999996964C06666666666064F40', 'PASM', 'St. Mary''s Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E610000000000000001863C0CDCCCCCCCC0C4F40', 'PAPT', 'Puntilla', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E610000066666666662E62C03333333333134F40', 'PAGK', 'Gulkana Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C02154A9D9F863C039454772F9174F40', 'PAHC', 'Holy Cross', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000841266DAFEC262C0F0332E1C08294F40', 'PATK', 'Talkeetna Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B56CAD2F120664C00282397AFC524F40', 'PANV', 'Anvik Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D218ADA3AABA62C0B0C91AF510714F40', 'PAEC', 'Chulitna Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E61000009B728577B9BD61C0E5ED08A7057B4F40', 'PAOR', 'Northway Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000FA7E6ABC744B63C0DF4F8D976E824F40', 'PAFS', 'Nikolai', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C6F99B50884364C0F4893C49BABE4F40', 'PAMK', 'St Michael Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E610000000000000005065C01630815B77D74F40', 'PASA', 'Savoonga Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E61000002EE7525C559D62C07D96E7C1DDDD4F40', 'PAIN', 'McKinley National Park Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E61000008B4F01309E0963C03815A930B6F04F40', 'PAMH', 'Minchumina Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A999999991964C0B0C91AF510F14F40', 'PAUN', 'Unalakleet', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E61000009FE57970773762C00000000000005040', 'PABI', 'Delta Junction/Ft Greely, Allen Army Airfield', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E61000009FE5797077D763C0F5673F5244145040', 'PAKV', 'Kaltag Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000BA490C022B2764C0EBE2361AC0175040', 'PFSH', 'Shaktoolik Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E61000000AD7A3703DAE64C0E960FD9FC3205040', 'PAOM', 'Nome Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F0C4AC17436164C0E23B31EBC5225040', 'PAGL', 'Golovin Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E61000009430D3F6AFA262C009E1D1C611235040', 'PANN', 'Nenana Municipal Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E610000033333333336362C09A99999999295040', 'PAEI', 'Fairbanks, Eielson Air Force Base', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CC5D4BC8076F63C0AD69DE718A2E5040', 'PARY', 'Ruby', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000064CE0D6DD9D63C03ECBF3E0EE2E5040', 'PAGA', 'Galena, Edward G. Pitka Sr. Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E61000002FA86F99D3A461C041BCAE5FB0315040', 'PAEG', 'Eagle Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BB6D617097C62C036E50AEF72335040', 'PAFA', 'Fairbanks International Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C959D8D30E7362C0D6E253008C355040', 'PAFB', 'Fort Wainwright AAF', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C959D8D30E2564C0EF0390DAC43B5040', 'PAKK', 'Koyuk Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E610000033333333330363C05BCEA5B8AA4A5040', 'PATA', 'Tanana, Calhoun Memorial Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E61000000D71AC8BDBCA64C0567DAEB6624F5040', 'PATE', 'Teller', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E61000007E8CB96B090365C0569FABADD8675040', 'PAIW', 'Wales', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E61000008EE9094B3C8B63C0713D0AD7A36C5040', 'PAHL', 'Huslia Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000895E46B1DC2464C0895E46B1DC7E5040', 'PABL', 'Buckland Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D218ADA3AAC264C0C2340C1F11915040', 'PASH', 'Shishmaref Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000611A868F882862C0F5673F5244A45040', 'PFYU', 'Fort Yukon Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E610000000000000000064C0289B728577A75040', 'PASK', 'Selawik', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E61000006D567DAEB62064C0B81E85EB51B45040', 'PFNO', 'Noorvik', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DEB06D51665364C0B806B64AB0B85040', 'PAOT', 'Ralph Wien Memorial Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DA1B7C6132A563C0F7E461A1D6B85040', 'PAGH', 'Shungnak Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000611A868F88F062C05BCEA5B8AABA5040', 'PABT', 'Bettles Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000064CE0D6DD0D64C03ECBF3E0EEBE5040', 'PAIK', 'Kinana / Bob Baker Me', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E61000003333333333BB63C06666666666C65040', 'PAFM', 'Ambler Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E61000009FE57970775F64C0F5673F5244E45040', 'PAWN', 'Noatak Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A999999999164C03ECBF3E0EEEE5040', 'PAVL', 'Kivalina Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000611A868F883262C0AC5626FC52075140', 'PARC', 'Arctic Village Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E61000005704FF5BC9F762C0CA1AF5108D085140', 'PAKP', 'Anaktuvuk Pass Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A99999999D964C06666666666165140', 'PAPO', 'Point Hope Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E610000000000000006064C08E01D9EBDD6D5140', 'PPIZ', 'Point Lay LRRS Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E610000023F8DF4A76F261C0BBD05CA791885140', 'PABA', 'Barter Island LRRS Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E61000003A92CB7F484962C062105839B4885140', 'PAAD', 'Point Thomson Airstrip', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C780ECF5EE8E62C0CDCCCCCCCC8C5140', 'PASC', 'Deadhorse Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E61000004E452A8C2DE062C03D0AD7A3708D5140', 'PAQT', 'Nuiqsut Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D218ADA3AAB262C0F5673F5244945140', 'PAKU', 'Ugnu-Kuparuk Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000064CE0D6DDDD62C0A5315A4755955140', 'PALP', 'Deadhorse, Alpine Airstrip', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C05B2041F1AD63C0EE5A423EE89D5140', 'PATQ', 'Atqasuk', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E61000007689EAAD819863C0FC8C0B0742D25140', 'PABR', 'Wiley Post-Will Rogers Memorial Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A01A2FDD24F263C09A99999999594F40', 'PAHX', 'Shageluk Airport', 'AK');
INSERT INTO postgis.stations VALUES ('0101000020E6100000EBC5504EB47152C08BFD65F7E4514440', 'K06A', 'Moton Field Municipal Airport-Tuskegee', 'AL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E3C798BB96A056C00EBE30992A084240', 'KPGR', 'Kirk Field Airport Paragould', 'AR');
INSERT INTO postgis.stations VALUES ('0101000020E61000004C378941604D5BC0D122DBF97E7A4040', 'KCFT', 'Greenlee County Airport Clifton/Morenci', 'AZ');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C520B07268915CC0F90FE9B7AF134140', 'KP20', 'Avi Suquilla-Parker', 'AZ');
INSERT INTO postgis.stations VALUES ('0101000020E61000006FF085C954855DC0454772F90F514140', 'KZLA', 'Los Angeles Center Weather Service Unit', 'CA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C3F5285C8FBA5AC0FCA9F1D24DD24340', 'KGEE', 'Eagle County - Gypsum', 'CO');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AA0A52C00000000000E04440', 'K5B0', 'Mansfield', 'CT');
INSERT INTO postgis.stations VALUES ('0101000020E6100000289B7285776752C0545227A089884440', 'K5B3', 'Putnam', 'CT');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBB3B53C0CDCCCCCCCC6C4340', 'KWBC', 'News Headquarters', 'DC');
INSERT INTO postgis.stations VALUES ('0101000020E610000033333333336353C0CDCCCCCCCC8C4340', 'KZDC', 'Washington-ARTCC', 'DC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C1CAA145B6DB52C0B4C876BE9F6A4340', 'KDOX', 'Dover-Ellendale', 'DE');
INSERT INTO postgis.stations VALUES ('0101000020E6100000BC0512143FEE52C0ED0DBE3099C24340', 'KEVY', 'Summit Airport-Middletown', 'DE');
INSERT INTO postgis.stations VALUES ('0101000020E61000000000000000A053C06891ED7C3F553E40', 'K2XG', 'Gulf Of Mexico?', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E61000003CBD5296217A54C06DE7FBA9F1B23E40', 'KZJX', 'Hilliard Jacksonville ARTCC', 'FL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CDCCCCCCCC345CC0A01A2FDD24664540', 'KU01', 'American Falls Airport', 'ID');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D8648D7A88F855C00000000000004540', 'KCHI', 'Chicago-WSFO', 'IL');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D9CEF753E37D51C04C37894160D54440', 'KCHH', 'Chatham', 'MA');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AAAA51C0CDCCCCCCCC0C4540', 'K3B2', 'Marshfield', 'MA');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AABA51C0545227A089684540', 'K2B2', 'Newburyport', 'MA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C1CAA145B6BB51C03333333333134540', 'KNZW', 'South Weymouth', 'MA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D8648D7A88C851C09A99999999F94440', 'KBOX', 'Boston-Taunton', 'MA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D8648D7A88C851C09A99999999F94440', 'KTAR', 'Boston-RFC', 'MA');
INSERT INTO postgis.stations VALUES ('0101000020E61000006666666666E651C07F6ABC7493484540', 'KAYE', 'Ayer', 'MA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000289B728577F751C03333333333534540', 'K9B4', 'Ashburnham', 'MA');
INSERT INTO postgis.stations VALUES ('0101000020E61000008E01D9EBDDFD51C0545227A089484540', 'KGDM', 'Gardner Municipal Airport', 'MA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F5673F52440452C0211FF46C56354540', 'K8B5', 'Barre Falls', 'MA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000289B7285773752C0EEEBC03923224540', 'K7B2', 'Knightville', 'MA');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AA3A52C0454772F90F314540', 'KWOR', 'Worthington', 'MA');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBB4B52C09A99999999594540', 'K2B6', 'North Adams', 'MA');
INSERT INTO postgis.stations VALUES ('0101000020E610000066666666665652C09A99999999194540', 'KGBR', 'Walter J. Koladza Airport-Great Barrington', 'MA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000289B728577C752C0EACF7EA488284340', 'KN80', 'Ocean City', 'MD');
INSERT INTO postgis.stations VALUES ('0101000020E61000008195438B6CF752C05C8FC2F5287C4340', 'KRJD', 'Ridgely Airpark-Ridgely', 'MD');
INSERT INTO postgis.stations VALUES ('0101000020E61000009FCDAACFD51253C027C286A757B24340', 'KEDG', 'Weide Army Heliport-Edgewood Arsenal, Aberdeen Proving Ground', 'MD');
INSERT INTO postgis.stations VALUES ('0101000020E61000005A643BDF4F1553C0B29DEFA7C67B4340', 'KW29', 'Stevensville', 'MD');
INSERT INTO postgis.stations VALUES ('0101000020E610000071AC8BDB682453C0FFB27BF2B0784340', 'KANP', 'Lee Airport-Annapolis', 'MD');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C976BE9F1A2753C08716D9CEF7A34340', 'KDMH', 'Baltimore-Dwntwn', 'MD');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBB3B53C00000000000604340', 'KW32', 'Clinton', 'MD');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBB3B53C0CDCCCCCCCC6C4340', 'KWNB', 'Camp Springs-DBC', 'MD');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBB3B53C0CDCCCCCCCC6C4340', 'KWNC', 'Camp Springs-CPC', 'MD');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBB3B53C0CDCCCCCCCC6C4340', 'KWNH', 'Camp Springs-HPC', 'MD');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBB3B53C0CDCCCCCCCC6C4340', 'KWNM', 'Camp Springs-MPC', 'MD');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBB3B53C0CDCCCCCCCC6C4340', 'KWNO', 'Camp Spring-NCEP', 'MD');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F0A7C64B373D53C09CA223B9FC5F4340', 'KVKX', 'Potomac Airfield-Friendly', 'MD');
INSERT INTO postgis.stations VALUES ('0101000020E61000003ECBF3E0EE3E53C00000000000C04340', 'KEMI', 'Westminster', 'MD');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AA5A53C01D03B2D7BBDB4340', 'K43M', 'Fort Ritchie-Sit', 'MD');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AA5A53C01D03B2D7BBDB4340', 'KJWX', 'Fort Ritchie', 'MD');
INSERT INTO postgis.stations VALUES ('0101000020E61000008E01D9EBDD5D53C03333333333D34340', 'KDVD', 'Camp David', 'MD');
INSERT INTO postgis.stations VALUES ('0101000020E61000000000000000C050C0B79C4B7155754640', 'K47B', 'Eastport', 'ME');
INSERT INTO postgis.stations VALUES ('0101000020E61000000000000000C050C04C37894160754640', 'KEPM', 'Eastport Municipal Airport', 'ME');
INSERT INTO postgis.stations VALUES ('0101000020E61000001F4B1FBAA0DE50C07DD0B359F5594640', 'KMVM', 'Machias Valley Airport', 'ME');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A301BC0512E450C06F8104C58F994640', 'KPNN', 'Princeton Municipal Airport', 'ME');
INSERT INTO postgis.stations VALUES ('0101000020E61000003333333333F350C0E3FC4D2844044740', 'KCBW', 'Houlton,-88D', 'ME');
INSERT INTO postgis.stations VALUES ('0101000020E61000008D976E1283F850C09A99999999794740', 'KLIZ', 'Loring AFB', 'ME');
INSERT INTO postgis.stations VALUES ('0101000020E610000000000000000051C00000000000804540', 'K9B6', 'Sewel Ridge', 'ME');
INSERT INTO postgis.stations VALUES ('0101000020E610000075029A081B2251C0E08442041CAE4640', 'KLRG', 'Lincoln Regional Airport', 'ME');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A69BC420B02A51C09A99999999794640', 'KOLD', 'Old Town Municipal Airport', 'ME');
INSERT INTO postgis.stations VALUES ('0101000020E6100000FFB27BF2B04051C0143FC6DCB5344640', 'KBST', 'Belfast Municipal Airport', 'ME');
INSERT INTO postgis.stations VALUES ('0101000020E610000033333333336351C01D03B2D7BBBB4640', 'K3B1', 'Greenville', 'ME');
INSERT INTO postgis.stations VALUES ('0101000020E6100000289B7285776751C01630815B77774640', 'K2B7', 'Harmony', 'ME');
INSERT INTO postgis.stations VALUES ('0101000020E61000008E01D9EBDD6D51C01D03B2D7BBFB4540', 'K9B9', 'Wiscasset', 'ME');
INSERT INTO postgis.stations VALUES ('0101000020E61000004CE0D6DD3C7751C000C63368E85B4640', 'KOWK', 'Central Maine Airport-Norridgewock', 'ME');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C1CAA145B67B51C03333333333F34540', 'KNHZ', 'Brunswick NAS', 'ME');
INSERT INTO postgis.stations VALUES ('0101000020E61000006F1283C0CA7B51C097FF907EFBF24540', 'KBXM', 'Brunswick Executive Airport', 'ME');
INSERT INTO postgis.stations VALUES ('0101000020E61000008E01D9EBDD8D51C04963B48EAA8A4640', 'KB21', 'Carrabassett', 'ME');
INSERT INTO postgis.stations VALUES ('0101000020E610000000000000009051C0B0C91AF510F14540', 'KGYX', 'Gray-Portland', 'ME');
INSERT INTO postgis.stations VALUES ('0101000020E610000072FE261422A251C0E3FC4D2844444640', 'KRUM', 'Rumford', 'ME');
INSERT INTO postgis.stations VALUES ('0101000020E6100000289B728577A751C01630815B77B74540', 'KENE', 'Kennebunk Port', 'ME');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CDCCCCCCCCBC51C07D96E7C1DDFD4540', 'KB20', 'Freyburg', 'ME');
INSERT INTO postgis.stations VALUES ('0101000020E61000008E01D9EBDDAD54C00000000000A04540', 'KECK', 'Peck', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000289B7285771755C01D03B2D7BB3B4740', 'KSSM', 'Sault Ste Marie', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E61000004260E5D022E355C08716D9CEF7434740', 'KMQT', 'Marquette', 'MI');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBB4B57C0454772F90F514640', 'KZMP', 'Minneapolis Center Weather Service Unit', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E61000006ADE718A8E6857C0FB3A70CE88E24640', 'K18Y', 'Milaca Municipal Airport', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E61000005DFE43FAED9757C03EEDF0D764314740', 'K9Y2', 'East Gull Lake', 'MN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000ACCABE2B82A756C0BEC1172653E14240', 'KH57', 'Bismark Memorial Airport', 'MO');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AAAA57C0E3FC4D2844A44340', 'KKCI', 'Kansas City International Airport', 'MO');
INSERT INTO postgis.stations VALUES ('0101000020E610000072FE261422E252C08369183E22A24140', 'KHAT', 'Cape Hatteras', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CDCCCCCCCCEC52C03333333333934140', 'K44W', 'Diamond Shores', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C2340C1F110153C03333333333334240', 'K9W7', 'Currituck', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B8AF03E78C3053C039B4C876BEE74140', 'KPMZ', 'Plymouth Municipal Airport-Plymouth', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000736891ED7C3753C01904560E2D624140', 'KMHX', 'Morehead-Newport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E610000033C4B12E6E4B53C0AED85F764FEE4140', 'KMCZ', 'Martin County Airport-Williamston', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E61000003D0AD7A3706D53C0D578E92631384240', 'KRZZ', 'Halifax County Airport-Roanoke Rapids', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E610000000000000008053C07D96E7C1DD5D4140', 'KACZ', 'Henderson Field-Wallace', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBB9B53C07D96E7C1DDFD4040', 'KLTX', 'Shallotte-Wilm.', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E61000003ECBF3E0EE9E53C0B79C4B7155D54140', 'KRAX', 'Clayton-RDU 88D', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E61000008E01D9EBDDAD53C05036E50AEFAE4140', 'K37W', 'Erwin-Harnett Co', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E610000072FE261422B253C05036E50AEFEE4140', 'KRAH', 'Raleigh-WFO', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B29DEFA7C6C353C0E7FBA9F1D24D4140', 'KLBT', 'Lumberton Municipal Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E61000006ABC749318C453C08195438B6CF74140', 'KIGX', 'Horace Williams Airport-Chapel Hill', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C74B378941E053C0273108AC1CDA4140', 'K5W8', 'Siler City', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C2340C1F11F153C0B0C91AF510714140', 'K45J', 'Rockingham', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E61000006666666666F653C01630815B77374240', 'K78N', 'Reidsville', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E610000066666666660654C03333333333D34140', 'KW44', 'Asheboro', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E6AE25E4833254C05DFE43FAED234240', 'KZEF', 'Elkin Municipal Airport', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F5673F5244B454C03333333333F34140', 'KHSS', 'Hot Springs', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E61000006666666666F654C01630815B77974140', 'K6A3', 'Andrews', 'NC');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AABA51C0E3FC4D2844A44540', 'K6B1', 'Rochester', 'NH');
INSERT INTO postgis.stations VALUES ('0101000020E61000003480B74082CA51C0CC7F48BF7D654640', 'KERR', 'Errol Airport', 'NH');
INSERT INTO postgis.stations VALUES ('0101000020E61000003333333333D351C03333333333F34540', 'KTMW', 'Tamworth', 'NH');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F5673F5244D451C09A99999999794640', 'K8B2', 'Diamond Lake', 'NH');
INSERT INTO postgis.stations VALUES ('0101000020E61000003ECBF3E0EEDE51C07D96E7C1DD5D4540', 'KZBW', 'Nashua-ARTCC-Bos', 'NH');
INSERT INTO postgis.stations VALUES ('0101000020E610000094F6065F98E051C0C364AA60549A4540', 'KOCN', 'Concord Municipal Airport', 'NH');
INSERT INTO postgis.stations VALUES ('0101000020E6100000289B728577F751C08369183E22E24540', 'KNGR', 'North Groton', 'NH');
INSERT INTO postgis.stations VALUES ('0101000020E61000006B9A779CA21752C0F2B0506B9AAF4540', 'KCNH', 'Claremont Municipal Airport', 'NH');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C2340C1F118152C01D03B2D7BB3B4440', 'K56N', 'Sandy Hook CGS', 'NJ');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBB8B52C0EACF7EA488084440', 'KN12', 'Lakewood', 'NJ');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F5673F52449452C09A99999999794440', 'KN07', 'Lincoln Park', 'NJ');
INSERT INTO postgis.stations VALUES ('0101000020E610000066666666669652C04963B48EAA2A4440', 'K3N6', 'Old Bridge', 'NJ');
INSERT INTO postgis.stations VALUES ('0101000020E610000066666666669652C0B0C91AF510914440', 'K4N1', 'West Milford', 'NJ');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AA9A52C09A99999999F94340', 'KDIX', 'Manchester 88D', 'NJ');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBB9B52C0EACF7EA488E84340', 'KCYN', 'Coyle VOR', 'NJ');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBB9B52C07D96E7C1DD3D4440', 'KNBK', 'New Brunswick', 'NJ');
INSERT INTO postgis.stations VALUES ('0101000020E610000072FE261422A252C0EACF7EA488884440', 'KSAX', 'Sparta VOR', 'NJ');
INSERT INTO postgis.stations VALUES ('0101000020E61000006666666666A652C08369183E22A24340', 'K26N', 'Ocean City', 'NJ');
INSERT INTO postgis.stations VALUES ('0101000020E61000006666666666A652C01D03B2D7BB1B4440', 'KN87', 'Robbinsville', 'NJ');
INSERT INTO postgis.stations VALUES ('0101000020E61000006666666666A652C08369183E22424440', 'K47N', 'Manville', 'NJ');
INSERT INTO postgis.stations VALUES ('0101000020E61000006666666666A652C09A99999999994440', 'KN63', 'Sussex', 'NJ');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AAAA52C03333333333334440', 'K39N', 'Princeton', 'NJ');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AAAA52C05036E50AEF4E4440', 'KN52', 'Somerville', 'NJ');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AAAA52C05036E50AEF4E4440', 'KSJB', 'Somerville', 'NJ');
INSERT INTO postgis.stations VALUES ('0101000020E61000000000000000B052C0B79C4B7155D54340', 'KN81', 'Hammonton', 'NJ');
INSERT INTO postgis.stations VALUES ('0101000020E61000003333333333B352C0CDCCCCCCCC8C4340', 'KSIE', 'Sea Isle VOR', 'NJ');
INSERT INTO postgis.stations VALUES ('0101000020E61000003333333333B352C01D03B2D7BB9B4340', 'KOBI', 'Woodbine Municipal Airport', 'NJ');
INSERT INTO postgis.stations VALUES ('0101000020E61000003333333333B352C01630815B77F74340', 'KN14', 'Lumberton', 'NJ');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F5673F5244B452C08369183E22024440', 'KPHI', 'Mt Holly-PHL-WFO', 'NJ');
INSERT INTO postgis.stations VALUES ('0101000020E61000003ECBF3E0EEBE52C0EACF7EA488484440', 'KN40', 'Pittstown', 'NJ');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C2340C1F11C152C04963B48EAA4A4440', 'KN85', 'Alexandria', 'NJ');
INSERT INTO postgis.stations VALUES ('0101000020E610000072FE261422C252C09A99999999D94340', 'K17N', 'Cross Keys', 'NJ');
INSERT INTO postgis.stations VALUES ('0101000020E61000003F355EBA49A45AC04C37894160954140', 'KZAB', 'Albuquerque Center Weather Service Unit', 'NM');
INSERT INTO postgis.stations VALUES ('0101000020E6100000289B7285773752C05036E50AEF6E4440', 'KOKX', 'Brookhaven-Upton', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E610000066666666664652C06666666666664440', 'KZNY', 'New York-ARTCC', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBB4B52C09A99999999394440', 'KN28', 'Ambrose', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B6F3FDD4786152C00E2DB29DEF574640', 'KPLB', 'Plattsburgh', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E61000008E01D9EBDD6D52C0E3FC4D2844244540', 'K1B1', 'Hudson-Columbia', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E61000003ECBF3E0EE6E52C0E3FC4D2844C44440', 'KSTM', 'Stormville', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E610000033333333337352C00000000000604540', 'KALY', 'Albany-WFO', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E610000033333333337352C03333333333734640', 'KELB', 'Ellenburg Depot', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000289B7285777752C06666666666864540', 'K5B2', 'Saratoga Springs', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F6285C8FC27D52C0355EBA490C224640', 'KLKP', 'Lake Placid Airport', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E61000009CC420B0728052C0713D0AD7A3604440', 'KJRA', 'West 30th Street Heliport-Manhattan', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F5673F52448452C04963B48EAA4A4540', 'KENX', 'Albany-E. Berne', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E610000033333333339352C0CDCCCCCCCC6C4640', 'KMAL', 'Malone-Dufort Airport', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E610000066666666669652C01D03B2D7BBFB4440', 'KSLD', 'Slide Mountain', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E610000072FE261422A252C09A99999999B94540', 'KPIC', 'Piseco Lake', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AABA52C09A99999999594540', 'KCOO', 'Cooperstown', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A99999999C952C0B0C91AF510314540', 'KOZX', 'Oneonta', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F5673F5244D452C0EACF7EA488084540', 'KHNK', 'Hancock VOR', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E61000006666666666D652C09A99999999B94540', 'K1B8', 'Boonville', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E61000007F6ABC7493D852C0C3F5285C8F924540', 'KUCA', 'Oneida County Airport-Utica', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AADA52C06666666666264540', 'KN23', 'Sidney', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CDCCCCCCCCDC52C01D03B2D7BBBB4540', 'KRMX', 'Griffiss AFB,-88D', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C2340C1F11E152C0EACF7EA488484540', 'KOIC', 'Lt. Warren Eaton Airport-Norwich', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBBEB52C00000000000E04540', 'KTYX', 'Fort Drum,-88D', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E610000066666666660653C04963B48EAA0A4540', 'KCZG', 'Tri-Cities Airport-Endicott', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D8648D7A881853C0CDCCCCCCCCAC4540', 'KN00', 'Oswego County Airport, Fulton', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E61000008D976E12833853C088855AD3BC5B4540', 'KSSN', 'Seneca Army Airfield-Romulus', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F5673F52445453C03333333333734540', 'KD38', 'Canandaigua', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBB6B53C0B0C91AF510314540', 'K4G6', 'Hornell', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CDCCCCCCCC8C53C01630815B77574540', 'KWRS', 'Warsaw', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E610000057EC2FBB27A753C0A01A2FDD24764540', 'KBQR', 'Buffalo-Lancaster Regional Airport', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBBAB53C0B79C4B7155554540', 'KCOL', 'Colden', 'NY');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CDCCCCCCCC2C54C0E3FC4D2844E44440', 'K7G2', 'Ashtabula', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CDCCCCCCCC2C54C0E3FC4D2844E44440', 'KSHI', 'Ashtabula', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F5673F52443454C08369183E22024440', 'KAIR', 'Bellaire VOR', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E610000000000000005054C01D03B2D7BB9B4440', 'K29G', 'Ravena-Portage', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBB8B54C0CDCCCCCCCCAC4440', 'K22G', 'Lorain-Elyria', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CDCCCCCCCC8C54C06666666666A64440', 'KZOB', 'Cleveland-ARTCC', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E61000008E01D9EBDD9D54C08369183E22024440', 'K2I8', 'Newark', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E7FBA9F1D2A554C0C58F31772DF14340', 'K7B4', 'Miller Farm Landing Strip-Baltimore', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A99999999A954C00000000000E04340', 'KI15', 'Lancaster', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E610000096438B6CE7BB54C0696FF085C9944340', 'KEOP', 'Pike County Airport-Waverly', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E61000003ECBF3E0EEBE54C08369183E22C24340', 'KCYO', 'Pickaway County Memorial Airport-Circleville', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D8648D7A88C854C03333333333F34340', 'K2I4', 'Columbus-Bolton', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C520B07268D954C02AA913D044984440', 'KFZI', 'Fostoria Metropolitan Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C1CAA145B6DB54C07F6ABC7493884640', 'KAPE', 'Appleton', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E61000004E62105839E454C0931804560E6D4340', 'KAMT', 'Alexander Salamon Airport-West Union', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AAEA54C08369183E22824440', 'KFBC', 'Flag City', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F5673F5244F454C0B79C4B7155B54340', 'KTIR', 'Wilmington-RFC', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E610000072FE2614220255C0E3FC4D2844244440', 'KROD', 'Rosewood VOR', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E61000005839B4C8760E55C079E9263108CC4340', 'KMGY', 'Dayton Wright Brothers Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A99999999C952C09A99999999194440', 'KNXX', 'Naval Air Station Joint Reserve Base Willow Grove', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AACA52C07D96E7C1DDBD4440', 'KHAW', 'Hawley', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AADA52C01630815B77974440', 'K7TB', 'Tobyhanna', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F4FDD478E9DE52C07F6ABC7493484440', 'KJVU', 'Allentown Queen', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBBEB52C04963B48EAA4A4440', 'KETX', 'East Texas VOR', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C2340C1F11F152C06666666666664440', 'K22N', 'Lehighton/Arner Mem', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000BBB88D06F0F652C083C0CAA145A64440', 'KWBW', 'Wilkes-Barre Wyoming Valley Airport', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000289B728577F752C07D96E7C1DDFD4340', 'K40N', 'Coatesville', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000EC51B81E851753C0742497FF905A4440', 'KZER', 'Schuylkill County Airport-Pottsville', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CDCCCCCCCC1C53C07D96E7C1DDDD4440', 'KN27', 'Towanda', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F5673F52444453C06666666666264440', 'KHAR', 'Harrisburg', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AA5A53C0B0C91AF510914440', 'KLHV', 'William T. Piper Memorial Airport-Lock Haven', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C1CAA145B65B53C0E7FBA9F1D2DD4340', 'KRYT', 'Fountain Dale', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E610000066666666667653C0CDCCCCCCCC6C4440', 'KCTP', 'State College-WFO', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E610000066666666667653C0CDCCCCCCCC6C4440', 'KRHA', 'State Colleg-RFC', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E61000008E01D9EBDD7D53C00000000000C04440', 'KSLT', 'Slate Run', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E610000000000000008053C0B79C4B7155754440', 'KCCX', 'Rush-St College', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E61000005A643BDF4F8553C03333333333734440', 'KPSB', 'Mid-State Regional Airport-Philipsburg', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AA9A53C06666666666864440', 'KN97', 'Clearfield', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E61000008048BF7D1DDC53C0789CA223B99C4440', 'KAXQ', 'Clarion County Airport', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E09C11A5BDE953C0D7C0560916FB4340', 'KVVS', 'Joseph A. Hardy Connellsville Airport', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CCEEC9C342F553C0C286A757CA1A4440', 'KFWQ', 'Rostraver Airport-Monongahela', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000637FD93D790854C0EC2FBB270FF34340', 'KWAY', 'Greene County Airport-Waynesburg', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CDCCCCCCCC0C54C05036E50AEFCE4440', 'K2G6', 'Meadville', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E61000008E01D9EBDD0D54C0E3FC4D2844444440', 'KPBZ', 'Pitt-Coraopolis', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E61000008E01D9EBDD0D54C04963B48EAA6A4440', 'KEWC', 'Ellwood City VOR', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AA4A54C03333333333934440', 'K29D', 'Grove City', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E610000072FE261422D251C0E3FC4D2844C44440', 'K2B4', 'Newport', 'RI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C2340C1F11E151C0B79C4B7155F54440', 'K1B6', 'Woonsocket', 'RI');
INSERT INTO postgis.stations VALUES ('0101000020E6100000DDB5847CD0D753C0287E8CB96B394140', 'KDLC', 'Dillon County Airport', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E610000092CB7F48BFE153C036CD3B4ED1B94040', 'KPHH', 'Robert F. Swinnie Airport-Andrews', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C1CAA145B6FB53C0CDCCCCCCCC6C4040', 'KCLX', 'Charleston-Grays', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E610000072FE2614220254C03333333333734040', 'KIGC', 'Charleston Afb', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000BDE3141DC91554C03A92CB7F485F4140', 'KPYG', 'Pageland Airport', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E61000003ECBF3E0EE1E54C0CDCCCCCCCCEC4040', 'K2PJ', 'Sumter-Poinsett', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CDCCCCCCCC2C54C01D03B2D7BB1B4040', 'K49J', 'Hilton Head', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E610000033333333334354C07D96E7C1DD7D4140', 'K29J', 'Rock Hill', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E61000004C378941604554C01F85EB51B8CE4040', 'KXNO', 'North Air Force Auxiliary Field', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AA8A54C01D03B2D7BBDB4040', 'KIRQ', 'Colliers VOR', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D8648D7A889854C00000000000604140', 'KXAA', 'Grnvl-Dnldsn', 'SC');
INSERT INTO postgis.stations VALUES ('0101000020E6100000083D9B559F7355C03D0AD7A370FD4140', 'K0A3', 'Smithville Municipal Airport', 'TN');
INSERT INTO postgis.stations VALUES ('0101000020E6100000B4C876BE9F4A58C09C33A2B437083E40', 'K84R', 'Smithville Crawford Muniicipal', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E610000091ED7C3F35B658C0CDCCCCCCCC6C3A40', 'K67R', 'Rio Grande City Municipal Airport', 'TX');
INSERT INTO postgis.stations VALUES ('0101000020E6100000D8648D7A882853C06666666666A64240', 'KW94', 'Williamsburg', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000A60A4625754253C0D0B359F5B92A4340', 'KNDY', 'Naval Surface Warfare Center Dahlgren', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E61000003108AC1C5A5453C046B6F3FDD4084340', 'KAPH', 'A.P. Hill Army Airfield', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E61000003ECBF3E0EE5E53C07D96E7C1DD7D4340', 'KLWX', 'Sterling', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E61000008E01D9EBDD6D53C04963B48EAA4A4340', 'KW66', 'Warrenton', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000289B7285777753C0B0C91AF510514340', 'KCSN', 'Cassanova VOR', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F2D24D6210A053C04C37894160554340', 'KW45', 'Luray', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E61000003ECBF3E0EEBE53C09A99999999794240', 'KVQN', 'Volens', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E61000003F355EBA49F453C09A99999999F94240', 'KHSP', 'Ingalls Field-Hot Springs', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C2340C1F111154C08369183E22824240', 'KFCX', 'Roanoke-Floyd County', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A999999991954C09A99999999994240', 'KRNK', 'Roanoke-Blacksbg', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000508D976E127354C0D578E92631884240', 'K6V3', 'Richlands', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000645DDC46038854C092CB7F48BF9D4240', 'KGDY', 'Grundy Municipal Airport', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CBA145B6F3CD54C0C1CAA145B6534240', 'K0VG', 'Jonesville', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E61000000000000000E051C012143FC6DC7D4640', 'KVT1', 'Canaan', 'VT');
INSERT INTO postgis.stations VALUES ('0101000020E61000003ECBF3E0EEFE51C03333333333534640', 'KVT2', 'West Burke', 'VT');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C2340C1F110152C0545227A089484640', 'K6B8', 'Lyndonville', 'VT');
INSERT INTO postgis.stations VALUES ('0101000020E6100000289B7285770752C05036E50AEF6E4540', 'KMNW', 'Wilmington', 'VT');
INSERT INTO postgis.stations VALUES ('0101000020E610000072FE2614222252C0ACADD85F76774640', 'KJAY', 'Jay Peak', 'VT');
INSERT INTO postgis.stations VALUES ('0101000020E610000033333333333352C05036E50AEF8E4540', 'K8B3', 'Ball Mountain', 'VT');
INSERT INTO postgis.stations VALUES ('0101000020E610000066666666663652C01630815B77774540', 'KWDO', 'West Dover', 'VT');
INSERT INTO postgis.stations VALUES ('0101000020E61000008E01D9EBDD3D52C0EACF7EA488084640', 'KSOL', 'South Lincoln', 'VT');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AA4A52C08369183E22424640', 'KCXX', 'Colchester 88D', 'VT');
INSERT INTO postgis.stations VALUES ('0101000020E610000000000000005052C0B0C91AF510714540', 'K5B5', 'Bennington', 'VT');
INSERT INTO postgis.stations VALUES ('0101000020E61000003C4ED1915CAE5EC08FC2F5285C1F4840', 'KCVV', 'Coupeville-Penn Cove', 'WA');
INSERT INTO postgis.stations VALUES ('0101000020E610000024287E8CB93754C0AEB6627FD91D4340', 'KSXL', 'Summersville Airport', 'WV');


--
-- TOC entry 4517 (class 0 OID 29657)
-- Dependencies: 254
-- Data for Name: sua; Type: TABLE DATA; Schema: postgis; Owner: -
--



--
-- TOC entry 4519 (class 0 OID 51032)
-- Dependencies: 256
-- Data for Name: sua_airspace; Type: TABLE DATA; Schema: postgis; Owner: -
--

INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000007000000BD8BF7E3F65F51C087A3AB7477D7454036E84B6F7F3851C0BBD6DEA7AAEA4540BD8BF7E3F6BF50C0CDCCCCCCCC2C4640BD8BF7E3F6BF50C06666666666E645409C4EB2D5E52E51C0213D450E11B14540BD8BF7E3F65F51C0BBD6DEA7AA8A4540BD8BF7E3F65F51C087A3AB7477D74540', 7635, '102-LOW');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000007000000BD8BF7E3F65F51C087A3AB7477D7454036E84B6F7F3851C0BBD6DEA7AAEA4540BD8BF7E3F6BF50C0CDCCCCCCCC2C4640BD8BF7E3F6BF50C06666666666E645409C4EB2D5E52E51C0213D450E11B14540BD8BF7E3F65F51C0BBD6DEA7AA8A4540BD8BF7E3F65F51C087A3AB7477D74540', 7650, '102-HIGH');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000080000009A99999999D952C00000000000C04140C4D155BABB7B52C0EE0912DBDD1D414033333333333353C09A999999991940403C2EAA45445453C0BBD6DEA7AA2A4040D6C743DFDD5D53C0000000000080404000000000006053C04529215855954040F70489EDEE5E53C0213D450E113141409A99999999D952C00000000000C04140', 13913, '122');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000006000000183F8D7BF3D25BC0F1BBE9961D9E4040206118B0E4CF5BC0F1BBE9961D9E40401041D5E8D5D45BC012F6ED24228A4040D87F9D9B36D85BC08236397CD2874040FD4AE7C3B3D65BC092770E65A8944040183F8D7BF3D25BC0F1BBE9961D9E4040', 4220, '2310A');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000040000005BB39597FCEE5CC054707841442441405BB39597FCEE5CC0EE0912DBDD1D4140F70489EDEEFE5CC0317E1AF7E61D41405BB39597FCEE5CC05470784144244140', 5815, '2501E');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000F0000003B55BE67241C5DC0000000000040414052B81E85EB1D5DC0CDCCCCCCCC4C4140691B7FA2B21F5DC066666666665641403B55BE67241C5DC0AC8F87BEBB5B41408EE6C8CA2F125DC0AC8F87BEBB5B414049BDA772DA045DC00000000000584140AF230ED940035DC087A3AB747757414052B81E85EBFD5CC0AC8F87BEBB4B414060200890A1FA5CC0952C27A1F449414052B81E85EBFD5CC0795C548B884841402A38BC2022FE5CC00ADAE4F0493F4140B2D826158D045DC0BBD6DEA7AA3A41404450357A350D5DC09F03CB11323C4140BCAFCA85CA125DC054707841444441403B55BE67241C5DC00000000000404140', 5825, '2501N');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000090000004450357A350D5DC09F03CB11323C4140B2D826158D045DC0BBD6DEA7AA3A4140D7A3703D0AFF5CC073F56393FC2A414049BDA772DAFC5CC0EE0912DBDD1D41408EE6C8CA2F125DC0EE0912DBDD1D4140B58D3F51D9155DC09A999999992941408C31B08EE3105DC09A9999999929414074CE4F711C135DC085EB51B81E3541404450357A350D5DC09F03CB11323C4140', 5830, '2501S');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000070000003B55BE67241C5DC00000000000404140BCAFCA85CA125DC054707841444441404450357A350D5DC09F03CB11323C414074CE4F711C135DC085EB51B81E3541408C31B08EE3105DC09A99999999294140B58D3F51D9155DC09A999999992941403B55BE67241C5DC00000000000404140', 11470, '2501W');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000070000001F85EB51B8D25CC0BBD6DEA7AA8A4040E256410C74CE5CC0000000000080404052B81E85EBC55CC0CDCCCCCCCC6C40408EE6C8CA2FD25CC0CDCCCCCCCC6C40401F85EB51B8D25CC0AC8F87BEBB7B4040C119FCFD62D55CC0BBD6DEA7AA8A40401F85EB51B8D25CC0BBD6DEA7AA8A4040', 5870, '2512');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000010000000B81E85EB51345DC0795C548B88A84140B81E85EB51345DC04529215855954140BD8BF7E3F6335DC038A0A52BD892414060200890A13E5DC0EE0912DBDD8D4140B3B112F3AC4C5DC012F6ED24227241408EE6C8CA2F625DC0B1FCF9B6606B41408EE6C8CA2F625DC087A3AB7477674140C119FCFD62655DC0666666666666414085EB51B81E815DC066666666666641408EE6C8CA2F865DC0952C27A1F46941408EE6C8CA2F865DC012F6ED242282414028806264C95B5DC0B6696CAF05BB414028806264C95B5DC0D7A02FBDFDA141401A187959133B5DC0D7A02FBDFDA141401A187959133B5DC0795C548B88A84140B81E85EB51345DC0795C548B88A84140', 6140, '2515');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000009000000A54C6A68032D5EC0C03DCF9F36804140D15D126745235EC03333333333734140C7629B5434225EC0BBD6DEA7AA6A41406AF7AB00DF1C5EC012F6ED24226241409D2ADF3312205EC09A99999999594140B9FAB1497E215EC090BFB4A84F5241406AF7AB00DF245EC09A99999999594140DC10E335AF2A5EC09A99999999594140A54C6A68032D5EC0C03DCF9F36804140', 5875, '2516');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000007000000DC10E335AF2A5EC09A999999995941406AF7AB00DF245EC09A99999999594140B9FAB1497E215EC090BFB4A84F524140C7629B5434225EC0BBD6DEA7AA4A41406AF7AB00DF1C5EC04529215855354140A4703D0AD71F5EC06E88F19A57334140DC10E335AF2A5EC09A99999999594140', 5880, '2517');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000008000000FAB9A1293BC85DC087A3AB74770F4140E256410C74C65DC062F9F36DC10E4140BD8BF7E3F6C35DC0213D450E11094140B3B112F3ACC45DC0CDCCCCCCCC04414052B81E85EBCD5DC0AC8F87BEBB0B41407CF0DAA50DCC5DC04F0306499F0C4140E99C9FE238CA5DC0556D37C1370F4140FAB9A1293BC85DC087A3AB74770F4140', 5885, '2519');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000007000000A0DD21C580C75DC02AD0DD640AEF4040A0DD21C580C75DC05A72CBFDC4D34040AB6A93D4D3F25DC0532C6D27000041403A52222EA5E75DC0532C6D27000041402039E345F0D95DC072B15879B806414024A58FAFF3C65DC0865FA05A33F34040A0DD21C580C75DC02AD0DD640AEF4040', 31128, '289W');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000500000017CEDA12DED95CC01AF44AFECC4C45400966F10728ED5CC01AF44AFECC4C45400966F10728ED5CC02DA3474211714540E22D4613DED95CC02DA347421171454017CEDA12DED95CC01AF44AFECC4C4540', 25063, '3202 HIGH');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000005000000C43A1B13DED95CC01AF44AFECC4C45400966F10728ED5CC01AF44AFECC4C45400966F10728ED5CC02DA3474211714540E22D4613DED95CC02DA3474211714540C43A1B13DED95CC01AF44AFECC4C4540', 24878, '3202 LOW');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000B0000000238AC5F9FE055C05F3EFE77E953424099897D5DE1DE55C0BE1589096A534240F95F538C98DE55C0C1131F44D753424054F0CAE48ADE55C0FB1F60ADDA50424099897D5DE1DE55C06286C613414F42406631B1F938E255C01AA54BFF924F4240D8929F9E88E455C0EAB9E067B74F4240D8929F9E88E455C0D50B99863C53424086DA80199DE255C0D50B99863C534240806F891263E155C0A5202EEF605342400238AC5F9FE055C05F3EFE77E9534240', 2570, '3701A');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000060000004E379A6DB80657C0D70AE42373D34240816ACDA0EB0957C0227DA4D299D14240816ACDA0EB0957C0145FED28CEDB4240D869FF5E650757C076340EF5BBDB424073277DC6AA0657C00D86DFF2FDD942404E379A6DB80657C0D70AE42373D34240', 4755, '4501B');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000060000007260A4DD89C75CC001704793666642407C005A0C41D35CC07A85AA3D11514240F129A50C41D35CC02485897144A44240A5A52C22CECB5CC02485897144A442405A0FC25085C75CC0FF02E6C6999942407260A4DD89C75CC00170479366664240', 5920, '4806E');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000A000000F129A50C41D35CC07818497144A4424026CA390C41D35CC0168CA5A377374240E3546B6196D85CC0168CA5A37737424003D9A15085E75CC049BFD8D6AA4A4240ADB4D66196F85CC049BFD8D6AA4A4240E0E70995C9FB5CC008B76BF8CC4C4240AB477595C9FB5CC09D7642F9CC8C42407A81A32E63E55CC09D7642F9CC8C42407A81A32E63E55CC07818497144A44240F129A50C41D35CC07818497144A44240', 5925, '4806W');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000001C00000075A7E095C90B5DC045E5153E11F1424075A7E095C90B5DC06A430FC699D942407814426296F85CC0FF02E6C699D942407814426296F85CC03710DC9266C64240BB89100D41F35CC03710DC9266C64240BB89100D41F35CC0BEFA78E8BBBB42408856DDD90D005DC0BEFA78E8BBBB42408856DDD90D005DC02461DF4E22A24240AB477595C90B5DC02461DF4E22A2424075A7E095C90B5DC049BFD8D6AAAA4240DC0D47FC2F125DC0B0253F3D11B142409898785185175DC0B0253F3D11B142401F8315A7DA1C5DC09D7642F9CCAC42402FC5B01E52245DC09D7642F9CCAC4240323212EB1E215DC08FA1084E22A242405523AAA6DA1C5DC0B0253F3D119142405523AAA6DA1C5DC0C2D43B815575424075A7E095C9235DC0C2D43B815575424075A7E095C9235DC008B76BF8CC6C4240E9E280A7DA445DC0F6076FB488B8424063D34A2110465DC03710DC9266C6424063D34A2110465DC0B0253F3D11F14240608B8285B83A5DC0B0253F3D11F14240608B8285B83A5DC0E358727044E44240C95E4AB8EB2D5DC03710DC9266C6424075A7E095C91B5DC03710DC9266C6424040074C96C91B5DC045E5153E11F1424075A7E095C90B5DC045E5153E11F14240', 5930, '4807A');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000008000000AB477595C90B5DC02461DF4E22A24240323212EB1E215DC08FA1084E22A242402FC5B01E52245DC09D7642F9CCAC42401F8315A7DA1C5DC09D7642F9CCAC42409898785185175DC0B0253F3D11B14240DC0D47FC2F125DC0B0253F3D11B1424075A7E095C90B5DC049BFD8D6AAAA4240AB477595C90B5DC02461DF4E22A24240', 5935, '4807B');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000F000000AB477595C9FB5CC09D7642F9CC8C4240E0E70995C9FB5CC0168CA5A377574240AB477595C90F5DC0168CA5A3775742406565451E521C5DC08FA1084E226242406565451E521C5DC008B76BF8CC6C424075A7E095C9235DC008B76BF8CC6C424075A7E095C9235DC0C2D43B81557542405523AAA6DA1C5DC0C2D43B81557542405523AAA6DA1C5DC0B0253F3D11914240323212EB1E215DC08FA1084E22A242408856DDD90D005DC02461DF4E22A242408856DDD90D005DC0BEFA78E8BBBB424044E10E2F63E55CC0BEFA78E8BBBB42407A81A32E63E55CC09D7642F9CC8C4240AB477595C9FB5CC09D7642F9CC8C4240', 5940, '4808N');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000600000075A7E095C91B5DC03710DC9266C64240C95E4AB8EB2D5DC03710DC9266C64240608B8285B83A5DC0E358727044E44240608B8285B83A5DC0B0253F3D11F1424040074C96C91B5DC045E5153E11F1424075A7E095C91B5DC03710DC9266C64240', 5950, '4809');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000A000000AC04E67C0C9150C0C2418C214AFF3140573BED9D4F9250C058B730C15FFC31408E111EA7479550C0D7EFD302C5033240466791D41F9450C072F508DA89073240E3DA1686049450C006FF113C740A3240F0C29450139350C013B12DA8140E3240C766058E1D9250C0D9A4EC3E1111324040B3B9A4898F50C026CD7A8C4D0C3240E23601233B9050C07D152A49E8043240AC04E67C0C9150C0C2418C214AFF3140', 3475, '7103A');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000900000040C5AB8B5F9050C0A5283C0DBDFA3140BAB57505959150C0FF33942419F9314036A527F2C59250C05FC7C90E3BFB3140573BED9D4F9250C00591FB0C5EFC3140AC04E67C0C9150C09D39DA2736FF3140E23601233B9050C0CC8A975DE604324040B3B9A4898F50C03267C7574C0C32401B55FAC78A8E50C0983446EBA80A324040C5AB8B5F9050C05F0CE544BBFA3140', 3480, '7103B');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000005000000573BED9D4F9250C058B730C15FFC314036A527F2C59250C02E0FE37F3CFB314029CF9B0E8D9450C08F60996D5DFE314073AFFE95369450C057BA71416C013240573BED9D4F9250C058B730C15FFC3140', 3485, '7103C');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000050000004D7FBC78FB9F52C07BE5304E32644240D9557178FB9F52C01BC8693E9D964140C4EFE00600E052C021A7542EF9F441408F4F4C0700E052C02A37514B73684240C1A80779FB9F52C07BE5304E32644240', 6610, '72A');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000007000000CC13BEADAA2A52C089BDAB79E98B41408D4061F5AC6452C0B6F3FDD4783E41405E8B2F3D8E6B52C0551D28A6C146414011996678FB9F52C01BC8693E9D9641404D7FBC78FB9F52C07BE5304E326442400DF8E393A12A52C0581932C3EB594240CC13BEADAA2A52C089BDAB79E98B4140', 6615, '72B');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000016000000A39410ACAA8A5FC0EE0912DBDD9D4540A39410ACAA5A5FC000000000002045405D6BEF5355555FC04529215855154540A39410ACAA2A5FC04529215855154540C1148A19862D5FC08C84B69C4B2B45407805476E72325FC0E860A2E65039454002A5FCFF932E5FC063FD5536624945405D83633B04375FC04D5997642E524540419138752F3A5FC0E6C9DA4BBF634540E35E4F2A50365FC06531564046754540AF3374A2932E5FC0209FEB562A834540F1982611862D5FC0032C4DA5FA8E4540557E63192C2D5FC0D363004D2996454066D01ACD5B2A5FC009B254CD629F4540F9D115116A2B5FC0B08ADC781CA94540FF8C1C339A285FC0C5CA68E4F3B84540E7BC10BCEB215FC0DEFF6C50A0C1454029F27FA20D1E5FC02294522BA7DF4540B2E19F08981B5FC005A96FF48CFC4540909E228788185FC09A999999991946407061DD7877475FC0CDCCCCCCCCEC4540A39410ACAA8A5FC0EE0912DBDD9D4540', 24912, '93 NORTH BEND NORTH');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000100000005D6BEF5355555FC04529215855154540A39410ACAA2A5FC04529215855154540B772405C83285FC085F6A056870E454080C1C99129285FC0C4AB51B417074540A0CD6042BB245FC0C031152C1FFC4440B05F668E1B275FC030B88BD58BF744404743215DC7285FC0FFCAEFD9DFF04440E33785950A295FC0C80BE9F010EA4440E4F967612A285FC098851B9540E34440996D5D20F7255FC0E883656CE8DB44400531D0B52F225FC07D4BEFD1D1D444406243DC4191195FC09F443AF2F6CA44408D672B8A32175FC06C8F83B7ACBD4440A39410ACAA1A5FC04529215855B544407061DD7877275FC04529215855B544405D6BEF5355555FC04529215855154540', 25140, '93 NORTH BEND SOUTH');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000015000000D6B9B3C068B055C0E0A0BDFA78B63E40F4F5211400B055C0F296AB1F9B883F4017E7B9CFBBBB55C0A3B9049612803F40F288C04733D355C0B18E3E41BD6A3F40BCE82B4833F355C06C651DE967D53E4053156415000056C083EEDCC545B33E40502ED7EC12FB55C0ED4ACB48BDA53E407F9F1628CEF955C0BC181417918C3E40EDAEFDAE990156C04B9AF5189B383E40A87922E3ACF855C08FC2F5285C3B3E40152C1F93D6E855C057FF31BE79413E408FB0034246D655C0765E190A8E4F3E40CBDCD7DC2CD055C0BCAD9921FA503E40EE6591DC50CD55C0D5A6FB4A31453E404A1AED02EFB655C0C53FC7A244543E404A1AED02EFB655C0CD6152D735613E405DC9E94633B355C0FC709010E5673E402CBF677F7BB755C067FE87AA4E713E40C405459847BA55C09AD99DA4AF7A3E406D0B85BEAABA55C046E40522D5A53E40D6B9B3C068B055C010255AF278B63E40', 14118, 'A292');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000050000002EE7525C55CC59C0598B4F01308248405648F949B5E558C0598B4F01308248404CA60A4625C158C009168733BFFE46409E077767EDCA59C09B20EA3E003D47402EE7525C55CC59C0598B4F0130824840', 31295, 'A3 ORBIT');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000A0000005648F949B5E558C0598B4F0130824840FDBCA948850758C0598B4F0130824840E44EE960FDE957C0A4C7EF6DFA37484051F701486DF257C034D769A4A5CE4740F41ABB44F5E257C0AEB6627FD95D4740E44EE960FD4358C0BBB88D06F03E47400CB08F4E5D6B58C0EC12D55B03F34640B875374F758058C07B319413EDF646404CA60A4625C158C009168733BFFE46405648F949B5E558C0598B4F0130824840', 31296, 'A4 ORBIT');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000008000000FDBCA948850758C0598B4F01308248404DD6A887686457C0598B4F01308248404DD6A887686457C0382D78D1575047404BCD1E6805C457C0382D78D157504740F41ABB44F5E257C0AEB6627FD95D474051F701486DF257C034D769A4A5CE4740E44EE960FDE957C0A4C7EF6DFA374840FDBCA948850758C0598B4F0130824840', 31297, 'A5 ORBIT');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000F000000A626C11B52C45CC0D162844B22C24040FC4A8C0A41BB5CC05C27E43911A14040992CEE3F32BC5CC02BF3FBA3149640408F30B19E7FBC5CC0F6C07DD3AA924040AFD980BEE3C45CC09159620A7BA44040BEF73768AFCA5CC020D3DA34B6B04040614491A4DACC5CC0FB07910C39AE4040A4B95F4F85CF5CC05C27E43911B140401DCFC2F92FD25CC06AFC1DE5BBB34040A4B95F4F85CF5CC08639419B1CB740401B62612D63D55CC029F4B006DEBD40404E95946096DC5CC0F6C07DD3AAC24040E72E2EFA2FE25CC0B0DE4D5C33C3404052DCA79924E45CC040EAC083B0C54040A626C11B52C45CC0D162844B22C24040', 5985, 'ABEL NORTH MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000005000000CE5E6C109CCB5CC08285DDC199794040614491A4DADC5CC0A20914B1887840409D05EB492AE35CC029F4B006DEAD4040307EBF3D74C65CC03CA3AD4A22824040CE5E6C109CCB5CC08285DDC199794040', 5990, 'ABEL SOUTH MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000D000000A514747B491B59C0C66D3480B700404066DAFE95951A59C0022B8716D90A40406440F67AF72159C0689604A8A935404065FCFB8C0B1D59C0E36BCF2C09584040B77A4E7ADF0C59C055302AA9137C40402ECA6C9049EE58C09D8026C2868F4040E4310395F1CD58C04AD235936F7E4040A6F27684D3BE58C07172BF435160404096218E7571B758C0A1D634EF38394040C74B378941BA58C0BABDA4315A174040F697DD9387BF58C0D21DC4CE140640400E4FAF9465F058C086AC6EF59CAC3F40A514747B491B59C0C66D3480B7004040', 25400, 'ABILENE');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000005000000B5E0455F41345AC046425BCEA5784040FFE7305F5E265AC0A1BE654E97694040C68A1A4CC32A5AC05C1B2AC6F92B4040C139234A7B455AC086032159C0484040B5E0455F41345AC046425BCEA5784040', 25404, 'ABQ-4');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000050000000282397AFCE45BC078EE3D5C72B84040CB4A9352D0A75BC078EE3D5C72B84040CB4A9352D0A75BC0AA656B7D918040400282397AFCE45BC0AA656B7D918040400282397AFCE45BC078EE3D5C72B84040', 25405, 'ABQ-5');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000B000000ECDD1FEF55975DC0DFA63FFB91F64740901FE0FF7D915DC030BABC395CE347407ABE0B007A4A5DC08E89DEF30D0948407C6308000EA85CC0C7EB66EB85274840FDB50600D8A25BC099B27856773D4840EF8D2100B8FF5AC099B27856773D484051A04FE449005BC0825660C8EA56484065E42CEC69A35BC0AE0D15E3FC554840861BF0F961AA5CC03B3602F1BA3E48407AE40F069E4F5DC020D26F5F071E4840ECDD1FEF55975DC0DFA63FFB91F64740', 24199, 'AR9(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000A0000007061DD7877375BC0213D450E11114540996AC1E6F7375BC0C2B92B60A7024540719AF4ADC5A65AC0B3356CA521024540DF8B2FDAE35B5AC05775FB5179FE444064833B069A0F5AC0D436B4B74AFA44400E3AD7E6354759C01A266431FB4445409A999999994959C033333333335345400000000000105AC0BBD6DEA7AA0A45406666666666A65AC0213D450E111145407061DD7877375BC0213D450E11114540', 23932, 'AR11(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000A0000007061DD7877375BC0213D450E11114540996AC1E6F7375BC0C2B92B60A7024540719AF4ADC5A65AC0B3356CA521024540DF8B2FDAE35B5AC05775FB5179FE444064833B069A0F5AC0D436B4B74AFA44400E3AD7E6354759C01A266431FB4445409A999999994959C033333333335345400000000000105AC0BBD6DEA7AA0A45406666666666A65AC0213D450E111145407061DD7877375BC0213D450E11114540', 23933, 'AR11(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000007000000200C3CF71E2A5BC0A31EA2D11D2C4740F8C610009C2A5BC03C4F3C670B164740ED061BE86B4C5AC0EFA364839600474077F86BB2467259C0C1B80A1813AD4640BF9A0304736E59C03FC6DCB584C04640C780ECF5EE4B5AC0F4893C49BA164740200C3CF71E2A5BC0A31EA2D11D2C4740', 23953, 'AR12H(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000007000000200C3CF71E2A5BC0A31EA2D11D2C4740F8C610009C2A5BC03C4F3C670B164740ED061BE86B4C5AC0EFA364839600474077F86BB2467259C0C1B80A1813AD4640BF9A0304736E59C03FC6DCB584C04640C780ECF5EE4B5AC0F4893C49BA164740200C3CF71E2A5BC0A31EA2D11D2C4740', 23954, 'AR12H(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000009000000A39410ACAA2A5BC0BBD6DEA7AA2A4740732A1900AA2B5BC0C6DB4AAFCD1E47409858CFFFE14E5AC08208CC9E5F09474097B3D2FFCD7259C04B88033285B1464000000000007059C00000000000C046400000000000005AC087A3AB7477F74640CDCCCCCCCC4C5AC045292158551547400000000000905AC0AC8F87BEBB1B4740A39410ACAA2A5BC0BBD6DEA7AA2A4740', 23955, 'AR12L(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000009000000A39410ACAA2A5BC0BBD6DEA7AA2A4740732A1900AA2B5BC0C6DB4AAFCD1E47409858CFFFE14E5AC08208CC9E5F09474097B3D2FFCD7259C04B88033285B1464000000000007059C00000000000C046400000000000005AC087A3AB7477F74640CDCCCCCCCC4C5AC045292158551547400000000000905AC0AC8F87BEBB1B4740A39410ACAA2A5BC0BBD6DEA7AA2A4740', 23956, 'AR12L(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000007000000CF2C095053035AC0331B64929157414017EFC7ED97025AC01EBC1BB0504441404D6E6F12DE8059C0C72DE6E7864941408485EEED718458C06C45F69C4F0E4140F33CB83B6B8358C0518369183E224140B6DB2E34D77F59C061A6ED5F595D4140CF2C095053035AC0331B649291574140', 23957, 'AR13(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000007000000CF2C095053035AC0331B64929157414017EFC7ED97025AC01EBC1BB0504441404D6E6F12DE8059C0C72DE6E7864941408485EEED718458C06C45F69C4F0E4140F33CB83B6B8358C0518369183E224140B6DB2E34D77F59C061A6ED5F595D4140CF2C095053035AC0331B649291574140', 23958, 'AR13(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000800000009FB761211B159C0213D450E11D145400E51E0F8B5B759C037E4FAD236C64540553A0E724D3A59C08A54BDA195F54440EC432800901A59C03C7CE3B55C9F4340E256410C740E59C0F8C610001CA14340BC749318042E59C0FE47A643A7FD444000000000005059C0452921585535454009FB761211B159C0213D450E11D14540', 23967, 'AR17(N)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000800000009FB761211B159C0213D450E11D145400E51E0F8B5B759C037E4FAD236C64540553A0E724D3A59C08A54BDA195F54440EC432800901A59C03C7CE3B55C9F4340E256410C740E59C0F8C610001CA14340BC749318042E59C0FE47A643A7FD444000000000005059C0452921585535454009FB761211B159C0213D450E11D14540', 23968, 'AR17(S)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000400000014AE47E17AE050C006F4C29D0B794540E17A14AE478550C0855E7F129FE945400FBA84436FB34FC08BDF14562A764640CF84268925074EC0E4326E6AA0134740', 23974, 'AR20(NE)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000040000004A99D4D006F24CC04CAAB69BE0714740CF84268925074EC0E4326E6AA01347400FBA84436FB34FC08BDF14562A764640E17A14AE478550C0855E7F129FE94540', 23975, 'AR20(SW)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000008000000909E228788E858C087A3AB7477B743405D6BEF5355FD58C0DFC2BAF1EE8E4440C4D155BABB0B59C09A999999991945407061DD78778759C0CDCCCCCCCCEC4540E30632F17D9159C014EB54F99EDD454030B88BD50B1759C079ECC26A870B45408A0BF615DAF658C04FC0C0BD7CB34340909E228788E858C087A3AB7477B74340', 24013, 'AR24(N)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000008000000909E228788E858C087A3AB7477B743405D6BEF5355FD58C0DFC2BAF1EE8E4440C4D155BABB0B59C09A999999991945407061DD78778759C0CDCCCCCCCCEC4540E30632F17D9159C014EB54F99EDD454030B88BD50B1759C079ECC26A870B45408A0BF615DAF658C04FC0C0BD7CB34340909E228788E858C087A3AB7477B74340', 24014, 'AR24(S)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000090000006666666666B651C04529215855554B40E1E7644E3CB251C069B2DA5779414B40E9BF6268502651C0CE418644906C4B40DFA06241866950C0987620A11C9C4B40BBF7CB82E4664EC05A9995928AD54B40CDCCCCCCCC6C4EC0BBD6DEA7AAEA4B40D6C743DFDD6D50C0213D450E11B14B40C4D155BABB2B51C00000000000804B406666666666B651C04529215855554B40', 25080, 'AR62(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000C000000F70489EDEE6E51C0795C548B88884440187CF54C8A6351C0B58993FB1D784440EA33B10A654051C0F176CE609DB74440E9FF0BBAF31D51C079EBFCDB65F144400AFC3CA1B2F850C04919CCBADA2C4540F657D98871D350C046BF6CF1DF674540FAFF82EEDCA750C091E398767BA3454007342262947B50C09BD31BA496DB4540E17A14AE478550C0855E7F129FE945400000000000E050C087A3AB74777745402A38BC20222A51C00000000000004540F70489EDEE6E51C0795C548B88884440', 30504, 'AR80(NE)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000009000000E17A14AE478550C0855E7F129FE945400000000000E050C087A3AB74777745402A38BC20222A51C000000000000045407A17EFC7ED2451C0A703594FADF74440974D25A8060051C0C50DAE6F163345407FE3C6881FDB50C031FB86D3936E454099695611C9AD50C0B08ADC781CA945408BA141AF647F50C05C36DF2D35E34540E17A14AE478550C0855E7F129FE94540', 30547, 'AR80(SW)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000060000005D6BEF5355B556C00000000000003E40F96B0D0030AA56C0505A136635FE3D40EA9E2B00FC9256C08E85329E52FE41400000000000A056C0000000000000424009FB761211B156C08B5242B0AA2A3F405D6BEF5355B556C00000000000003E40', 23911, 'AR101(N)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000060000005D6BEF5355B556C00000000000003E40F96B0D0030AA56C0505A136635FE3D40EA9E2B00FC9256C08E85329E52FE41400000000000A056C0000000000000424009FB761211B156C08B5242B0AA2A3F405D6BEF5355B556C00000000000003E40', 23912, 'AR101(S)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000C0000007061DD7877B756C03333333333B33F40F96B0D00B0C056C0B67B03DDA8A93F406E3B2300EE9156C039F9E3AC3EF33D4014BCD7FFEF7156C07D6363B900073D40F47C170074EE55C078190F00666C39407C6308000ECD55C00FE6C0BC114338405D6BEF5355C555C075ADBD4F555538407061DD7877E755C0A8E0F08288883940D6C743DFDD2D56C00000000000803B40C4D155BABB6B56C06666666666263D40D49CBCC8048B56C048E17A14AE073E407061DD7877B756C03333333333B33F40', 23915, 'AR103');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000C000000A39410ACAA9A57C0BBD6DEA7AA6A40405D6BEF5355F557C09C51F355F25B404000000000006058C000000000000040402A38BC2022E258C025ECDB4944C43F40C4D155BABB5B59C025ECDB4944843F40C4D155BABBDB59C00F4757E9EE6E3F4092C4DCFF91DB59C0FA60191BBA553F4078190F00E65A59C06B69C93E236A3F40898BEDFF2D5F58C0B9AB5791D1E73F4088E6F0FF99F357C00FB16609D751404097B3D2FF4D9A57C0E95212C8DB5E4040A39410ACAA9A57C0BBD6DEA7AA6A4040', 23918, 'AR104M');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000070000000000000000B058C0000000000000454015E5D2F885AC58C0A0B07A76AFEC444097225404931158C0D25DC8D92A1B454027A9A7EA797D57C005C58F31773D454000000000008057C0213D450E115145403C2EAA45441458C0DFC2BAF1EE2E45400000000000B058C00000000000004540', 23919, 'AR105(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000070000000000000000B058C0000000000000454015E5D2F885AC58C0A0B07A76AFEC444097225404931158C0D25DC8D92A1B454027A9A7EA797D57C005C58F31773D454000000000008057C0213D450E115145403C2EAA45441458C0DFC2BAF1EE2E45400000000000B058C00000000000004540', 23920, 'AR105(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000090000000000000000805AC0EE0912DBDD5D4740CE4F711CF8835AC0C21EC99BB2424740F8C610001CD959C023CF3F0B530B4740D0F46D1C8C2D59C01A40AEC387D24640D4916D2A1C9E58C013B875374F9646405307793D989758C05245F12A6BB546409A999999992959C0DFC2BAF1EEEE4640909E228788E859C0DFC2BAF1EE2E47400000000000805AC0EE0912DBDD5D4740', 23921, 'AR106H(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000090000000000000000805AC0EE0912DBDD5D4740CE4F711CF8835AC0C21EC99BB2424740F8C610001CD959C023CF3F0B530B4740D0F46D1C8C2D59C01A40AEC387D24640D4916D2A1C9E58C013B875374F9646405307793D989758C05245F12A6BB546409A999999992959C0DFC2BAF1EEEE4640909E228788E859C0DFC2BAF1EE2E47400000000000805AC0EE0912DBDD5D4740', 23922, 'AR106H(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000090000000000000000805AC0EE0912DBDD5D4740CE4F711CF8835AC0C21EC99BB2424740F8C610001CD959C023CF3F0B530B4740D0F46D1C8C2D59C01A40AEC387D24640D4916D2A1C9E58C013B875374F9646405307793D989758C05245F12A6BB546409A999999992959C0DFC2BAF1EEEE4640909E228788E859C0DFC2BAF1EE2E47400000000000805AC0EE0912DBDD5D4740', 23923, 'AR106L(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000090000000000000000805AC0EE0912DBDD5D4740CE4F711CF8835AC0C21EC99BB2424740F8C610001CD959C023CF3F0B530B4740D0F46D1C8C2D59C01A40AEC387D24640D4916D2A1C9E58C013B875374F9646405307793D989758C05245F12A6BB546409A999999992959C0DFC2BAF1EEEE4640909E228788E859C0DFC2BAF1EE2E47400000000000805AC0EE0912DBDD5D4740', 23924, 'AR106L(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000004000000F70489EDEE6E55C0DFC2BAF1EEEE45405D6BEF53554555C087A3AB74777746402A38BC20223255C03333333333B3464033333333336355C02FDD240681554640', 23925, 'AR107');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000400000000000000006057C00000000000803B407061DD7877E756C00000000000803B4033333333339356C00000000000803B40A39410ACAA1A56C00000000000803B40', 23926, 'AR108(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000009000000A39410ACAA1A56C00000000000803B4033333333339356C00000000000803B407061DD7877E756C00000000000803B4000000000006057C00000000000803B4000000000006057C09A99999999993B407061DD7877E756C09A99999999993B4033333333339356C09A99999999993B40A39410ACAA1A56C09A99999999993B40A39410ACAA1A56C00000000000803B40', 23927, 'AR108(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000090000007061DD78775757C04529215855354740181EA0A0B95B57C0039A63D410274740EC432800101557C0CF17D6E830FC4640A4117D8857CD56C03059260D7FD446400C83E8FF8B4F55C011D3742CA5CB464000000000005055C00000000000E046409A99999999E955C00000000000E04640C4D155BABBCB56C06666666666E646407061DD78775757C04529215855354740', 23928, 'AR109H(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000090000007061DD78775757C04529215855354740181EA0A0B95B57C0039A63D410274740EC432800101557C0CF17D6E830FC4640A4117D8857CD56C03059260D7FD446400C83E8FF8B4F55C011D3742CA5CB464000000000005055C00000000000E046409A99999999E955C00000000000E04640C4D155BABBCB56C06666666666E646407061DD78775757C04529215855354740', 23930, 'AR109L(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000090000007061DD78775757C04529215855354740181EA0A0B95B57C0039A63D410274740EC432800101557C0CF17D6E830FC4640A4117D8857CD56C03059260D7FD446400C83E8FF8B4F55C011D3742CA5CB464000000000005055C00000000000E046409A99999999E955C00000000000E04640C4D155BABBCB56C06666666666E646407061DD78775757C04529215855354740', 23931, 'AR109L(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000090000000000000000605DC0CDCCCCCCCC3C474062670A9DD7645DC05A6F8A7DB8214740F3D71A0060CE5CC049E30632F1F0464007E7F80D38F75BC096A47C5237A04640FB63100EAC655BC01AB9B8D7936246400000000000605BC000000000008046409A99999999F15BC0AC8F87BEBBBB4640A39410ACAACA5CC0CDCCCCCCCC0C47400000000000605DC0CDCCCCCCCC3C4740', 23910, 'AR10(SE)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000A000000A39410ACAA0A57C0000000000020424000000000000757C0DEBBBCEFCE0E42400FCDE1FF33C456C056C7E0174D2C4240E9F92E00688156C0645DDC46034842407FAD0100361D56C02A03626DE76E4240950ED6FFB99955C07BC6191E56654240909E2287889855C087A3AB7477774240D6C743DFDD1D56C000000000008042403C2EAA45448456C09A99999999594240A39410ACAA0A57C00000000000204240', 23936, 'AR111(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000A000000A39410ACAA0A57C0000000000020424000000000000757C0DEBBBCEFCE0E42400FCDE1FF33C456C056C7E0174D2C4240E9F92E00688156C0645DDC46034842407FAD0100361D56C02A03626DE76E4240950ED6FFB99955C07BC6191E56654240909E2287889855C087A3AB7477774240D6C743DFDD1D56C000000000008042403C2EAA45448456C09A99999999594240A39410ACAA0A57C00000000000204240', 23937, 'AR111(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000D000000A39410ACAA1A57C0AC8F87BEBB3B42405D6BEF53559557C0DFC2BAF1EEEE414009FB761211D157C0FA7E6ABC74CB4140A39410ACAA0A58C0AC8F87BEBB9B414000000000005058C0CDCCCCCCCC8C414000000000009058C04529215855754140CFA3E2FF0E8D58C0ED629AE95E60414078190F00E64C58C099751085E076414014BCD7FFEF0658C0AA413D224B874140BC8C0700B3CB57C0D74FFF59F3B44140F8C610001C9057C05BE1A7BBFCDA4140FB100A00C41557C00A53EF0456284240A39410ACAA1A57C0AC8F87BEBB3B4240', 25540, 'AR112H(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000D000000A39410ACAA1A57C0AC8F87BEBB3B42405D6BEF53559557C0DFC2BAF1EEEE414009FB761211D157C0FA7E6ABC74CB4140A39410ACAA0A58C0AC8F87BEBB9B414000000000005058C0CDCCCCCCCC8C414000000000009058C04529215855754140CFA3E2FF0E8D58C0ED629AE95E60414078190F00E64C58C099751085E076414014BCD7FFEF0658C0AA413D224B874140BC8C0700B3CB57C0D74FFF59F3B44140F8C610001C9057C05BE1A7BBFCDA4140FB100A00C41557C00A53EF0456284240A39410ACAA1A57C0AC8F87BEBB3B4240', 25541, 'AR112H(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000005000000A39410ACAA1A57C0AC8F87BEBB3B42405D6BEF53559557C0DFC2BAF1EEEE414009FB761211D157C0BBD6DEA7AACA4140A39410ACAA0A58C0AC8F87BEBB9B414000000000005058C0CDCCCCCCCC8C4140', 25301, 'AR112L(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000900000046B6F3FDD4045AC0295C8FC2F5083F40E9F92E0068055AC0846EE5DB71F53E40FE5A0300EC8159C09103C0C293C73E401661D4FF832659C0EEEC2B0FD2B13E40898BEDFFADCF58C03937B753848D3E404567994528CF58C0404F030649A33E40E4F4F57CCD2559C05C751DAA29C53E40355EBA490C8259C054C90050C5D93E4046B6F3FDD4045AC0295C8FC2F5083F40', 23940, 'AR113(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000900000046B6F3FDD4045AC0295C8FC2F5083F40E9F92E0068055AC0846EE5DB71F53E40FE5A0300EC8159C09103C0C293C73E401661D4FF832659C0EEEC2B0FD2B13E40898BEDFFADCF58C03937B753848D3E404567994528CF58C0404F030649A33E40E4F4F57CCD2559C05C751DAA29C53E40355EBA490C8259C054C90050C5D93E4046B6F3FDD4045AC0295C8FC2F5083F40', 23941, 'AR113(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000090000008C48145AD68259C0691EC022BFB84240EE539FF5BA7D59C0B3A0E69AB89F4240174850FC18FD58C0C383C19030D44240E613C31F0F7B58C017B435C75E08434012DC48D9A2E457C08873C3A519674340F9A23D5E48EA57C0CD3FFA264D7943406ABC7493188058C096438B6CE71B4340A7EA1ED95C0059C0BE9F1A2FDDEC42408C48145AD68259C0691EC022BFB84240', 23944, 'AR116(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000A000000F9A23D5E48EA57C0CD3FFA264D794340827170E9986858C0D505BCCCB02B43406ABC7493188058C096438B6CE71B4340A7EA1ED95C0059C0BE9F1A2FDDEC42408C48145AD68259C0691EC022BFB842401B683EE76E7E59C049B0822914A34240E8233A15BABB58C02D639EF06DEA424001B8A349F37858C059D878550C05434012DC48D9A2E457C0C6111038B7624340F9A23D5E48EA57C0CD3FFA264D794340', 23945, 'AR116(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000008000000168A743FA7BD5AC0795C548B8868414039CA0BFA9CC05AC0201043064D6741400AB4E0EAA5B75AC0468F8422822A4140E1A3B4ED6AB65AC024FE17BE74FF40403333333333B35AC000000000000041408D976E1283B45AC01DE736E15E2B4140B29DEFA7C6BB5AC06ABC7493185C4140168A743FA7BD5AC0795C548B88684140', 23946, 'AR117V');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000070000002A38BC2022A25AC012F6ED24222241409A99999999A15AC0795C548B88084140F70489EDEE9E5AC012F6ED2422C24040909E228788885AC05470784144C44040A39410ACAA8A5AC0BBD6DEA7AA0A41409A99999999A15AC0795C548B880841402A38BC2022A25AC012F6ED2422224140', 24820, 'AR121(N)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000007000000909E228788885AC09A99999999B94040909E228788885AC05470784144C44040A39410ACAA8A5AC0BBD6DEA7AA0A41409A99999999A15AC0795C548B88084140F70489EDEE9E5AC012F6ED2422C24040909E228788885AC05470784144C44040909E228788885AC09A99999999B94040', 24821, 'AR121(S)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000800000098BD6C3B6DE05AC0834D9D47C58141409686D0F789E25AC0FAB48AFED0804140ABBAA2EF49D75AC092E11D85903741404ADAE8F758C85AC0F064DC79871A4140C6FCDCD094C65AC0D5EB1681B11C41401EA9BEF38BD55AC00AD7A3703D3A414038D89B1892DE5AC0452921585575414098BD6C3B6DE05AC0834D9D47C5814140', 23947, 'AR125V(N)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000800000098BD6C3B6DE05AC0834D9D47C58141409686D0F789E25AC0FAB48AFED0804140ABBAA2EF49D75AC092E11D85903741404ADAE8F758C85AC0F064DC79871A4140C6FCDCD094C65AC0D5EB1681B11C41401EA9BEF38BD55AC00AD7A3703D3A414038D89B1892DE5AC0452921585575414098BD6C3B6DE05AC0834D9D47C5814140', 23948, 'AR125V(S)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000003000000CDCCCCCCCC1C5CC054707841446440407061DD7877175CC0D5EB1681B15C4040CDCCCCCCCCDC5BC00AD7A3703D1A4040', 31451, 'AR135V(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000003000000CDCCCCCCCCDC5BC00AD7A3703D1A404061C1FD8007E35BC0B0E595EB6D214040CDCCCCCCCC1C5CC05470784144644040', 31452, 'AR135V(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000003000000145FED28CE8E5BC0B0E595EB6D114040BFEE74E789925BC014AE47E17A1C404076E272BC02B45BC09CC420B072804040', 24962, 'AR136V(N)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000300000076E272BC02B45BC09CC420B072804040C74B378941B05BC06F9F55664A754040145FED28CE8E5BC0B0E595EB6D114040', 24963, 'AR136V(S)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000B0000004260E5D0227359C0E9995E622C1941407444BE4BA99459C01283C0CAA19D4040E3A59BC420045AC081AFE8D66BCE3D4065170CAEB9305AC052B81E85EBD13E40A7EA1ED95CE459C039B4C876BE4F40405FAB4E185E9759C0ADFFCE51A23241402002B3E7579D59C0F6A402DD4D3941409BB1C3F3AD375AC090BA42C472D23E401706D1FF97025AC0C1EA234B41A03D4030B6B52A2E6D59C0E4727275B61441404260E5D0227359C0E9995E622C194140', 31352, 'AR197H');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000B0000004260E5D0227359C0E9995E622C1941407444BE4BA99459C01283C0CAA19D4040E3A59BC420045AC081AFE8D66BCE3D4065170CAEB9305AC052B81E85EBD13E40A7EA1ED95CE459C039B4C876BE4F40405FAB4E185E9759C0ADFFCE51A23241402002B3E7579D59C0F6A402DD4D3941409BB1C3F3AD375AC090BA42C472D23E401706D1FF97025AC0C1EA234B41A03D4030B6B52A2E6D59C0E4727275B61441404260E5D0227359C0E9995E622C194140', 31353, 'AR197L');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000003000000909E228788D85BC0BBD6DEA7AA0A43400000000000605BC0BBD6DEA7AAEA42403333333333C35AC0AC8F87BEBBBB4240', 23977, 'AR201(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000030000003333333333C35AC0AC8F87BEBBBB4240A39410ACAA3A5BC00000000000E04240909E228788D85BC0BBD6DEA7AA0A4340', 23978, 'AR201(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000080000007061DD78777753C0F1B8A81611513E40069BDFD5176B53C0B79D1100774E3E40FC15D79D136953C0191C25AFCE1E4040F389E18FC76953C0790F86F01E2D414011346612F57753C08D0A9C6C032D414066666666667653C012F6ED24222240407061DD78777753C0DB1324B6BB7B3F407061DD78777753C0F1B8A81611513E40', 23979, 'AR202A(N)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000080000007061DD78777753C0F1B8A81611513E40069BDFD5176B53C0B79D1100774E3E40FC15D79D136953C0191C25AFCE1E4040F389E18FC76953C0790F86F01E2D414011346612F57753C08D0A9C6C032D414066666666667653C012F6ED24222240407061DD78777753C0DB1324B6BB7B3F407061DD78777753C0F1B8A81611513E40', 31322, 'AR202A(S)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000070000007061DD78777753C075ADBD4F55153C400740DCD52B6653C0CE740A4D6D123C40F2FB485BA66553C0AD133C2AA329414011346612F57753C08D0A9C6C032D414066666666667653C012F6ED24222240407061DD78777753C00000000000C03D407061DD78777753C075ADBD4F55153C40', 23980, 'AR202(N)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000070000007061DD78777753C075ADBD4F55153C400740DCD52B6653C0CE740A4D6D123C40F2FB485BA66553C0AD133C2AA329414011346612F57753C08D0A9C6C032D414066666666667653C012F6ED24222240407061DD78777753C00000000000C03D407061DD78777753C075ADBD4F55153C40', 23981, 'AR202(S)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000B00000033333333335356C04529215855C54140EDD1C034B14C56C022382EE3A6B0414010D2AE9D836055C08948A8740B5142400EE665039F0155C0F196506628914240F1796A9A9C8654C0D514127A47CB42402A38BC20228A54C0EE0912DBDDDD424066666666660655C06666666666A642407061DD78776755C054707841446442406666666666A655C0AC8F87BEBB3B42403333333333E355C0333333333313424033333333335356C04529215855C54140', 23982, 'AR203(NE)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000B00000033333333335356C04529215855C54140EDD1C034B14C56C022382EE3A6B0414010D2AE9D836055C08948A8740B5142400EE665039F0155C0F196506628914240F1796A9A9C8654C0D514127A47CB42402A38BC20228A54C0EE0912DBDDDD424066666666660655C06666666666A642407061DD78776755C054707841446442406666666666A655C0AC8F87BEBB3B42403333333333E355C0333333333313424033333333335356C04529215855C54140', 23983, 'AR203(SW)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000A000000D6C743DFDD1D51C0BBD6DEA7AA8A47407061DD78776751C000000000000047402A38BC2022A251C0213D450E119146407061DD78770752C0BBD6DEA7AA4A4640CDCCCCCCCC6C52C0DFC2BAF1EEEE454057827B54B26852C0FE929E33B3E24540F6402B30640252C035E5547C8D3F4640B110C248549A51C07AB82E466E864640AC5ED960BC1451C02A4DEF8744824740D6C743DFDD1D51C0BBD6DEA7AA8A4740', 23984, 'AR204(NE)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000A000000D6C743DFDD1D51C0BBD6DEA7AA8A47407061DD78776751C000000000000047402A38BC2022A251C0213D450E119146407061DD78770752C0BBD6DEA7AA4A4640CDCCCCCCCC6C52C0DFC2BAF1EEEE454057827B54B26852C0FE929E33B3E24540F6402B30640252C035E5547C8D3F4640B110C248549A51C07AB82E466E864640AC5ED960BC1451C02A4DEF8744824740D6C743DFDD1D51C0BBD6DEA7AA8A4740', 23985, 'AR204(SW)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000090000000AD7A3703DDA52C07DCC07043A9D45409A999999996953C000000000008045401F85EB51B8FE53C0A69BC420B0524540022B8716D95A54C0EE0912DBDD4D454070E01F00825A54C0DD9156218A3F4540EEE82400A4FC53C0775FDF98AF43454002A5FCFF936753C0331070AD9B6F4540FDB50600D8D852C0C4904193698C45400AD7A3703DDA52C07DCC07043A9D4540', 23987, 'AR206H');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000090000000AD7A3703DDA52C07DCC07043A9D45409A999999996953C000000000008045401F85EB51B8FE53C0A69BC420B0524540022B8716D95A54C0EE0912DBDD4D454070E01F00825A54C0DD9156218A3F4540EEE82400A4FC53C0775FDF98AF43454002A5FCFF936753C0331070AD9B6F4540FDB50600D8D852C0C4904193698C45400AD7A3703DDA52C07DCC07043A9D4540', 23988, 'AR206L');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000007000000A39410ACAA8A54C03333333333F33F40E67393BD4A8254C0ECA17DACE0DB3F40FDBBE3B963A853C0EFBF3A3366E641402A38BC2022B253C048E17A14AEEF41405DDE1CAED51D54C08BF9B9A129FD40402A38BC20224254C06666666666A64040A39410ACAA8A54C03333333333F33F40', 23989, 'AR207NE(NE)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000007000000A39410ACAA8A54C03333333333F33F40E67393BD4A8254C0ECA17DACE0DB3F40FDBBE3B963A853C0EFBF3A3366E641402A38BC2022B253C048E17A14AEEF41405DDE1CAED51D54C08BF9B9A129FD40402A38BC20224254C06666666666A64040A39410ACAA8A54C03333333333F33F40', 23990, 'AR207SW(SW)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000A000000A39410ACAAD25FC0C3F5285C8F423E400E5D9A6CCDCC5FC04FECFC361F143E400A6D9450559A5EC0430BBF8A422F3F40EB0896D956535EC0C0643E7B89663F400BD12170A40B5EC04E33935E8ACD3F4001DC2C5E2C115EC0F1B8A81611F13F4009FB761211595EC00F4757E9EE8E3F405BB39597FCE25EC062F6B2EDB4213F40C4D155BABB5B5FC03333333333B33E40A39410ACAAD25FC0C3F5285C8F423E40', 23992, 'AR209(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000A000000A39410ACAAD25FC0C3F5285C8F423E400E5D9A6CCDCC5FC04FECFC361F143E400A6D9450559A5EC0430BBF8A422F3F40EB0896D956535EC0C0643E7B89663F400BD12170A40B5EC04E33935E8ACD3F4001DC2C5E2C115EC0F1B8A81611F13F4009FB761211595EC00F4757E9EE8E3F405BB39597FCE25EC062F6B2EDB4213F40C4D155BABB5B5FC03333333333B33E40A39410ACAAD25FC0C3F5285C8F423E40', 23993, 'AR209(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000A000000CDCCCCCCCC6C52C0DFC2BAF1EEEE45400321FE06926552C00A7D55D39ADC45401981C2EA590052C02D55B31886374640F15C29159E9751C0300E2E1D73834640F4705D8C5C1151C04A11740F647F4740D6C743DFDD1D51C0BBD6DEA7AA8A47407061DD78776751C000000000000047402A38BC2022A251C0213D450E119146407061DD78770752C0BBD6DEA7AA4A4640CDCCCCCCCC6C52C0DFC2BAF1EEEE4540', 23996, 'AR212(NE)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000A000000D6C743DFDD1D51C0BBD6DEA7AA8A47407061DD78776751C000000000000047402A38BC2022A251C0213D450E119146407061DD78770752C0BBD6DEA7AA4A4640F70489EDEE5E52C0AC8F87BEBBFB45406E3B2300EE5952C0D897118365F045400839EFFF630252C0B8E0B1440C3E4640901FE0FF7D9D51C0BA9EE8BAF084464014BCD7FF6F1551C0BEE02E562F844740D6C743DFDD1D51C0BBD6DEA7AA8A4740', 23997, 'AR212(SW)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000B0000002A38BC20228255C0DFC2BAF1EEAE404007342262147955C0AFA2F5A6D8994040077C7E18A13C55C09D83674293054140E81780A1A2F554C020AD7B759FA841400CC457E0D0D854C0E9DD0EC3FDD241401690ACB2A56754C0410B09185D424240CDCCCCCCCC6C54C0213D450E115142400000000000E054C05470784144E4414009FB7612110155C09A99999999B941405915E126A34755C0CDCCCCCCCC1441402A38BC20228255C0DFC2BAF1EEAE4040', 23999, 'AR216(NE)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000B000000CDCCCCCCCC6C54C0213D450E115142400000000000E054C05470784144E4414009FB7612110155C09A99999999B941405915E126A34755C0CDCCCCCCCC1441402A38BC20228255C0DFC2BAF1EEAE4040FFA72C54C87955C0B8FBC165BA9F4040F56393FC083E55C0B043EB973E03414004143477BEF754C0D118F730C5A94140033862D284D954C027DE019EB4D04140F20703CF3D6654C0562F1A8DD73D4240CDCCCCCCCC6C54C0213D450E11514240', 24000, 'AR216(SW)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000800000033333333339353C0795C548B884844409A99999999F953C0CDCCCCCCCC4C444045DAC69FA85B54C0FC1C1F2DCE5E444028806264C9DF54C05C8FC2F5287C44409A99999999D154C040C23060C9DF444055320054714A54C01904560E2DC24440F70489EDEEF653C0213D450E11B14440684293C492B753C085EB51B81EA54440', 24004, 'AR220');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000060000009A99999999A15CC04529215855554240F365587B0EA05CC07B8A77DBE0524240A63E350381805CC0D2037A3C888C42402A38BC2022825CC0DFC2BAF1EE8E42403C2EAA45449C5CC087A3AB74775F42409A99999999A15CC04529215855554240', 12600, 'AR230V');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000009000000E9D7D64FFF1656C060E5D022DBB93E4009FB7612119156C0DB1324B6BBFB3E403333333333E356C08B5242B0AA2A3F40F2D24D62102057C062F6B2EDB4413F4044C02154A92057C087962B723E293F406E122807D8E356C0E05BA2C4F8123F4069E1B20A1B9256C058CA8D7D24E23E40C59A8015961756C028113C19779E3E40E9D7D64FFF1656C060E5D022DBB93E40', 31709, 'AR302A(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000009000000E9D7D64FFF1656C060E5D022DBB93E4009FB7612119156C0DB1324B6BBFB3E403333333333E356C08B5242B0AA2A3F40F2D24D62102057C062F6B2EDB4413F40732A1900AA2057C0873C388E0E2E3F40901FE0FF7DE356C0595D3DDD2F173F40950ED6FF399156C09E5DBEF561E93E4072851C00961756C0740CC85EEFA63E40E9D7D64FFF1656C060E5D022DBB93E40', 31712, 'AR302C(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000009000000E9D7D64FFF1656C060E5D022DBB93E4009FB7612119156C0DB1324B6BBFB3E403333333333E356C08B5242B0AA2A3F40F2D24D62102057C062F6B2EDB4413F40732A1900AA2057C0873C388E0E2E3F40901FE0FF7DE356C0595D3DDD2F173F40950ED6FF399156C09E5DBEF561E93E4072851C00961756C0740CC85EEFA63E40E9D7D64FFF1656C060E5D022DBB93E40', 31713, 'AR302C(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000090000003CBD529621545EC0605969520A8E464047382D78D1FF5CC0AA605452277C464047382D78D1FF5CC0B5A679C7293246403CBD529621545EC089D2DEE00B1F46407C6308008E535EC0383B08F0CC144640E5AF3500C0F55CC0981359106F264640F47C170074F65CC07AB82E466E8646408B30EAFF41545EC0F829D890C99846403CBD529621545EC0605969520A8E4640', 24340, 'AR307C(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000005000000D595CFF23C4A5BC09FB0C403CA4E4140D595CFF23C4A5BC065FB90B75C3D4140DA2736D5C9515AC065FB90B75C3D4140DA2736D5C9515AC09FB0C403CA4E4140D595CFF23C4A5BC09FB0C403CA4E4140', 24031, 'AR310(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000005000000D595CFF23C4A5BC09FB0C403CA4E4140D595CFF23C4A5BC065FB90B75C3D4140DA2736D5C9515AC065FB90B75C3D4140DA2736D5C9515AC09FB0C403CA4E4140D595CFF23C4A5BC09FB0C403CA4E4140', 24032, 'AR310(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000800000001DC2C5E2C215AC048E17A14AEF74240F0B61CF9CD265AC0D20AC2CBC2ED4240FA111A1C809359C07872970EE7284240F4A62215462859C08D24E6FE8FCF41403C2EAA45442459C035EB8CEF8BDD41408E739B70AF6D59C09A99999999194240909E2287889059C0EE0912DBDD35424001DC2C5E2C215AC048E17A14AEF74240', 31604, 'AR312H(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000800000001DC2C5E2C215AC048E17A14AEF74240F0B61CF9CD265AC0D20AC2CBC2ED4240FA111A1C809359C07872970EE7284240F4A62215462859C08D24E6FE8FCF41403C2EAA45442459C035EB8CEF8BDD41408E739B70AF6D59C09A99999999194240909E2287889059C0EE0912DBDD35424001DC2C5E2C215AC048E17A14AEF74240', 31605, 'AR312H(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000800000001DC2C5E2C215AC048E17A14AEF74240F0B61CF9CD265AC0D20AC2CBC2ED4240FA111A1C809359C07872970EE7284240F4A62215462859C08D24E6FE8FCF41403C2EAA45442459C035EB8CEF8BDD41408E739B70AF6D59C09A99999999194240909E2287889059C0EE0912DBDD35424001DC2C5E2C215AC048E17A14AEF74240', 31606, 'AR312L(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000800000001DC2C5E2C215AC048E17A14AEF74240F0B61CF9CD265AC0D20AC2CBC2ED4240FA111A1C809359C07872970EE7284240F4A62215462859C08D24E6FE8FCF41403C2EAA45442459C035EB8CEF8BDD41408E739B70AF6D59C09A99999999194240909E2287889059C0EE0912DBDD35424001DC2C5E2C215AC048E17A14AEF74240', 31607, 'AR312L(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000800000033333333330358C033333333335342403836960B700F58C0F993426A24494240193BE12538BF57C08770276C9A3041408B0AE6F91D7057C0D30C4EE9051D404033333333336357C0795C548B8828404053944BE3179B57C0295C8FC2F5E84040840F255AF2CB57C0A2B8E34D7E91414033333333330358C03333333333534240', 24035, 'AR313(N)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000800000033333333330358C033333333335342403836960B700F58C0F993426A24494240193BE12538BF57C08770276C9A3041408B0AE6F91D7057C0D30C4EE9051D404033333333336357C0795C548B8828404053944BE3179B57C0295C8FC2F5E84040840F255AF2CB57C0A2B8E34D7E91414033333333330358C03333333333534240', 24036, 'AR313(S)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000009000000C3F5285C8F3A57C0F1B8A81611313F40A4703D0AD77357C0ACA92C0ABB62404053944BE3179B57C0295C8FC2F5E84040840F255AF2CB57C0A2B8E34D7E91414033333333330358C03333333333534240A98F7692E31258C0645DDC46034842409AFFA1AAD3AA57C0862B56C334D940405F9E29CF174957C041102043C7143F40C3F5285C8F3A57C0F1B8A81611313F40', 24037, 'AR313A(N)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000009000000C3F5285C8F3A57C0F1B8A81611313F40A4703D0AD77357C0ACA92C0ABB62404053944BE3179B57C0295C8FC2F5E84040840F255AF2CB57C0A2B8E34D7E91414033333333330358C03333333333534240A98F7692E31258C0645DDC46034842409AFFA1AAD3AA57C0862B56C334D940405F9E29CF174957C041102043C7143F40C3F5285C8F3A57C0F1B8A81611313F40', 24038, 'AR313A(S)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000A0000005D6BEF5355B55AC0000000000000424003339534B5B15AC0408E41823DED4140E754320054375AC0B8AE9811DE2C42401271CEE38B5A59C0D62EB7C546D5414011A7936C755859C09EEFA7C64BE741407061DD78777759C04529215855F541407061DD7877B759C0DFC2BAF1EE0E42407061DD7877F759C0795C548B882842402B8716D9CE375AC00839EFFFE33E42405D6BEF5355B55AC00000000000004240', 24039, 'AR314(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000A0000005D6BEF5355B55AC0000000000000424003339534B5B15AC0408E41823DED4140E754320054375AC0B8AE9811DE2C42401271CEE38B5A59C0D62EB7C546D5414011A7936C755859C09EEFA7C64BE741407061DD78777759C04529215855F541407061DD7877B759C0DFC2BAF1EE0E42407061DD7877F759C0795C548B882842402B8716D9CE375AC00839EFFFE33E42405D6BEF5355B55AC00000000000004240', 24040, 'AR314(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000800000057EA5910CAF055C01766A19DD3F64240FF06EDD5C7F455C07E891D328AE14240F3DDF7B96B0655C0B6204A6A576E4240F2C693EEF88054C047109D54EA8E424033333333338354C0213D450E11A14240D7A3703D0A0755C03927F6D03E8442409A999999998955C05470784144C4424057EA5910CAF055C01766A19DD3F64240', 24041, 'AR315(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000800000057EA5910CAF055C01766A19DD3F64240FF06EDD5C7F455C07E891D328AE14240F3DDF7B96B0655C0B6204A6A576E4240F2C693EEF88054C047109D54EA8E424033333333338354C0213D450E11A14240D7A3703D0A0755C03927F6D03E8442409A999999998955C05470784144C4424057EA5910CAF055C01766A19DD3F64240', 24042, 'AR315(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000A00000000000000007055C066666666660646406666666666F655C0EE0912DBDD3D46409FCBD424780C56C0C26856B60F474640D6C743DFDD5956C0EAB303AE2B8846402A38BC20226256C0795C548B88684640F96B0D00B00C56C052B3ACA00E414640F621140008D355C001738813F3284640002A0B15529855C06A78C432471246407ADC5CA1349655C0D6C4025FD116464000000000007055C06666666666064640', 24045, 'AR321');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000090000009DA04D0E9F2D54C01FF818AC388B424089AF1B5BF42E54C046008118328F424067EF8CB6AAAA54C01484E1123643424081936DE08EA854C0D0D61C7B5139424099EC44EE0E4E54C0C092AB58FC5F4240F70489EDEE4E54C066666666666642409A99999999A954C0EE0912DBDD3D4240909E2287887854C0AC8F87BEBB5B42409DA04D0E9F2D54C01FF818AC388B4240', 24047, 'AR328');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000008000000D8F2CAF5B61859C0D122DBF97EB2424078190F00661759C092617028D7A042400C83E8FF0B6358C0D514127A47CB4240FB100A00C49C57C0D474875E900F4340AF230ED9409F57C0894160E5D0224340D65416855D6558C096D05D1267DF4240CFF753E3A5A758C0B45549641FCE4240D8F2CAF5B61859C0D122DBF97EB24240', 24048, 'AR330(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000008000000D8F2CAF5B61859C0D122DBF97EB2424078190F00661759C092617028D7A042400C83E8FF0B6358C0D514127A47CB4240FB100A00C49C57C0D474875E900F4340AF230ED9409F57C0894160E5D0224340D65416855D6558C096D05D1267DF4240CFF753E3A5A758C0B45549641FCE4240D8F2CAF5B61859C0D122DBF97EB24240', 24049, 'AR330(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000070000001EA9BEF38BE15DC01AA20A7F860547400BB3D0CE695F5DC0E9263108AC0447401EA9BEF38B715CC0B6F3FDD478F14640840F255AF2675BC0D73043E389E24640736891ED7C675BC0FC1C1F2DCE864740D0D38041D26C5CC0A4FD0FB0568F4740D9CEF753E36D5DC02F505260019A4740', 30545, 'AR337');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000B0000001EA9BEF38BE15DC01AA20A7F86054740F86C1D1CECDF5DC06D0A1AE9FBEE4640ECC039234A5F5DC049E30632F1F046400BB9AD8875665CC031EE06D15ADC4640F7F01B156E5F5CC05D328E91EC9F474014515D0A596D5DC0229FFC8282A84740D6C743DFDD6D5DC0448B6CE7FB994740CDCCCCCCCC6C5CC05C02F04FA990474009FB761211715CC09E7C7A6CCBF246400BB3D0CE695F5DC0E9263108AC0447401EA9BEF38BE15DC01AA20A7F86054740', 30544, 'AR338');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000007000000B2463D44A3295FC04A5E9D63402A48403ACC9717E02D5FC0D83274475A1B4840A603A3DCC7DD5DC00B7A14538E624740C48E6BE80B225DC022A81ABD1A6E47405F0CE544BB225DC08B89CDC7B58147403DD52137C3DD5DC00ABABDA431764740B2463D44A3295FC04A5E9D63402A4840', 24055, 'AR356');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000008000000A4703D0AD7FB58C042EDB776A20E42400ADEEBFFF7EE58C076656199C8124240EC432800901A59C03AE8120EBD91434019ABCDFFAB4959C03F0C63C1B30F4540E17A14AE475559C0C5AD8218E80C4540C976BE9F1A3B59C0273108AC1C3A44405EBA490C021359C04A99D4D006E24240A4703D0AD7FB58C042EDB776A20E4240', 24059, 'AR400(N)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000008000000A4703D0AD7FB58C042EDB776A20E42400ADEEBFFF7EE58C076656199C8124240EC432800901A59C03AE8120EBD91434019ABCDFFAB4959C03F0C63C1B30F4540E17A14AE475559C0C5AD8218E80C4540C976BE9F1A3B59C0273108AC1C3A44405EBA490C021359C04A99D4D006E24240A4703D0AD7FB58C042EDB776A20E4240', 24060, 'AR400(S)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000009000000658A39083A9558C05E471CB281EE434070E01F00829258C0891E9D5F39DD434097B3D2FF4D4E58C0BCE078E349F2434078190F00660958C003D59A41D7074440F621140008C257C0C60B337E2B2244400794F2FF4F7A57C0570A815CE23B4440C89A9141EE7D57C01CCD91955F4C44407AC5538F340D58C0A0A70183A4194440658A39083A9558C05E471CB281EE4340', 25200, 'AR406H(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000009000000658A39083A9558C05E471CB281EE434070E01F00829258C0891E9D5F39DD434097B3D2FF4D4E58C0BCE078E349F2434078190F00660958C003D59A41D7074440F621140008C257C0C60B337E2B2244400794F2FF4F7A57C0570A815CE23B4440C89A9141EE7D57C01CCD91955F4C44407AC5538F340D58C0A0A70183A4194440658A39083A9558C05E471CB281EE4340', 25201, 'AR406H(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000007000000B43C0FEECE3C614046EBA86A820035408DD5E6FFD5366140436271EE65CD344077741200929861407D8A2D4EC66E32403F840200D1E061403216F2ADB4ED2E404DBED9E6C6E961404DD6A88768542F40728A8EE4F29F6140A110018750A53240B43C0FEECE3C614046EBA86A82003540', 24187, 'AR803(NW)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000009000000658A39083A9558C05E471CB281EE434070E01F00829258C0891E9D5F39DD434097B3D2FF4D4E58C0BCE078E349F2434078190F00660958C003D59A41D7074440F621140008C257C0C60B337E2B2244400794F2FF4F7A57C0570A815CE23B4440C89A9141EE7D57C01CCD91955F4C44407AC5538F340D58C0A0A70183A4194440658A39083A9558C05E471CB281EE4340', 25202, 'AR406L(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000009000000658A39083A9558C05E471CB281EE434070E01F00829258C0891E9D5F39DD434097B3D2FF4D4E58C0BCE078E349F2434078190F00660958C003D59A41D7074440F621140008C257C0C60B337E2B2244400794F2FF4F7A57C0570A815CE23B4440C89A9141EE7D57C01CCD91955F4C44407AC5538F340D58C0A0A70183A4194440658A39083A9558C05E471CB281EE4340', 25203, 'AR406L(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000A000000C4D155BABBE355C0B0E595EB6DF942409AFDCBFFF5E455C02A08799851E44240732A19002A4855C0F2272A1BD6CB4240FDB50600580B55C042F79B3F5CC24240950ED6FF39CF54C0C769E3E36EB942400FCDE1FFB36454C0223E0B9D32A44240C6FCDCD0946254C0CDCCCCCCCCBC42409A99999999CD54C0213D450E11D14240A39410ACAA4655C03333333333E34240C4D155BABBE355C0B0E595EB6DF94240', 24070, 'AR455(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000A000000C4D155BABBE355C0B0E595EB6DF942409AFDCBFFF5E455C02A08799851E44240732A19002A4855C0F2272A1BD6CB4240FDB50600580B55C042F79B3F5CC24240950ED6FF39CF54C0C769E3E36EB942400FCDE1FFB36454C0223E0B9D32A44240C6FCDCD0946254C0CDCCCCCCCCBC42409A99999999CD54C0213D450E11D14240A39410ACAA4655C03333333333E34240C4D155BABBE355C0B0E595EB6DF94240', 24071, 'AR455(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000B0000005C2041F1631254C065C746205E274140BD6F7CED990954C051BD35B0552E4140CD3B4ED1910254C05A0D897B2C2D4140401878EE3DFC53C0390B7BDAE12341409FCDAACFD5FA53C0300DC347C41441405B423EE8D91454C07D5C1B2AC6A9404058A835CD3B1C54C0252367614FA34040F758FAD0052554C0A306D3307CA4404046425BCEA52A54C03815A930B6AC4040E78C28ED0D2C54C0567DAEB662BB40405C2041F1631254C065C746205E274140', 24090, 'AR600');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000A000000B64AB0389C9753C07DD0B359F5D1404067614F3BFC9153C0098A1F63EECA4040683F5244868F53C014E8137992BC40400CB08F4E5DA953C012312592E8514040739D465A2AAF53C095D409682248404031EBC5504EB853C02F698CD65149404099D87C5C1BBE53C012312592E851404047551344DDBF53C07B319413ED5E40401327F73B14A753C0153AAFB14BC84040757632384A9E53C0087767EDB6D34040', 24091, 'AR601');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000009000000909E228788C859C01766A19DD37641405D6BEF5355C559C0927A4FE5B46141405D6BEF5355C559C03333333333134140A39410ACAACA59C0AC8F87BEBBFB40405C8FC2F528E459C0AC8F87BEBBFB40401F85EB51B8E659C0BBD6DEA7AA0A41409B75C6F7C5E659C0927A4FE5B46141407B14AE47E1E259C01766A19DD3764140909E228788C859C01766A19DD3764140', 24092, 'AR602');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000A00000079E9263108805CC0452921585555414011A7936C75445CC0AC8F87BEBB534140EB025E66D8255CC035EB8CEF8B15414009FB761211215CC0BBD6DEA7AA0A41407A3881E9B4095CC05AD76839D0D140400000000000105CC012F6ED2422C240408FC2F5285C335CC012F6ED2422C240401283C0CAA1495CC05AD76839D0D1404079E9263108805CC0B81E85EB51F8404079E9263108805CC04529215855554140', 24093, 'AR603');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000050000000000000000805BC000000000008048400000000000C05AC000000000008048400000000000C05AC00000000000C047400000000000805BC00000000000C047400000000000805BC00000000000804840', 24094, 'AR604');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000B000000C173EFE1929B56C053910A630B514740344B02D4D42C56C01DC9E53FA43F47400D54C6BFCF2256C05166834C32364740CFF753E3A51F56C0BF4868CBB92447403D7E6FD39F2556C00A2E56D4601647406A300DC3473256C0B0AC342905114740A01A2FDD24A056C0C3B645990D224740ED478AC8B0AA56C074B515FBCB2A474075B0FECF61AE56C0FC1873D7123A4740E6AE25E483AA56C0C685032159484740C173EFE1929B56C053910A630B514740', 24097, 'AR607');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000800000000000000006051C04529215855B544405D6BEF53551D51C0CDCCCCCCCCAC44400000000000C050C0DFC2BAF1EEEE44400000000000C050C0213D450E1151454000000000001051C0BBD6DEA7AA2A454000000000002051C0213D450E1111454000000000006051C06666666666E6444000000000006051C04529215855B54440', 24098, 'AR608');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000800000066666666668652C087A3AB7477B745407061DD78779752C03333333333B345403C2EAA45440453C0CDCCCCCCCCAC45402A38BC20220253C00000000000E04540D6C743DFDDFD52C0CDCCCCCCCCEC45402A38BC2022F252C03333333333F34540CEA8F92AF98952C012F6ED2422F2454066666666668652C087A3AB7477B74540', 24099, 'AR609');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000009000000F70489EDEE6E5BC0F2D24D62104040403C2EAA4544645BC054707841447440403C2EAA4544645BC0E318C91EA1F440401D5A643BDF4B5BC000000000000041403333333333335BC000000000000041403333333333335BC03333333333F34040A1698995D1075BC0B22AC24D46BF4040B517D1764C545BC054707841443C4040F70489EDEE6E5BC0F2D24D6210404040', 24104, 'AR613');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000090000002A38BC2022E258C0DB1324B6BBBB3D402A38BC2022E258C00000000000803D4009FB761211D158C0F1B8A81611B13C40909E228788C858C06666666666863C40909E228788B058C0BE8575E3DD9D3C407061DD7877AF58C00F4757E9EECE3C40909E228788C058C0427A8A1C22A23D409A99999999C958C075ADBD4F55D53D402A38BC2022E258C0DB1324B6BBBB3D40', 24105, 'AR614');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000500000066666666665651C0DFC2BAF1EEDE45405D6BEF5355E550C054707841442446403C2EAA4544D450C0BBD6DEA7AAEA454066666666664651C04529215855A5454066666666665651C0DFC2BAF1EEDE4540', 24107, 'AR616A');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000B0000008F705AF0A2D354C044696FF085193A404A07EBFF1C9654C044696FF085193A401C9947FE608E54C00B98C0ADBB093A405BB1BFEC9E8C54C02B1895D409F839403B3602F1BA8E54C0A7AE7C96E7E139408A1F63EE5A9454C0FBAE08FEB7D23940A774B0FECFD354C060E5D022DBC93940B745990D32DB54C064CC5D4BC8D73940B6679604A8DD54C0E370E65773F03940EFE6A90EB9DB54C0705F07CE19093A408F705AF0A2D354C044696FF085193A40', 24110, 'AR618');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000110000002A38BC2022A259C0DFC2BAF1EEEE41406666666666A659C09A99999999F94140CDCCCCCCCCAC59C012F6ED24220242403C2EAA4544B459C0795C548B88084240A39410ACAA5A5AC087A3AB74775742403333333333635AC09A99999999594240C4D155BABB6B5AC09A999999995942403333333333735AC03333333333534240909E228788785AC0213D450E113142403333333333735AC0795C548B88284240CDCCCCCCCC6C5AC000000000002042405D6BEF5355655AC09A999999991942400000000000C059C0BBD6DEA7AACA4140909E228788B859C0795C548B88C841400000000000B059C0BBD6DEA7AACA4140909E228788A859C0CDCCCCCCCCCC41402A38BC2022A259C0DFC2BAF1EEEE4140', 24115, 'AR623');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000005000000909E228788285CC06666666666864240CDCCCCCCCC2C5CC03333333333D34140909E228788085CC0213D450E11D141403333333333035CC05470784144844240909E228788285CC06666666666864240', 24116, 'AR624');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000009000000FED478E926F954C0C15774EB35074040D6C743DFDDF554C08C868C47A9B83F40B29DEFA7C6EB54C097546D37C1E33E40AF963B33C1E754C00000000000A03E404930D5CC5ACD54C0BC5AEECC049F3E4015FDA19927D254C0AC02B5183CE83E402E01F8A754DC54C0E90C8CBCACC53F40508D976E12DF54C07B87DBA161074040FED478E926F954C0C15774EB35074040', 24120, 'AR627');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000A000000C4D155BABBBB51C0CDCCCCCCCCCC4540F70489EDEECE51C0213D450E11D1454000000000000052C0EE0912DBDDDD45405D6BEF53554552C0BBD6DEA7AAEA4540909E2287884852C06666666666E64540D6C743DFDD4D52C04529215855B54540F70489EDEE4E52C0EE0912DBDD9D4540CDCCCCCCCCEC51C0795C548B888845402A38BC2022C251C0AC8F87BEBB9B4540C4D155BABBBB51C0CDCCCCCCCCCC4540', 24124, 'AR631');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000005000000F70489EDEE2E55C06666666666D64140D6C743DFDDC554C0DFC2BAF1EE0E4240C4D155BABBD354C054707841445442405D6BEF53553D55C0BBD6DEA7AA1A4240F70489EDEE2E55C06666666666D64140', 24126, 'AR633A');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000090000005D6BEF53550D5BC025ECDB4944C43F405D6BEF53550D5BC00000000000803F40022B8716D9225BC0D578E92631683F405D6BEF53556D5BC06666666666663F400000000000805BC09A99999999793F400000000000805BC0A8E0F08288C83F40D6C743DFDD6D5BC0DB1324B6BBDB3F40A39410ACAA225BC00000000000E03F405D6BEF53550D5BC025ECDB4944C43F40', 24134, 'AR639A');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000B0000007C7E18213C745AC0B0FECF61BEF8404085B18520076D5AC08A7615527EFA40403E3F8C101E655AC055302AA913F440405AD8D30E7F4F5AC07AFCDEA63FA34040CA1AF5108D505AC0151DC9E53F94404089247A19C5545AC0C9C859D8D38A40404772F90FE95D5AC024D1CB28968740408FE4F21FD2655AC03C4ED1915C8E40407AE40F069E7B5AC08AE5965643E2404062BEBC00FB785AC0AE2AFBAE08F240407C7E18213C745AC0B0FECF61BEF84040', 24142, 'AR644(N)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000B0000007C7E18213C745AC0B0FECF61BEF8404085B18520076D5AC08A7615527EFA40403E3F8C101E655AC055302AA913F440405AD8D30E7F4F5AC07AFCDEA63FA34040CA1AF5108D505AC0151DC9E53F94404089247A19C5545AC0C9C859D8D38A40404772F90FE95D5AC024D1CB28968740408FE4F21FD2655AC03C4ED1915C8E40407AE40F069E7B5AC08AE5965643E2404062BEBC00FB785AC0AE2AFBAE08F240407C7E18213C745AC0B0FECF61BEF84040', 24143, 'AR644(S)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000060000002A38BC2022525EC0213D450E11D14540A39410ACAA2A5EC00000000000E04540D6C743DFDD0D5EC03333333333334540994A3FE1EC275EC0A60EF27A302745403C2EAA4544345EC054707841442445402A38BC2022525EC0213D450E11D14540', 24144, 'AR645');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000050000007061DD78777F56C0CDCCCCCCCCCC3C405D6BEF53555556C0A8E0F08288883B4066666666663656C0DB1324B6BBBB3B4009FB7612116156C00000000000003D407061DD78777F56C0CDCCCCCCCCCC3C40', 24146, 'AR647');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000700000009FB761211D15CC09A999999995941400000000000805CC045292158555541400000000000805CC0213D450E113141400000000000A05CC0EE0912DBDD1D41400000000000E05CC0EE0912DBDD1D4140A39410ACAADA5CC0795C548B8828414009FB761211D15CC09A99999999594140', 24149, 'AR649');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000A0000005DDC4603785158C0D1E80E6267D24340A6272CF1804858C027C286A757CE4340A8E33103954358C03D9B559FABC54340573ECBF3E04258C04CC3F01131B943406E861BF0F94758C0CE88D2DEE0AB4340BC0512143F8A58C06ADE718A8E8C43405AD8D30E7F9558C0FE43FAEDEB9043407120240B989A58C09A94826E2F9D4340207BBDFBE39958C057B2632310AB4340D1915CFE439458C0D36A48DC63B54340', 24154, 'AR653');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000050000005D6BEF5355C554C0DB1324B6BB5B3B40D6C743DFDD1D55C0DB1324B6BB5B3B40D6C743DFDD1D55C00F4757E9EECE3B405D6BEF5355C554C00F4757E9EECE3B405D6BEF5355C554C0DB1324B6BB5B3B40', 24156, 'AR655');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000090000003C2EAA4544E45BC012F6ED2422924140D6C743DFDDDD5BC0DFC2BAF1EEAE4140F70489EDEE9E5BC0213D450E11014240D6C743DFDD8D5BC0666666666606424009FB761211815BC0CDCCCCCCCCEC41406666666666865BC0213D450E11D141407061DD7877C75BC0EE0912DBDD7D4140909E228788D85BC0AC8F87BEBB7B41403C2EAA4544E45BC012F6ED2422924140', 24158, 'AR658');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000B00000065FCFB8C0BD759C00B24287E8C4942402B357BA015185AC0C72E51BD35244240791EDC9DB51D5AC084640113B819424099BB96900F1E5AC0FD6A0E10CC0D4240F2B56796041A5AC04209336DFF0242408C84B69C4B0F5AC034BF9A0304FF4140697407B133CD59C0D2C6116BF121424020240B98C0C759C05322895E462D424058C51B9947C859C03AE97DE36B3B4240C0B2D2A414CE59C08907944DB946424065FCFB8C0BD759C00B24287E8C494240', 24826, 'AR672');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000110000007061DD78776F5BC0C3F5285C8FB24140C4D155BABB6B5BC0AC8F87BEBBBB41405D6BEF5355655BC06666666666C64140D6C743DFDD5D5BC0CDCCCCCCCCCC4140D6C743DFDD055BC0AC8F87BEBBFB4140C4D155BABBFB5AC0EE0912DBDDFD41403333333333F35AC01CCD91955FFC4140D6C743DFDDED5AC09A99999999F941400000000000E85AC0AC8F87BEBBDB4140A39410ACAAEA5AC0A4703D0AD7D341402A38BC2022F25AC087A3AB7477C741402A38BC2022FA5AC012F6ED2422C241402A38BC2022525BC03333333333934140A39410ACAA5A5BC0213D450E119141403C2EAA4544645BC012F6ED24229241409A99999999695BC045292158559541407061DD78776F5BC0C3F5285C8FB24140', 24163, 'AR674');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000060000003C2EAA45442C5AC0EE0912DBDD4D46403C2EAA4544245AC04529215855254640909E228788085AC03333333333934540CDCCCCCCCCEC59C0DFC2BAF1EE9E45400000000000085AC0213D450E113146403C2EAA45442C5AC0EE0912DBDD4D4640', 24164, 'AR678');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000050000002A38BC20229254C08B5242B0AA2A3A40A39410ACAA2A55C08B5242B0AA2A3A40A39410ACAA2A55C0F1B8A81611513B402A38BC2022B254C0F1B8A81611513B402A38BC20229254C08B5242B0AA2A3A40', 24165, 'AR716');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000008000000CF66D5E76AEB51C0A1F31ABB44C9434013F241CF66C350C0B6D617096DA54340AA9A20EA3EA050C0B6D617096DA54340AA9A20EA3EA050C0EFE192E34E5D4340520FD1E80ED050C0EFE192E34E5D4340728A8EE4F2CD50C0B0C91AF5107D4340EE258DD13AEE51C03E22A64412A14340CF66D5E76AEB51C0A1F31ABB44C94340', 25721, 'AR777H');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000008000000CF66D5E76AEB51C0A1F31ABB44C9434013F241CF66C350C0B6D617096DA54340AA9A20EA3EA050C0B6D617096DA54340AA9A20EA3EA050C0EFE192E34E5D4340520FD1E80ED050C0EFE192E34E5D4340728A8EE4F2CD50C0B0C91AF5107D4340EE258DD13AEE51C03E22A64412A14340CF66D5E76AEB51C0A1F31ABB44C94340', 25720, 'AR777L');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000005000000E275FD82DD8463C025E99AC9371B364005EFF5FF7B7F63C06AC6FDA25FE4354088E6F0FFD9B862C0B691A1197A923940BE874B8E3BBE62C0A7B393C151CA3940E275FD82DD8463C025E99AC9371B3640', 24202, 'AR901(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000005000000E275FD82DD8463C025E99AC9371B364005EFF5FF7B7F63C06AC6FDA25FE4354088E6F0FFD9B862C0B691A1197A923940BE874B8E3BBE62C0A7B393C151CA3940E275FD82DD8463C025E99AC9371B3640', 24203, 'AR901(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000007000000A6F27684D3D864C0DBC4C9FD0E3D35400ADEEBFFB7D864C08367E7D951FF3440BBE70A00DF2A64C0894B44AE8ADA34408B30EAFF41F563C07DD5253ED20935408D5DA27A6BF663C0B5A679C7294A3540641EF983812B64C0AAD4EC8156183540A6F27684D3D864C0DBC4C9FD0E3D3540', 24206, 'AR903(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000007000000A6F27684D3D864C0DBC4C9FD0E3D35400ADEEBFFB7D864C08367E7D951FF3440BBE70A00DF2A64C0894B44AE8ADA34408B30EAFF41F563C07DD5253ED20935408D5DA27A6BF663C0B5A679C7294A3540641EF983812B64C0AAD4EC8156183540A6F27684D3D864C0DBC4C9FD0E3D3540', 24207, 'AR903(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000090000005E4BC8073DCC64C0904946CEC2063840B9420E004BCD64C0111148D3EAE737404029FFFFE47E64C0709C6F9FB02B3740849CF7FFB15764C093077D44A7B03640732A1900EA2E64C084A8B173898B3540F27B9BFEEC2B64C0A52C431CEBAA35406B82A8FB005464C0919BE1067CCE3640A4703D0AD77D64C0DA5548F9494D37405E4BC8073DCC64C0904946CEC2063840', 24208, 'AR904(NW)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000090000005E4BC8073DCC64C0904946CEC2063840B9420E004BCD64C0111148D3EAE737404029FFFFE47E64C0709C6F9FB02B3740849CF7FFB15764C093077D44A7B03640732A1900EA2E64C084A8B173898B3540F27B9BFEEC2B64C0A52C431CEBAA35406B82A8FB005464C0919BE1067CCE3640A4703D0AD77D64C0DA5548F9494D37405E4BC8073DCC64C0904946CEC2063840', 24209, 'AR904(SE)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000040000009A99999999D154C040C23060C9DF444055320054714A54C01904560E2DC24440F70489EDEEF653C0213D450E11B14440684293C492B753C085EB51B81EA54440', 24001, 'AR9217');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000F000000EB6E9EEA90E955C095826E2F69AC3C40F3D71A0060F355C0555117844DA63C40AB1A29006BF755C0B4226AA2CF9B3C40D82AC1E270FA55C007F01648508C3C40486DE2E47EFB55C01878EE3D5C723C40364B13002DF955C082531F48DE5F3C405839B4C876F455C0938C9C853D4D3C40D4B7CCE9B25E55C095D4096822943B40B4531800CF5755C0EAF29CE392933B4036E50AEF725355C030478FDFDB9C3B40B6F3FDD4784D55C00EF8FC3042B83B40975643E21E4D55C0745E6397A8CE3B400C83E8FF8B4F55C0A00898AF81DF3B40C6C4E6E3DA5455C005172B6A30F53B40EB6E9EEA90E955C095826E2F69AC3C40', 25410, 'AW-001');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000005000000D09B8A54186756C0C9E53FA4DF5E3D402D78D157901C56C05FB532E197823C40D95F764F1E3456C0ABE7A4F78D1F3C40AC8BDB68007F56C016139B8F6BFB3C40D09B8A54186756C0C9E53FA4DF5E3D40', 25412, 'AW-004');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000120000000586AC6EF59C53C004E275FD82D5404028BE350B0FA153C0A711E96D22D64040E7EE29EF19A553C093E2E313B2D540406C51B010E7AA53C0EB1A2D077AD240407B88467710AF53C048DC63E943CB404069006F8104BB53C0F7065F984C8D4040886C7B165FBA53C040A0D8AFE082404051DA1B7C61B853C04AD235936F7A40409F52CA10ECB453C0107E3DBA6C744040AE85B4215AB053C0ADED3724FF6F404099BDC7F45FAA53C0B95E89F6676F4040BE31040047A553C084CEB5792D714040ACD4A2F43BA153C0BA1457957D7640405DC47762D69D53C04512BD8C627D40408750A5660F9253C0268DD13AAABE4040910A630BC19453C0FD77335992CA4040770E0AEF179853C06DA23B2DE4D140400586AC6EF59C53C004E275FD82D54040', 25413, 'AW-005');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000005000000174850FC189555C06EC0E787116A3F4067EDB60BCD9555C0B8E4B8533A003F407A53910A632D55C0991249F432FA3E403B191C25AF2C55C05DDC460378633F40174850FC189555C06EC0E787116A3F40', 25414, 'AW-006');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000F000000C503CAA65CF952C090831266DACE4140DB6D179AEB0053C0841266DAFED54140E5AF3500400753C0BA2B60A7FDD4414058C51B99470E53C09A779CA223D1414091D5AD9E933A53C00CB08F4E5D7D4140715AF0A2AF3C53C0876D8B321B70414038F00F00C13A53C0A0A0B9F369644140EACF7EA4883653C0E94317D4B75841402C6D2700353053C0A2B77878CF54414033F9669B1B2B53C09D2E8B89CD534140CDE9B298D82253C0AF5A99F04B5941403D9B559FABF552C02592E86514AF414095B7239C16F452C0D68BA19C68BF414019ABCDFFABF552C02A8F6E8445C74140C503CAA65CF952C090831266DACE4140', 25435, 'AW-702');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000005000000917EFB3A70C456C01CD3139678C03F40A228D027F2BA56C097900F7A365B3F407DCB9C2E8B0357C0D6AD9E93DE173F40CBD6FA22A10B57C02FA3586E697D3F40917EFB3A70C456C01CD3139678C03F40', 12105, 'AW102');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000500000001A43671726756C004392861A65D3D400EDB1665361C56C036AB3E575B813C40D95F764F1E3456C0624A24D1CB203C403EB324404D7F56C0295C8FC2F5F83C4001A43671726756C004392861A65D3D40', 9095, 'AW 104');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000B000000DDEF5014E8115DC0EB6E9EEA905B41406ADE718A8EDC5CC0EB6E9EEA905B4140282CF180B2E55CC0BA83D899422F4140C7BAB88D06EC5CC06A6AD95A5F244140FE7DC68503EF5CC06A6AD95A5F244140FE7DC68503EF5CC07DAEB6627F3541406649809A5AF25CC07DAEB6627F3541406649809A5AF25CC06EFAB31F294641403CBD529621FE5CC0E4DA5031CE4B41405A9E077767035DC03ACC971760574140DDEF5014E8115DC0EB6E9EEA905B4140', 6005, 'BRISTOL MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000B000000A796ADF545865DC0D9EBDD1FEF6941403A3B191C25815DC0D13FC1C58A664140A110018750655DC00A68226C786641401C25AFCE31625DC04FE960FD9F6741401C25AFCE31625DC05EA27A6B606B4140124E0B5EF45B5DC04C7155D9776D4140124E0B5EF45B5DC02766BD18CA694140EF38454772655DC041F163CC5D6341409CBF098508805DC012C2A38D23624140A796ADF545865DC0D13FC1C58A664140A796ADF545865DC0D9EBDD1FEF694140', 6010, 'BUCKHORN MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000050000005E4BC8073D3159C08CDB68006FED4340E388B5F8140E59C02497FF907EE743408E588B4F011659C0F819170E847443409352D0ED253959C0B48EAA26887A43405E4BC8073D3159C08CDB68006FED4340', 25440, 'DEN-1');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000500000098DD938785C859C02E1C08C9023A43404E452A8C2DA859C02FC03E3A75CD4240D8F50B76C3C659C0C993A46B26B742407233DC80CFE759C06AC18BBE8224434098DD938785C859C02E1C08C9023A4340', 25441, 'DEN-2');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000012000000DC0E0D8BD16C5CC04078A3456CE94240F50368A5DA6C5CC0EF0802BFA1F242401AF44AFECC8C5CC04EE08C5022024340F39606D90DA05CC04EE08C502202434065D35B4DE8AC5CC0E133C813F7FF424040074C96C90B5DC045E5153E11F1424075A7E095C90B5DC0FF02E6C699D942404274AD6296F85CC0FF02E6C699D942404274AD6296F85CC0CCCFB29366C64240BB89100D41F35CC0CCCFB29366C64240BB89100D41F35CC052BA4FE9BBBB424044E10E2F63E55CC052BA4FE9BBBB424044E10E2F63E55CC07818497144A44240F129A50C41D35CC07818497144A4424026CA390C41D35CC0168CA5A37737424026CA390C41C35CC0BEFA78E8BB5B42408F9D013F74A65CC0BEFA78E8BB5B4240DC0E0D8BD16C5CC04078A3456CE94240', 6015, 'DESERT MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000060000002BFBAE08FE0F59C0D7A3703D0A23484043908312668A58C0BE874B8E3B1148409A5FCD01825F58C0D8B628B341024740C8CD70033EC158C0D8B628B341024740D7C05609167F59C0309E4143FFAC47402BFBAE08FE0F59C0D7A3703D0A234840', 31172, 'DICKINSON');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000B0000004AD235936FB05CC0AA8251499D544040EDD3F198819E5CC0AA8251499D544040EDD3F198819E5CC0825660C8EA4A4040884677103BA15CC0825660C8EA4A4040884677103BA15CC0D53E1D8F19404040EDD3F198819E5CC0D53E1D8F19404040EDD3F198819E5CC07B4E7ADFF8324040075F984C15B45CC073A25D85943F40408AABCABE2BB45CC0BD35B055824940401DE6CB0BB0B35CC0B28009DCBA4F40404AD235936FB05CC0AA8251499D544040', 6020, 'DOME MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000B000000E1EEACDD762955C0A1D634EF38914640664E97C5C40855C072E1404816A046407F30F0DC7B0655C05648F949B557464088635DDC46FF54C0EF384547724946403AE97DE36B2555C0693524EEB148464070CE88D2DE2A55C0F41ABB44F556464058CA32C4B12A55C05CACA8C1345C46407845F0BF952855C071C971A7745C464071AC8BDB682855C0465F419AB1644640E88711C2A32955C05B7C0A80F1644640E1EEACDD762955C0A1D634EF38914640', 31309, 'GRAYLING TEMPORARY MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000011000000B2F4A10BEA2B58C03DF20703CFE53E40E38DCC237FB458C0CB4A9352D07D3E401973D712F2B958C0BB0A293FA96E3E40EEE82400A4BB58C0F67CCD72D95E3E40F9F719170EBC58C084D89942E74D3E406AF6402B30B858C0AE9E93DE37363E407C6308008EB358C0C7FA61DFA92D3E40639CBF0985AE58C099BB96900F2A3E4004560E2DB22758C0A5660FB402933E407FAD0100B62258C0A317FF88709B3E40BDE3141DC91F58C08ECC237F30A83E40901FE0FF7D1E58C0B090B932A8B63E404DA1F31ABB1E58C057957D5704C73E4088E6F0FF992058C090BA42C472D23E40444C89247A2358C001F6D1A92BDF3E407D080500A22758C0AD889AE8F3E33E40B2F4A10BEA2B58C03DF20703CFE53E40', 25634, 'HOOD 2 ORBIT');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000007000000F0BF95ECD8925BC026AAB706B686404033912D2611975BC0867DF1FBED6D404010406A13279F5BC07C9BFEEC47564040CEFC6A0E107A5BC0EF1B5F7B664540409F8EC70C54725BC0B9C7D2872E644040247F30F0DC7F5BC07138F3AB39804040F0BF95ECD8925BC026AAB706B6864040', 4445, 'JACKAL LOW MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000600000019F9067044645BC04E999B6F447440405C6ED51AEF6E5BC0126BF12900404040D0A9752C00A05BC078D15790665640409B09E12C00A05BC03BEA9E2B00E04040E358727044645BC0D0A9752C0000414019F9067044645BC04E999B6F44744040', 4440, 'JACKAL MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000B0000008DB454DE8E5455C0B18A37328FDC3F409E5E29CB104B55C068D0D03FC1DD3F4030D80DDB164555C03CF71E2E39CE3F40894160E5D01255C01D5A643BDF473E4038BEF6CC921455C026AAB706B62A3E40486DE2E47E1955C0BF823463D1143E40E71DA7E8482255C0BF823463D1143E40E4839ECDAA2955C088BA0F406A233E404CE0D6DD3C5B55C0F9A067B3EAB33F406C5B94D9205955C0F33CB83B6BCF3F408DB454DE8E5455C0B18A37328FDC3F40', 25637, 'JSTARS 3 ORBIT');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000B000000A8D02F00C33655C068B3452D28F33F40CDE26A099E3D55C06D8901B793EF3F40E1404816304255C0B2FE85D4A3E33F4050244EDD4B4455C0B73B10FEEAD23F405665DF15C11555C023A12DE7523C3E40077C7E18211055C0BDC62E51BD2D3E40F8889812490655C0BDC62E51BD2D3E40397F130A110255C053E8BCC62E413E4059FAD005F5FF54C0799274CDE45B3E40904E5DF92C3155C0E622BE13B3E63F40A8D02F00C33655C068B3452D28F33F40', 25683, 'JSTARS 3C ORBIT');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000B000000D8D825AAB7C055C08A8EE4F21F624040567DAEB6624355C08A8EE4F21F6240406649809A5A3C55C09DBAF2599E5B4040D847A7AE7C3855C07CED9925014E40406649809A5A3C55C040F67AF7C73F4040567DAEB6624355C0802BD9B111384040D8D825AAB7C055C0802BD9B111384040E6CB0BB08FCA55C040F67AF7C73F4040CDE9B298D8CC55C07CED9925014E4040E6CB0BB08FCA55C09DBAF2599E5B4040D8D825AAB7C055C08A8EE4F21F624040', 25639, 'JSTARS 4 ORBIT');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000B000000C5C9FD0E45B153C061C3D32B65493D40253B3602F1AA53C0C6A70018CF403D4027F73B1405A653C072BF4351A02F3D4027F73B1405A653C02E1C08C902363B40253B3602F1AA53C040D9942BBC1B3B40C5C9FD0E45B153C0261E5036E5123B4013D55B035BB953C040D9942BBC1B3B4082397AFCDEBC53C02E1C08C902363B4082397AFCDEBC53C072BF4351A02F3D4013D55B035BB953C0C6A70018CF403D40C5C9FD0E45B153C061C3D32B65493D40', 25643, 'JSTARS 8A ORBIT');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000B0000004A29E8F692EA53C0D21DC4CE14323D406B60AB048BE353C00EF8FC3042283D40AC5626FC52DF53C0D6390664AF0F3D40AC5626FC52DF53C0E700C11C3D1E3B406B60AB048BE353C0AD2F12DA72063B404A29E8F692EA53C0E5B33C0FEEFE3A4019E25817B7F353C0AD2F12DA72063B4069A9BC1DE1F653C0E700C11C3D1E3B4069A9BC1DE1F653C0D6390664AF0F3D4019E25817B7F353C00EF8FC3042283D404A29E8F692EA53C0D21DC4CE14323D40', 25644, 'JSTARS 8B ORBIT');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000001300000097B3D2FFCD3758C0614E756D14B34540C320FAFF023F58C048E81D5D5BB44540F90FE9B7AF4558C024EEB1F4A1B34540C66AF3FFAA4B58C07F935CB4B6AD45400725CCB4FD5158C0527E52EDD3A54540642310AFEB6358C075E5B33C0F46454033011A00856258C0EA7CD34F93394540857CD0B3595F58C01B9E5E29CB30454055E5D6FF145A58C0463AA869BC2945407767EDB60B5358C09548A297512445404A07EBFF9C4A58C01C7DCC07042445408ACDC7B5A14458C02C9FE57970274540D2EDDBFFB63F58C05068FE3D1D2D45409A779CA2233B58C08638D6C56D344540EDD3F198812858C06FF085C9549145403F840200912958C0911040C5CC9B45405C381092052C58C049D74CBED9A64540D7DCD1FFF23058C029BB4F4475AD454097B3D2FFCD3758C0614E756D14B34540', 25455, 'MINNEAPOLIS');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000008000000FB928D075B9858C0A46DFC89CA2E45404277499C157158C0BBD6DEA7AA2A45404277499C157158C0213D450E11F14440BBD39D279E9958C09A99999999B94440B2D826158DB858C087A3AB7477B74440B2D826158DB858C0AC8F87BEBB1B4540EA758BC058B658C07EC9C6832D204540FB928D075B9858C0A46DFC89CA2E4540', 24859, 'ONEILL MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000060000009B09E12C00A05BC03BEA9E2B00E04040D0A9752C00A05BC078D15790665640408AC745B588A85BC0AB048BC3995940405527B1B588D85BC032EF2719EF8E40401F871CB688D85BC0C7AEFE19EFBE40409B09E12C00A05BC03BEA9E2B00E04040', 4535, 'OUTLAW MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000006000000DC80CF0F23405DC0D50451F701004540D72FD80DDB005DC0D50451F701004540D72FD80DDB005DC09F93DE37BEBA4440C5C9FD0E450F5DC0C9022670EBAA4440DC80CF0F23405DC0C9022670EBAA4440DC80CF0F23405DC0D50451F701004540', 31244, 'OWYHEE SOUTH MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000006A0000002B5899DF9F0857C0CB64DDE45C2D48409C95A3B6430B57C0ED3FD763C72D4840A764EF7B8A1057C03FCCB96F102D48402146BE019C1357C0606D31E47D284840F8F82933CA1257C093AF5F0BD52148400CB66C08691157C0C6F18D322C1F484063AD461BEC1757C0BC6367C00F1C484093A0095EBE1B57C0BC8564B785284840B61AC869BE1B57C092E057F66E1C4840D615D808691A57C00F3DCED9A71A4840E18739F70D1657C00F3DCED9A71A4840E18739F70D1657C088523184521548407AD7EABC570957C0D61D8B6D52154840BD4CB967020857C0547A01518B134840BD4CB967020457C0B8CE1A17691148406D533C2E2AFD56C0DE99643FE60B4840232AF97D24FA56C0C25C4189850848400A229C60C9F156C0BA5EE4AFDA0548402E9C5A6CC9F156C09E21C1F979024840ABF8D04F02F056C0DAE21A9FC9FC4740CF728F5B02F056C0FD0B4E8E4CFA47400EE0884913E956C066A77A8DB8FB4740610ECC1BF1E656C05D86A4BB90FE47403C82C06F68DA56C06BEE8DC646FF4740BD5DE5BFF6D956C0C9D81A5B19F74740A3F3D02D2AED56C0F58F74BCB8F34740C76D8F392AED56C0D952510658F04740EA5E27F5E5E856C033F6CA619CEC474057790261A7E756C00BF6BAA019E74740F559AF33CFE456C0C3013E8919E747404F74023FCFE456C006AFA7678BE34740B2E4E08824E256C0F846BE5CD5E247406EE6EB8D35D756C0B1524145D5E247406EE6EB8D35D756C01C00BBE4C9E4474000CC102274D456C0D40B3ECDC9E44740DC51521674D456C0E2E0777874E7474099DC836BC9D156C0E2E0777874E74740BD564277C9D156C03B72A43330E34740C40AB77C24C656C0883DFE1C30E34740A090F87024C656C09BECFA6074E747406D5DC53DF1C656C09BECFA6074E7474049E30632F1C656C07147EE9F5DEB474098535D1B85C556C07147EE9F5DEB474098535D1B85C556C0FD0B4E8E4CEA474097CA36CB40B956C04AD7A7774CEA4740745078BF40B956C00E164ED2FCEF4740ACCABE2B02B856C00E164ED2FCEF4740ACCABE2B02B856C08B72C4B535EE47407F4B00FE29B556C08B72C4B535EE47407F4B00FE29B556C020C54A1641EC47408B46883C13B156C06E90A4FF40EC47408B46883C13B156C0D93D1E9F35EE47408ABD61ECCEAC56C0D93D1E9F35EE474077853E5846AC56C08ACDC7B5A1EF4740FAF02C4146AC56C0AF2BC13D2AF847401DAA29C93AA656C0803FA14385F8474077C47CD43AA656C036165E937FF547403C1C1318A19C56C083E1B77C7FF5474019A2540CA19C56C0E0B9F770C9FC47406812ABF5349B56C0E0B9F770C9FC47406812ABF5349B56C067A494C61E024840E1270EA0DF9D56C039B874CC79024840E2B034F023A256C0269C27E8400448407496598462A356C0A93FB1040806484016F6B4C3DFAD56C014ED2AA4FC074840ACD161742FB856C05BE1A7BBFC074840ACD161742FB856C067A494C61E1248405D610B8B9BB956C067A494C61E1248405D610B8B9BB956C047205ED72F1348400447B87F9BB956C034716193EB164840C0D1E9D4F0B656C034716193EB164840695C93C984B556C059CF5A1B740F4840ACD161742FB456C059CF5A1B740F4840ACD161742FB456C083E1B77C7F0D48406DA3A60213B156C083E1B77C7F0D4840411D458C0DB356C043CA4FAA7D114840D43549E21BB256C0BE0A3A6B01134840444717401DB256C0C5419D4DA214484007697C154FB356C006DDB98B8B14484062D45A3DCCB356C051CBC5CECA1648405589B2B794B556C07B359B221B164840CE9E15623FB656C047205ED72F1F484072EAB93BA1B856C04404D2B47A1E4840E97C1DDD2DC956C042D94A9EA11348404513831B84CA56C0F10236316E114840990CC7F399CC56C089D8BB9A970F48408890A97125D656C044300E2E1D094840874ECFBB31DC56C029102CFD3A064840F568AA27F3DC56C08C118942CB0848402446CF2D74E456C0B56D1805C1054840A5B679886BE456C0130B218C440C4840241A93B4D1E556C0854776001F0D4840FD05CC8D33EA56C0D9655309AA0E4840C425C79DD2EB56C00C6D4AC33A0F4840DA0D91894AED56C0A09394AAA30E484048ED348845ED56C09FB18A92EB124840738AE99D65EE56C0B36ECD678A154840E5F27A8BE2ED56C03A6865B1031948406EF200BBBFF656C0615E36F0591A4840BE95366623F956C092CD55F31C1E4840457930734BFD56C0E558839C9C1D4840E359DD45730057C01CC5837703224840B905A62E740057C023545F4CE92848401AE31EA6580357C06FC61FFB0F2B484092A86109B50357C08BC80B44AA2D48402B5899DF9F0857C0CB64DDE45C2D4840', 13556, 'P204');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000001A0000009E930CCE680A57C0DFCF9D123606484063DF215C4C0357C08EC561FB350648405A10255C4C0357C0571260A08508484079F14534CF0057C0B73F66A085084840F44D4034CF0057C068F0F1DE6E044840EA302C34CFFC56C00023AEC76E044840E0D02634CFFC56C0D19F128985004840624C808924FE56C068B0BD06ECFE47402B94DF3FCF0057C0D716B706ECFE474063FE7F4BCF0057C0FD4769DF02FB4740611570DF0D0257C0A33366DF02FB4740E4F76ADF0D0257C0650EEF3A47F7474019FB59734C0357C060FAEB3A47F74740D928FE7E4C0357C098239D9B52F54740080ABBAD021857C0022705CA52F547400B847F96021857C07DD1046E7A024840A832B2BDEB1357C050060F6E7A02484087E8B4BDEB1357C092D45D0D6F0448409A300D62A70F57C04CC21AF66E0448408BDB1262A70F57C0BE098FB785084840FAB2AE56F10E57C09FCF90B785084840F26F5F62F10E57C0F5C16829A20F48404D9B5F12AD0A57C02CB12512A20F484033BD5512AD0A57C0A3709BB7850848407BC60FCE680A57C0B2644EA0850848409E930CCE680A57C0DFCF9D1236064840', 13557, 'P205');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000002900000039B04F6DAE8856C0EF9AC8F0590E48403411C4E4258856C025663F68D10D4840832EF6D1EA8756C06D876E657F0D48402D2993DDEA8756C04172E4ED070648406F135D05688656C050E086E25105484058AB5B05688656C038EB71D1400448406DF68455AC9256C09476A2E840044840019C8255AC9256C07C5B2CCC79024840F828E8B0A69756C0FC7C20CC790248408484EAB0A69756C0FB9696E840044840FF12283F8A9856C0A87794E8400448403AC8283F8A9856C006F11E71C9044840E70CF205B29556C01402C30A6306484010C6F605B29556C03334AF43F10948407B867ED9B7A056C0E4D29443F10948404278DBCDB7A056C06EB31D71C90C4840F4E0BE5926A056C04ED49D22AE0C4840ACC9FF7C279F56C09437A022AE0C484050CF40A0289E56C0A392DCB0910D4840815A7C26F39C56C0513C5E62760D48406AB43D980F9C56C024D67B08A50C4840ECC0C47B489A56C0829F6462760D4840CB0FAD6A379956C0E81D85A5DB0C4840DB4EB9BDCE9856C094D457EE9B0C4840E28188068F9856C0B74EA44B0A0C484035D57FCC219856C00C1F497AC10B4840FFCC7A2FEB9756C03FA9F6E2E50B4840A7CDFCF9F99656C08C53299A250C484027DA2790F69556C0953081CE370C48408A58E664DC9456C0856215912D0D484042B911FBD89356C0C6A89D7C7F0D484040ECCECFBE9256C002E8BD22AE0C4840B4333770929156C0480849AB360D4840B38AF9E1AE9056C041B6F576240D4840B7785385F98E56C00EE8AD19B60D484037B6FBCCDA8D56C09A225BE5A30D48409348745D7C8C56C048DE6082DA0D4840659BC6704B8B56C0EE2DEE0A630E48405AA4F9BCA88956C0CFA8C153230E4840B3EE83C1248956C0D24CF30A630E484039B04F6DAE8856C0EF9AC8F0590E4840', 13558, 'P206');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000006000000BEA4315A47495DC0F91400E319604540342E1C08C96C5DC004392861A635454084F57F0EF36F5DC0D50451F701004540DC80CF0F23405DC0D50451F701004540DC80CF0F23405DC0F91400E319604540BEA4315A47495DC0F91400E319604540', 31245, 'PARADISE NORTH MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000600000084F57F0EF36F5DC0D50451F701004540DC80CF0F23405DC0D50451F701004540DC80CF0F23405DC0C9022670EBAA444078978BF84E505DC0C9022670EBAA4440327216F6B4715DC007D3307C44E4444084F57F0EF36F5DC0D50451F701004540', 31246, 'PARADISE SOUTH MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000005000000A9A44E40132D5BC0CF49EF1B5F174040DE1FEF552B155BC0EA78CC40651440408D9C853DED165BC03997E2AAB2D73F40A8C64B37892F5BC08655BC9179DC3F40A9A44E40132D5BC0CF49EF1B5F174040', 31162, 'PLAYAS TEMPORARY MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000B00000004FF5BC98E9D57C0309E4143FF8C3E40520FD1E80E0057C0309E4143FF8C3E40825660C8EAF656C0118DEE20767E3E40833463D174F456C02046088F36663E40825660C8EAF656C04DA1F31ABB4C3E40520FD1E80E0057C08C84B69C4B393E4004FF5BC98E9D57C08C84B69C4B393E406397A8DE1AA857C04DA1F31ABB4C3E40D3D9C9E028A957C02046088F36663E406397A8DE1AA857C0118DEE20767E3E4004FF5BC98E9D57C0309E4143FF8C3E40', 25645, 'POLK 1 ORBIT');
INSERT INTO postgis.sua_airspace VALUES ('0103000020C00D00000100000005000000202922C3AAC255C054CC9C89440446409464C2D4BBDF55C09AAECC00BC0B4640CA0457D4BBEB55C0D2BBC2CC88A8454032D81E07EFCE55C0F719BC5411A14540202922C3AAC255C054CC9C8944044640', 3520, 'R6903');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000005000000E0675C3810E853C0228E75711BA944404BDDDFEA4AEC53C0A4575E4DF9A14440505CE910138E53C083797E07F505444040FB9122328A53C0A8A9656B7D0D4440E0675C3810E853C0228E75711BA94440', 12060, 'RANDOM AIR REFUELING FKL-THS');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000500000075CDE49B6D2A5DC0EAE74D452A00434031CEDF8442B05CC0EAE74D452A004340D9B11188D70B5DC0936FB6B931F14240DAFE959526355DC0936FB6B931F1424075CDE49B6D2A5DC0EAE74D452A004340', 24863, 'REVEILLE SOUTH MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000080000000A2E56D460345CC0DE76A1B94E6B4040CF4E0647C92D5CC01B0DE02D906C40406FF085C954135CC08BC3995FCD5140406FF085C954135CC08C4AEA0434394040A3409FC8932E5CC08C4AEA0434394040E7525C55F62D5CC067EDB60BCD3D404085251E5036395CC067EDB60BCD3D40400A2E56D460345CC0DE76A1B94E6B4040', 4525, 'SELLS 1 MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000080000002619390B7B3A5DC00000000000404240A7052FFA0A325DC000000000004042400551F70148135DC0809F71E1400C4240293FA9F6E9F85CC0A4C2D84290D341405C8FC2F528145DC036B05582C5A941407593180456145DC01D3D7E6FD3BB4140A4DFBE0E9C195DC0670A9DD7D8C941402619390B7B3A5DC00000000000404240', 6055, 'SHOSHONE MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000080000007C444C89248458C029CB10C7BA6C4340DA5548F9497558C0DFF8DA334B66434083177D05697458C09C508880436043405B25581CCE7858C02BFBAE08FE3F43402766BD18CA8B58C0C3BB5CC47742434092AE997CB38B58C07DCB9C2E8B594340BF9A0304738858C0E57E87A2406743407C444C89248458C029CB10C7BA6C4340', 30312, 'SMOKY IFR RACETRACK');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000C0000005704FF5BC96C54C0E8A4F78DAF814040B9533A58FF6354C073A25D8594874040DB8AFD65F75C54C0CA6C904946824040C58F31772D2754C0D044D8F0F4224040CD069964E42454C0202922C32A164040FD304278B42754C0C0EC9E3C2C084040FB743C66A02C54C02046088F36024040BAA0BE654E3354C0B0AC342905014040412B3064753954C0CC7F48BF7D0540406891ED7C3F6F54C0CF66D5E76A674040F870C971A77054C09D8026C2867340405704FF5BC96C54C0E8A4F78DAF814040', 25650, 'STEWART ORBIT');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000500000099F04BFDBC0F55C030F0DC7BB89844401BF5108DEEF454C03B8DB454DE96444012C2A38D23FC54C0E36BCF2C0968444000000000001855C0C80C54C6BF6F444099F04BFDBC0F55C030F0DC7BB8984440', 31463, 'STINGER TEMPORARY MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000050000005C3D27BD6F065DC0EE5A423EE81D4140C959D8D30EEF5CC0EE5A423EE81D414050C24CDBBFF25CC0DD240681951741405C3D27BD6F065DC0DD240681951741405C3D27BD6F065DC0EE5A423EE81D4140', 6065, 'SUNDANCE MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000C0000007FA4880CAB6E5BC06DC5FEB27BF23F406D1CB1169F7A5BC0BD18CA8976CD3F405C8FC2F528785BC03108AC1C5AB43F40764F1E166A735BC010CCD1E3F7AE3F404E7ADFF8DA6B5BC051BD35B055BA3F40FA68CC7FA3665BC080BBECD79DB83F40E256410C74615BC00EC0064488B33F40A1E4C40D2E5C5BC0B3035372F3AC3F404A9869FB57585BC040FB912232A43F40CFDA6D179A435BC098C0ADBB79CA3F40CFDA6D179A435BC0C79DD2C1FADF3F407FA4880CAB6E5BC06DC5FEB27BF23F40', 4565, 'TOMBSTONE A MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000008000000AC5626FC52215BC077DB85E63AD53F40693A3B191C0D5BC077DB85E63AD53F40693A3B191C0D5BC0BF9A030473543F40A2B437F8C2565BC0BF9A030473543F40A2B437F8C2565BC07C0A80F10C823F40878A71FE263E5BC0F19D98F562A83F409279E40F06325BC07AC2120F28B33F40AC5626FC52215BC077DB85E63AD53F40', 4570, 'TOMBSTONE B MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000009000000BC0512143F805BC0EDF5EE8FF7E23F40BDE3141DC97D5BC0F819170E84EC3F407EC6850321715BC0DD5ED218ADF33F40CFDA6D179A435BC0C79DD2C1FADF3F40614F3BFC352F5BC00CCD751A69D93F40693A3B191C0D5BC077DB85E63AD53F40693A3B191C0D5BC0BF9A030473543F40BC0512143F805BC0BF9A030473543F40BC0512143F805BC0EDF5EE8FF7E23F40', 4575, 'TOMBSTONE C MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000700000030BB270F0BD15CC02F51BD35B0594140EE08A7052F805CC0E23B31EBC5544140EE08A7052F805CC0D3872EA86F3141401904560E2DA05CC060EAE74D451E41403DF20703CFDF5CC060EAE74D451E41400DA661F888DA5CC08CD651D50429414030BB270F0BD15CC02F51BD35B0594140', 6070, 'TURTLE MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000090000000395F1EF33E058C044DD0720B5514340ADA3AA09A2AE58C01D03B2D7BB2B43402E90A0F831A658C0BD8C62B9A51543400C59DDEA39AD58C0AD6EF59CF4FE4240D97745F0BFBD58C053793BC269F942409279E40F06F058C067EDB60BCD214340704221020EF758C002F1BA7EC13643402237C30DF8EE58C012143FC6DC4D43400395F1EF33E058C044DD0720B5514340', 25463, 'ZKC-1');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000005000000C4CE143AAF655CC08B71FE2614C2414029ED0DBE30535CC00B0C59DDEA954140DFE00B93A97C5CC0E59B6D6E4C6B4140EB39E97DE38D5CC0DE9387855A974140C4CE143AAF655CC08B71FE2614C24140', 25467, 'ZLA-3');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000005000000EE77280AF43F57C0E9F17B9BFE544240D26F5F07CE2957C02D431CEBE22A42407FA4880CAB6A57C09357E71890D541402B6A300DC37F57C080608E1EBFFF4140EE77280AF43F57C0E9F17B9BFE544240', 25472, 'ZME-1');


--
-- TOC entry 4521 (class 0 OID 51782)
-- Dependencies: 258
-- Data for Name: sua_airspace_type; Type: TABLE DATA; Schema: postgis; Owner: -
--

INSERT INTO postgis.sua_airspace_type VALUES ('W', 'Warning Area');
INSERT INTO postgis.sua_airspace_type VALUES ('R', 'Restricted Area');
INSERT INTO postgis.sua_airspace_type VALUES ('M', 'Military Operations Area');
INSERT INTO postgis.sua_airspace_type VALUES ('P', 'Prohibited Area');
INSERT INTO postgis.sua_airspace_type VALUES ('L', 'Alert Area');
INSERT INTO postgis.sua_airspace_type VALUES ('A', 'ATCAA');
INSERT INTO postgis.sua_airspace_type VALUES ('I', 'Instrument Route');
INSERT INTO postgis.sua_airspace_type VALUES ('V', 'Visual Route');
INSERT INTO postgis.sua_airspace_type VALUES ('S', 'Slow Route');
INSERT INTO postgis.sua_airspace_type VALUES ('B', 'Military Route (Refueling)');
INSERT INTO postgis.sua_airspace_type VALUES ('O', 'Other');
INSERT INTO postgis.sua_airspace_type VALUES ('T', 'Refueling Track');


--
-- TOC entry 4520 (class 0 OID 51777)
-- Dependencies: 257
-- Data for Name: sua_sched_status; Type: TABLE DATA; Schema: postgis; Owner: -
--

INSERT INTO postgis.sua_sched_status VALUES ('W', 'Waiting to Start');
INSERT INTO postgis.sua_sched_status VALUES ('P', 'Pending Approval');
INSERT INTO postgis.sua_sched_status VALUES ('H', 'Activated for Use');


--
-- TOC entry 4514 (class 0 OID 17504)
-- Dependencies: 230
-- Data for Name: taf; Type: TABLE DATA; Schema: postgis; Owner: -
--



--
-- TOC entry 4523 (class 0 OID 111785)
-- Dependencies: 260
-- Data for Name: taf_forecast; Type: TABLE DATA; Schema: postgis; Owner: -
--



--
-- TOC entry 4518 (class 0 OID 50311)
-- Dependencies: 255
-- Data for Name: winds; Type: TABLE DATA; Schema: postgis; Owner: -
--



--
-- TOC entry 4347 (class 2606 OID 17470)
-- Name: airspace_ob_ele airspace_ob_ele_pkey; Type: CONSTRAINT; Schema: postgis; Owner: -
--

ALTER TABLE ONLY postgis.airspace_ob_ele
    ADD CONSTRAINT airspace_ob_ele_pkey PRIMARY KEY (airspace_ob_ele_id);


--
-- TOC entry 4357 (class 2606 OID 17502)
-- Name: circles circles_pkey; Type: CONSTRAINT; Schema: postgis; Owner: -
--

ALTER TABLE ONLY postgis.circles
    ADD CONSTRAINT circles_pkey PRIMARY KEY (prod_id, rep_num);


--
-- TOC entry 4379 (class 2606 OID 187550)
-- Name: current current_pkey; Type: CONSTRAINT; Schema: postgis; Owner: -
--

ALTER TABLE ONLY postgis.current
    ADD CONSTRAINT current_pkey PRIMARY KEY (rep_time, prod_id, rep_num);


--
-- TOC entry 4349 (class 2606 OID 17472)
-- Name: fisb_products fisb_products_pkey; Type: CONSTRAINT; Schema: postgis; Owner: -
--

ALTER TABLE ONLY postgis.fisb_products
    ADD CONSTRAINT fisb_products_pkey PRIMARY KEY (fisb_product_id);


--
-- TOC entry 4363 (class 2606 OID 21056)
-- Name: graphics graphics_pkey; Type: CONSTRAINT; Schema: postgis; Owner: -
--

ALTER TABLE ONLY postgis.graphics
    ADD CONSTRAINT graphics_pkey PRIMARY KEY (rep_num, prod_id, alt);


--
-- TOC entry 4351 (class 2606 OID 194272)
-- Name: metar metar_pkey; Type: CONSTRAINT; Schema: postgis; Owner: -
--

ALTER TABLE ONLY postgis.metar
    ADD CONSTRAINT metar_pkey PRIMARY KEY (stn_call, ob_date);


--
-- TOC entry 4353 (class 2606 OID 17480)
-- Name: overlay_geo_opt overlay_geo_opt_pkey; Type: CONSTRAINT; Schema: postgis; Owner: -
--

ALTER TABLE ONLY postgis.overlay_geo_opt
    ADD CONSTRAINT overlay_geo_opt_pkey PRIMARY KEY (overlay_geo_opt_id);


--
-- TOC entry 4355 (class 2606 OID 194276)
-- Name: pirep pirep_pkey; Type: CONSTRAINT; Schema: postgis; Owner: -
--

ALTER TABLE ONLY postgis.pirep
    ADD CONSTRAINT pirep_pkey PRIMARY KEY (rep_time, stn_call);


--
-- TOC entry 4361 (class 2606 OID 194278)
-- Name: sigairmet sigairmet_pkey; Type: CONSTRAINT; Schema: postgis; Owner: -
--

ALTER TABLE ONLY postgis.sigairmet
    ADD CONSTRAINT sigairmet_pkey PRIMARY KEY (prod_id, rep_num, stn_call);


--
-- TOC entry 4375 (class 2606 OID 194296)
-- Name: stations stations_pkey1; Type: CONSTRAINT; Schema: postgis; Owner: -
--

ALTER TABLE ONLY postgis.stations
    ADD CONSTRAINT stations_pkey1 PRIMARY KEY (stn_call);


--
-- TOC entry 4369 (class 2606 OID 51039)
-- Name: sua_airspace sua_airspace_pkey; Type: CONSTRAINT; Schema: postgis; Owner: -
--

ALTER TABLE ONLY postgis.sua_airspace
    ADD CONSTRAINT sua_airspace_pkey PRIMARY KEY (airsp_id);


--
-- TOC entry 4373 (class 2606 OID 51786)
-- Name: sua_airspace_type sua_airspace_type_pkey; Type: CONSTRAINT; Schema: postgis; Owner: -
--

ALTER TABLE ONLY postgis.sua_airspace_type
    ADD CONSTRAINT sua_airspace_type_pkey PRIMARY KEY (sua_airsp_type);


--
-- TOC entry 4365 (class 2606 OID 72147)
-- Name: sua sua_pkey; Type: CONSTRAINT; Schema: postgis; Owner: -
--

ALTER TABLE ONLY postgis.sua
    ADD CONSTRAINT sua_pkey PRIMARY KEY (rep_num, sched_status);


--
-- TOC entry 4371 (class 2606 OID 51781)
-- Name: sua_sched_status sua_sched_status_pkey; Type: CONSTRAINT; Schema: postgis; Owner: -
--

ALTER TABLE ONLY postgis.sua_sched_status
    ADD CONSTRAINT sua_sched_status_pkey PRIMARY KEY (sua_status);


--
-- TOC entry 4377 (class 2606 OID 194320)
-- Name: taf_forecast taf_forecast_pkey; Type: CONSTRAINT; Schema: postgis; Owner: -
--

ALTER TABLE ONLY postgis.taf_forecast
    ADD CONSTRAINT taf_forecast_pkey PRIMARY KEY (stn_call, rep_time, taf_line_number);


--
-- TOC entry 4359 (class 2606 OID 194318)
-- Name: taf taf_pkey; Type: CONSTRAINT; Schema: postgis; Owner: -
--

ALTER TABLE ONLY postgis.taf
    ADD CONSTRAINT taf_pkey PRIMARY KEY (stn_call, rep_time);


--
-- TOC entry 4367 (class 2606 OID 194322)
-- Name: winds winds_pkey; Type: CONSTRAINT; Schema: postgis; Owner: -
--

ALTER TABLE ONLY postgis.winds
    ADD CONSTRAINT winds_pkey PRIMARY KEY (stn_call, issue_date);


-- Completed on 2021-08-14 14:56:33 EDT

--
-- PostgreSQL database dump complete
--

