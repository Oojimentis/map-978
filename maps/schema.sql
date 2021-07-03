--
-- PostgreSQL database dump
--

-- Dumped from database version 12.7 (Ubuntu 12.7-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.7 (Ubuntu 12.7-0ubuntu0.20.04.1)

-- Started on 2021-07-03 16:02:01 EDT

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
-- TOC entry 8 (class 2615 OID 16394)
-- Name: postgis; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA postgis;


ALTER SCHEMA postgis OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 221 (class 1259 OID 17412)
-- Name: airspace_ob_ele; Type: TABLE; Schema: postgis; Owner: postgres
--

CREATE TABLE postgis.airspace_ob_ele (
    airspace_ob_ele_id integer NOT NULL,
    airspace_ob_ele_desc character varying NOT NULL
);


ALTER TABLE postgis.airspace_ob_ele OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17442)
-- Name: circles; Type: TABLE; Schema: postgis; Owner: postgres
--

CREATE TABLE postgis.circles (
    bot geometry NOT NULL,
    top geometry NOT NULL,
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
    r_lat integer
);


ALTER TABLE postgis.circles OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17490)
-- Name: fisb_products; Type: TABLE; Schema: postgis; Owner: postgres
--

CREATE TABLE postgis.fisb_products (
    fisb_product_id integer NOT NULL,
    fisb_product_desc character varying NOT NULL
);


ALTER TABLE postgis.fisb_products OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 18616)
-- Name: graphics; Type: TABLE; Schema: postgis; Owner: postgres
--

CREATE TABLE postgis.graphics (
    coords geometry,
    alt integer NOT NULL,
    ob_ele character varying,
    rep_num integer NOT NULL,
    prod_id integer NOT NULL,
    start_date character varying,
    stop_date character varying,
    geo_overlay_opt integer NOT NULL,
    stn_call character varying(5),
    obj_par_val integer,
    obj_param_type integer,
    object_qualifier integer,
    obj_labelt character varying(80),
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


ALTER TABLE postgis.graphics OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 18622)
-- Name: metar; Type: TABLE; Schema: postgis; Owner: postgres
--

CREATE TABLE postgis.metar (
    stn_call character varying NOT NULL,
    ob_date character varying NOT NULL,
    winddir character varying(5),
    temp character varying(5),
    dewp character varying(5),
    visby character varying(5),
    windsp character varying,
    altimeter character varying,
    hrly_precip character varying(5),
    slp character varying(10),
    windvar character varying(10),
    windgust character varying(10)
);


ALTER TABLE postgis.metar OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 18692)
-- Name: nexrad; Type: TABLE; Schema: postgis; Owner: postgres
--

CREATE TABLE postgis.nexrad (
    intensity integer NOT NULL,
    coords geometry NOT NULL,
    altitude integer NOT NULL,
    prod_id integer NOT NULL,
    block_num integer NOT NULL,
    maptime character varying(6) NOT NULL,
    ice_sld integer,
    ice_prob integer,
    seq integer
);


ALTER TABLE postgis.nexrad OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 17431)
-- Name: nexrad_counter_seq; Type: SEQUENCE; Schema: postgis; Owner: postgres
--

CREATE SEQUENCE postgis.nexrad_counter_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE postgis.nexrad_counter_seq OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 17482)
-- Name: overlay_geo_opt; Type: TABLE; Schema: postgis; Owner: postgres
--

CREATE TABLE postgis.overlay_geo_opt (
    overlay_geo_opt_id integer NOT NULL,
    overlay_geo_opt_desc character varying NOT NULL
);


ALTER TABLE postgis.overlay_geo_opt OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 18625)
-- Name: pirep; Type: TABLE; Schema: postgis; Owner: postgres
--

CREATE TABLE postgis.pirep (
    rep_type character varying(20) NOT NULL,
    fl_lev character varying(10),
    ac_type character varying(10),
    cloud character varying(50),
    weather character varying(50),
    temperature character varying(10),
    wind_spd_dir character varying(15),
    turbulence character varying(50),
    icing character varying(50),
    remarks character varying(100),
    location character varying(50),
    rep_time character varying(15) NOT NULL,
    stn_call character varying(5) NOT NULL
);


ALTER TABLE postgis.pirep OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 18629)
-- Name: sigairmet; Type: TABLE; Schema: postgis; Owner: postgres
--

CREATE TABLE postgis.sigairmet (
    prod_id integer NOT NULL,
    rep_num integer NOT NULL,
    text_data character varying,
    stn_call character varying(5) NOT NULL,
    rep_time character varying,
    segmented integer,
    notam_name character varying(20)
);


ALTER TABLE postgis.sigairmet OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 32564)
-- Name: stations; Type: TABLE; Schema: postgis; Owner: postgres
--

CREATE TABLE postgis.stations (
    coords geometry NOT NULL,
    stn_call character varying NOT NULL,
    stn_loc character varying NOT NULL,
    state character varying NOT NULL
);


ALTER TABLE postgis.stations OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 18635)
-- Name: sua; Type: TABLE; Schema: postgis; Owner: postgres
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


ALTER TABLE postgis.sua OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 18598)
-- Name: sua_airspace; Type: TABLE; Schema: postgis; Owner: postgres
--

CREATE TABLE postgis.sua_airspace (
    coords geometry NOT NULL,
    airsp_id integer NOT NULL,
    airsp_name character varying(35) NOT NULL
);


ALTER TABLE postgis.sua_airspace OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 18604)
-- Name: sua_airspace_type; Type: TABLE; Schema: postgis; Owner: postgres
--

CREATE TABLE postgis.sua_airspace_type (
    sua_airsp_type "char" NOT NULL,
    sua_airsp_desc character varying(35) NOT NULL
);


ALTER TABLE postgis.sua_airspace_type OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 18607)
-- Name: sua_sched_status; Type: TABLE; Schema: postgis; Owner: postgres
--

CREATE TABLE postgis.sua_sched_status (
    sua_status "char" NOT NULL,
    sua_status_desc character varying(35) NOT NULL
);


ALTER TABLE postgis.sua_sched_status OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 18638)
-- Name: taf; Type: TABLE; Schema: postgis; Owner: postgres
--

CREATE TABLE postgis.taf (
    issued character varying NOT NULL,
    current character varying,
    wind character varying,
    visby character varying,
    condx character varying,
    rep_time character varying NOT NULL,
    stn_call character varying(5) NOT NULL
);


ALTER TABLE postgis.taf OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 32403)
-- Name: taf_forecast; Type: TABLE; Schema: postgis; Owner: postgres
--

CREATE TABLE postgis.taf_forecast (
    stn_call character varying(5) NOT NULL,
    rep_time character varying NOT NULL,
    forecast character varying,
    taf_unknown_fl integer,
    taf_line_number integer NOT NULL
);


ALTER TABLE postgis.taf_forecast OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 18610)
-- Name: winds; Type: TABLE; Schema: postgis; Owner: postgres
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
    stn_call character varying(5) NOT NULL
);


ALTER TABLE postgis.winds OWNER TO postgres;

--
-- TOC entry 3938 (class 0 OID 17412)
-- Dependencies: 221
-- Data for Name: airspace_ob_ele; Type: TABLE DATA; Schema: postgis; Owner: postgres
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
-- TOC entry 3940 (class 0 OID 17442)
-- Dependencies: 223
-- Data for Name: circles; Type: TABLE DATA; Schema: postgis; Owner: postgres
--



--
-- TOC entry 3942 (class 0 OID 17490)
-- Dependencies: 225
-- Data for Name: fisb_products; Type: TABLE DATA; Schema: postgis; Owner: postgres
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
-- TOC entry 3947 (class 0 OID 18616)
-- Dependencies: 230
-- Data for Name: graphics; Type: TABLE DATA; Schema: postgis; Owner: postgres
--



--
-- TOC entry 3948 (class 0 OID 18622)
-- Dependencies: 231
-- Data for Name: metar; Type: TABLE DATA; Schema: postgis; Owner: postgres
--



--
-- TOC entry 3953 (class 0 OID 18692)
-- Dependencies: 236
-- Data for Name: nexrad; Type: TABLE DATA; Schema: postgis; Owner: postgres
--



--
-- TOC entry 3941 (class 0 OID 17482)
-- Dependencies: 224
-- Data for Name: overlay_geo_opt; Type: TABLE DATA; Schema: postgis; Owner: postgres
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
-- TOC entry 3949 (class 0 OID 18625)
-- Dependencies: 232
-- Data for Name: pirep; Type: TABLE DATA; Schema: postgis; Owner: postgres
--



--
-- TOC entry 3950 (class 0 OID 18629)
-- Dependencies: 233
-- Data for Name: sigairmet; Type: TABLE DATA; Schema: postgis; Owner: postgres
--



--
-- TOC entry 3771 (class 0 OID 16700)
-- Dependencies: 217
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: postgis; Owner: postgres
--



--
-- TOC entry 3955 (class 0 OID 32564)
-- Dependencies: 238
-- Data for Name: stations; Type: TABLE DATA; Schema: postgis; Owner: postgres
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
INSERT INTO postgis.stations VALUES ('0101000020E6100000EBC5504EB47152C08BFD65F7E4514440', 'K06A', 'Moton Field Municipal Airport-Tuskegee ', 'AL');
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
INSERT INTO postgis.stations VALUES ('0101000020E61000006666666666A652C08369183E22424440', 'K47N', 'Manville ', 'NJ');
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
INSERT INTO postgis.stations VALUES ('0101000020E6100000F5673F5244D452C0EACF7EA488084540', 'KHNK', 'Hancock VOR ', 'NY');
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
INSERT INTO postgis.stations VALUES ('0101000020E6100000C1CAA145B6DB54C07F6ABC7493884640', 'KAPE', 'Appleton ', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E61000004E62105839E454C0931804560E6D4340', 'KAMT', 'Alexander Salamon Airport-West Union', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AAEA54C08369183E22824440', 'KFBC', 'Flag City', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F5673F5244F454C0B79C4B7155B54340', 'KTIR', 'Wilmington-RFC ', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E610000072FE2614220255C0E3FC4D2844244440', 'KROD', 'Rosewood VOR', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E61000005839B4C8760E55C079E9263108CC4340', 'KMGY', 'Dayton Wright Brothers Airport', 'OH');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A99999999C952C09A99999999194440', 'KNXX', 'Naval Air Station Joint Reserve Base Willow Grove', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AACA52C07D96E7C1DDBD4440', 'KHAW', 'Hawley', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AADA52C01630815B77974440', 'K7TB', 'Tobyhanna', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F4FDD478E9DE52C07F6ABC7493484440', 'KJVU', 'Allentown Queen', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E61000000B98C0ADBBEB52C04963B48EAA4A4440', 'KETX', 'East Texas VOR ', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C2340C1F11F152C06666666666664440', 'K22N', 'Lehighton/Arner Mem', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000BBB88D06F0F652C083C0CAA145A64440', 'KWBW', 'Wilkes-Barre Wyoming Valley Airport', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000289B728577F752C07D96E7C1DDFD4340', 'K40N', 'Coatesville ', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000EC51B81E851753C0742497FF905A4440', 'KZER', 'Schuylkill County Airport-Pottsville', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CDCCCCCCCC1C53C07D96E7C1DDDD4440', 'KN27', 'Towanda', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F5673F52444453C06666666666264440', 'KHAR', 'Harrisburg', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AA5A53C0B0C91AF510914440', 'KLHV', 'William T. Piper Memorial Airport-Lock Haven ', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C1CAA145B65B53C0E7FBA9F1D2DD4340', 'KRYT', 'Fountain Dale', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E610000066666666667653C0CDCCCCCCCC6C4440', 'KCTP', 'State College-WFO ', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E610000066666666667653C0CDCCCCCCCC6C4440', 'KRHA', 'State Colleg-RFC', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E61000008E01D9EBDD7D53C00000000000C04440', 'KSLT', 'Slate Run', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E610000000000000008053C0B79C4B7155754440', 'KCCX', 'Rush-St College', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E61000005A643BDF4F8553C03333333333734440', 'KPSB', 'Mid-State Regional Airport-Philipsburg ', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AA9A53C06666666666864440', 'KN97', 'Clearfield', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E61000008048BF7D1DDC53C0789CA223B99C4440', 'KAXQ', 'Clarion County Airport', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000E09C11A5BDE953C0D7C0560916FB4340', 'KVVS', 'Joseph A. Hardy Connellsville Airport', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CCEEC9C342F553C0C286A757CA1A4440', 'KFWQ', 'Rostraver Airport-Monongahela ', 'PA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000637FD93D790854C0EC2FBB270FF34340', 'KWAY', 'Greene County Airport-Waynesburg ', 'PA');
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
INSERT INTO postgis.stations VALUES ('0101000020E6100000CDCCCCCCCC2C54C01D03B2D7BB1B4040', 'K49J', 'Hilton Head ', 'SC');
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
INSERT INTO postgis.stations VALUES ('0101000020E61000003ECBF3E0EE5E53C07D96E7C1DD7D4340', 'KLWX', 'Sterling ', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E61000008E01D9EBDD6D53C04963B48EAA4A4340', 'KW66', 'Warrenton', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000289B7285777753C0B0C91AF510514340', 'KCSN', 'Cassanova VOR', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000F2D24D6210A053C04C37894160554340', 'KW45', 'Luray ', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E61000003ECBF3E0EEBE53C09A99999999794240', 'KVQN', 'Volens', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E61000003F355EBA49F453C09A99999999F94240', 'KHSP', 'Ingalls Field-Hot Springs', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C2340C1F111154C08369183E22824240', 'KFCX', 'Roanoke-Floyd County ', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E61000009A999999991954C09A99999999994240', 'KRNK', 'Roanoke-Blacksbg', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000508D976E127354C0D578E92631884240', 'K6V3', 'Richlands', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000645DDC46038854C092CB7F48BF9D4240', 'KGDY', 'Grundy Municipal Airport', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E6100000CBA145B6F3CD54C0C1CAA145B6534240', 'K0VG', 'Jonesville', 'VA');
INSERT INTO postgis.stations VALUES ('0101000020E61000000000000000E051C012143FC6DC7D4640', 'KVT1', 'Canaan', 'VT');
INSERT INTO postgis.stations VALUES ('0101000020E61000003ECBF3E0EEFE51C03333333333534640', 'KVT2', 'West Burke', 'VT');
INSERT INTO postgis.stations VALUES ('0101000020E6100000C2340C1F110152C0545227A089484640', 'K6B8', 'Lyndonville ', 'VT');
INSERT INTO postgis.stations VALUES ('0101000020E6100000289B7285770752C05036E50AEF6E4540', 'KMNW', 'Wilmington', 'VT');
INSERT INTO postgis.stations VALUES ('0101000020E610000072FE2614222252C0ACADD85F76774640', 'KJAY', 'Jay Peak ', 'VT');
INSERT INTO postgis.stations VALUES ('0101000020E610000033333333333352C05036E50AEF8E4540', 'K8B3', 'Ball Mountain', 'VT');
INSERT INTO postgis.stations VALUES ('0101000020E610000066666666663652C01630815B77774540', 'KWDO', 'West Dover', 'VT');
INSERT INTO postgis.stations VALUES ('0101000020E61000008E01D9EBDD3D52C0EACF7EA488084640', 'KSOL', 'South Lincoln', 'VT');
INSERT INTO postgis.stations VALUES ('0101000020E61000005BCEA5B8AA4A52C08369183E22424640', 'KCXX', 'Colchester 88D', 'VT');
INSERT INTO postgis.stations VALUES ('0101000020E610000000000000005052C0B0C91AF510714540', 'K5B5', 'Bennington', 'VT');
INSERT INTO postgis.stations VALUES ('0101000020E61000003C4ED1915CAE5EC08FC2F5285C1F4840', 'KCVV', 'Coupeville-Penn Cove ', 'WA');
INSERT INTO postgis.stations VALUES ('0101000020E610000024287E8CB93754C0AEB6627FD91D4340', 'KSXL', 'Summersville Airport', 'WV');


--
-- TOC entry 3951 (class 0 OID 18635)
-- Dependencies: 234
-- Data for Name: sua; Type: TABLE DATA; Schema: postgis; Owner: postgres
--



--
-- TOC entry 3943 (class 0 OID 18598)
-- Dependencies: 226
-- Data for Name: sua_airspace; Type: TABLE DATA; Schema: postgis; Owner: postgres
--

INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000D000000A514747B491B59C0C66D3480B700404066DAFE95951A59C0022B8716D90A40406440F67AF72159C0689604A8A935404065FCFB8C0B1D59C0E36BCF2C09584040B77A4E7ADF0C59C055302AA9137C40402ECA6C9049EE58C09D8026C2868F4040E4310395F1CD58C04AD235936F7E4040A6F27684D3BE58C07172BF435160404096218E7571B758C0A1D634EF38394040C74B378941BA58C0BABDA4315A174040F697DD9387BF58C0D21DC4CE140640400E4FAF9465F058C086AC6EF59CAC3F40A514747B491B59C0C66D3480B7004040', 25400, 'ABILENE');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000C000000F70489EDEE6E51C0795C548B88884440187CF54C8A6351C0B58993FB1D784440EA33B10A654051C0F176CE609DB74440E9FF0BBAF31D51C079EBFCDB65F144400AFC3CA1B2F850C04919CCBADA2C4540F657D98871D350C046BF6CF1DF674540FAFF82EEDCA750C091E398767BA3454007342262947B50C09BD31BA496DB4540E17A14AE478550C0855E7F129FE945400000000000E050C087A3AB74777745402A38BC20222A51C00000000000004540F70489EDEE6E51C0795C548B88884440', 30504, 'AR80(NE)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000009000000E17A14AE478550C0855E7F129FE945400000000000E050C087A3AB74777745402A38BC20222A51C000000000000045407A17EFC7ED2451C0A703594FADF74440974D25A8060051C0C50DAE6F163345407FE3C6881FDB50C031FB86D3936E454099695611C9AD50C0B08ADC781CA945408BA141AF647F50C05C36DF2D35E34540E17A14AE478550C0855E7F129FE94540', 30547, 'AR80(SW)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000D000000A39410ACAA1A57C0AC8F87BEBB3B42405D6BEF53559557C0DFC2BAF1EEEE414009FB761211D157C0FA7E6ABC74CB4140A39410ACAA0A58C0AC8F87BEBB9B414000000000005058C0CDCCCCCCCC8C414000000000009058C04529215855754140CFA3E2FF0E8D58C0ED629AE95E60414078190F00E64C58C099751085E076414014BCD7FFEF0658C0AA413D224B874140BC8C0700B3CB57C0D74FFF59F3B44140F8C610001C9057C05BE1A7BBFCDA4140FB100A00C41557C00A53EF0456284240A39410ACAA1A57C0AC8F87BEBB3B4240', 25540, 'AR112H(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000D000000A39410ACAA1A57C0AC8F87BEBB3B42405D6BEF53559557C0DFC2BAF1EEEE414009FB761211D157C0FA7E6ABC74CB4140A39410ACAA0A58C0AC8F87BEBB9B414000000000005058C0CDCCCCCCCC8C414000000000009058C04529215855754140CFA3E2FF0E8D58C0ED629AE95E60414078190F00E64C58C099751085E076414014BCD7FFEF0658C0AA413D224B874140BC8C0700B3CB57C0D74FFF59F3B44140F8C610001C9057C05BE1A7BBFCDA4140FB100A00C41557C00A53EF0456284240A39410ACAA1A57C0AC8F87BEBB3B4240', 25541, 'AR112H(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000090000008C48145AD68259C0691EC022BFB84240EE539FF5BA7D59C0B3A0E69AB89F4240174850FC18FD58C0C383C19030D44240E613C31F0F7B58C017B435C75E08434012DC48D9A2E457C08873C3A519674340F9A23D5E48EA57C0CD3FFA264D7943406ABC7493188058C096438B6CE71B4340A7EA1ED95C0059C0BE9F1A2FDDEC42408C48145AD68259C0691EC022BFB84240', 23944, 'AR116(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000A000000F9A23D5E48EA57C0CD3FFA264D794340827170E9986858C0D505BCCCB02B43406ABC7493188058C096438B6CE71B4340A7EA1ED95C0059C0BE9F1A2FDDEC42408C48145AD68259C0691EC022BFB842401B683EE76E7E59C049B0822914A34240E8233A15BABB58C02D639EF06DEA424001B8A349F37858C059D878550C05434012DC48D9A2E457C0C6111038B7624340F9A23D5E48EA57C0CD3FFA264D794340', 23945, 'AR116(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000A000000CDCCCCCCCC6C52C0DFC2BAF1EEEE45400321FE06926552C00A7D55D39ADC45401981C2EA590052C02D55B31886374640F15C29159E9751C0300E2E1D73834640F4705D8C5C1151C04A11740F647F4740D6C743DFDD1D51C0BBD6DEA7AA8A47407061DD78776751C000000000000047402A38BC2022A251C0213D450E119146407061DD78770752C0BBD6DEA7AA4A4640CDCCCCCCCC6C52C0DFC2BAF1EEEE4540', 23996, 'AR212(NE)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000B0000002A38BC20228255C0DFC2BAF1EEAE404007342262147955C0AFA2F5A6D8994040077C7E18A13C55C09D83674293054140E81780A1A2F554C020AD7B759FA841400CC457E0D0D854C0E9DD0EC3FDD241401690ACB2A56754C0410B09185D424240CDCCCCCCCC6C54C0213D450E115142400000000000E054C05470784144E4414009FB7612110155C09A99999999B941405915E126A34755C0CDCCCCCCCC1441402A38BC20228255C0DFC2BAF1EEAE4040', 23999, 'AR216(NE)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000B000000CDCCCCCCCC6C54C0213D450E115142400000000000E054C05470784144E4414009FB7612110155C09A99999999B941405915E126A34755C0CDCCCCCCCC1441402A38BC20228255C0DFC2BAF1EEAE4040FFA72C54C87955C0B8FBC165BA9F4040F56393FC083E55C0B043EB973E03414004143477BEF754C0D118F730C5A94140033862D284D954C027DE019EB4D04140F20703CF3D6654C0562F1A8DD73D4240CDCCCCCCCC6C54C0213D450E11514240', 24000, 'AR216(SW)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000090000009DA04D0E9F2D54C01FF818AC388B424089AF1B5BF42E54C046008118328F424067EF8CB6AAAA54C01484E1123643424081936DE08EA854C0D0D61C7B5139424099EC44EE0E4E54C0C092AB58FC5F4240F70489EDEE4E54C066666666666642409A99999999A954C0EE0912DBDD3D4240909E2287887854C0AC8F87BEBB5B42409DA04D0E9F2D54C01FF818AC388B4240', 24047, 'AR328');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000B0000001EA9BEF38BE15DC01AA20A7F86054740F86C1D1CECDF5DC06D0A1AE9FBEE4640ECC039234A5F5DC049E30632F1F046400BB9AD8875665CC031EE06D15ADC4640F7F01B156E5F5CC05D328E91EC9F474014515D0A596D5DC0229FFC8282A84740D6C743DFDD6D5DC0448B6CE7FB994740CDCCCCCCCC6C5CC05C02F04FA990474009FB761211715CC09E7C7A6CCBF246400BB3D0CE695F5DC0E9263108AC0447401EA9BEF38BE15DC01AA20A7F86054740', 30544, 'AR338');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000009000000909E228788C859C01766A19DD37641405D6BEF5355C559C0927A4FE5B46141405D6BEF5355C559C03333333333134140A39410ACAACA59C0AC8F87BEBBFB40405C8FC2F528E459C0AC8F87BEBBFB40401F85EB51B8E659C0BBD6DEA7AA0A41409B75C6F7C5E659C0927A4FE5B46141407B14AE47E1E259C01766A19DD3764140909E228788C859C01766A19DD3764140', 24092, 'AR602');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000090000002A38BC2022E258C0DB1324B6BBBB3D402A38BC2022E258C00000000000803D4009FB761211D158C0F1B8A81611B13C40909E228788C858C06666666666863C40909E228788B058C0BE8575E3DD9D3C407061DD7877AF58C00F4757E9EECE3C40909E228788C058C0427A8A1C22A23D409A99999999C958C075ADBD4F55D53D402A38BC2022E258C0DB1324B6BBBB3D40', 24105, 'AR614');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000A000000C4D155BABBBB51C0CDCCCCCCCCCC4540F70489EDEECE51C0213D450E11D1454000000000000052C0EE0912DBDDDD45405D6BEF53554552C0BBD6DEA7AAEA4540909E2287884852C06666666666E64540D6C743DFDD4D52C04529215855B54540F70489EDEE4E52C0EE0912DBDD9D4540CDCCCCCCCCEC51C0795C548B888845402A38BC2022C251C0AC8F87BEBB9B4540C4D155BABBBB51C0CDCCCCCCCCCC4540', 24124, 'AR631');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000B0000007C7E18213C745AC0B0FECF61BEF8404085B18520076D5AC08A7615527EFA40403E3F8C101E655AC055302AA913F440405AD8D30E7F4F5AC07AFCDEA63FA34040CA1AF5108D505AC0151DC9E53F94404089247A19C5545AC0C9C859D8D38A40404772F90FE95D5AC024D1CB28968740408FE4F21FD2655AC03C4ED1915C8E40407AE40F069E7B5AC08AE5965643E2404062BEBC00FB785AC0AE2AFBAE08F240407C7E18213C745AC0B0FECF61BEF84040', 24142, 'AR644(N)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000B0000007C7E18213C745AC0B0FECF61BEF8404085B18520076D5AC08A7615527EFA40403E3F8C101E655AC055302AA913F440405AD8D30E7F4F5AC07AFCDEA63FA34040CA1AF5108D505AC0151DC9E53F94404089247A19C5545AC0C9C859D8D38A40404772F90FE95D5AC024D1CB28968740408FE4F21FD2655AC03C4ED1915C8E40407AE40F069E7B5AC08AE5965643E2404062BEBC00FB785AC0AE2AFBAE08F240407C7E18213C745AC0B0FECF61BEF84040', 24143, 'AR644(S)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000060000002A38BC2022525EC0213D450E11D14540A39410ACAA2A5EC00000000000E04540D6C743DFDD0D5EC03333333333334540994A3FE1EC275EC0A60EF27A302745403C2EAA4544345EC054707841442445402A38BC2022525EC0213D450E11D14540', 24144, 'AR645');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000700000009FB761211D15CC09A999999995941400000000000805CC045292158555541400000000000805CC0213D450E113141400000000000A05CC0EE0912DBDD1D41400000000000E05CC0EE0912DBDD1D4140A39410ACAADA5CC0795C548B8828414009FB761211D15CC09A99999999594140', 24149, 'AR649');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000006000000183F8D7BF3D25BC0F1BBE9961D9E4040206118B0E4CF5BC0F1BBE9961D9E40401041D5E8D5D45BC012F6ED24228A4040D87F9D9B36D85BC08236397CD2874040FD4AE7C3B3D65BC092770E65A8944040183F8D7BF3D25BC0F1BBE9961D9E4040', 4220, '2310A');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000040000005BB39597FCEE5CC054707841442441405BB39597FCEE5CC0EE0912DBDD1D4140F70489EDEEFE5CC0317E1AF7E61D41405BB39597FCEE5CC05470784144244140', 5815, '2501E');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000070000001F85EB51B8D25CC0BBD6DEA7AA8A4040E256410C74CE5CC0000000000080404052B81E85EBC55CC0CDCCCCCCCC6C40408EE6C8CA2FD25CC0CDCCCCCCCC6C40401F85EB51B8D25CC0AC8F87BEBB7B4040C119FCFD62D55CC0BBD6DEA7AA8A40401F85EB51B8D25CC0BBD6DEA7AA8A4040', 5870, '2512');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000010000000B81E85EB51345DC0795C548B88A84140B81E85EB51345DC04529215855954140BD8BF7E3F6335DC038A0A52BD892414060200890A13E5DC0EE0912DBDD8D4140B3B112F3AC4C5DC012F6ED24227241408EE6C8CA2F625DC0B1FCF9B6606B41408EE6C8CA2F625DC087A3AB7477674140C119FCFD62655DC0666666666666414085EB51B81E815DC066666666666641408EE6C8CA2F865DC0952C27A1F46941408EE6C8CA2F865DC012F6ED242282414028806264C95B5DC0B6696CAF05BB414028806264C95B5DC0D7A02FBDFDA141401A187959133B5DC0D7A02FBDFDA141401A187959133B5DC0795C548B88A84140B81E85EB51345DC0795C548B88A84140', 6140, '2515');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000009000000A54C6A68032D5EC0C03DCF9F36804140D15D126745235EC03333333333734140C7629B5434225EC0BBD6DEA7AA6A41406AF7AB00DF1C5EC012F6ED24226241409D2ADF3312205EC09A99999999594140B9FAB1497E215EC090BFB4A84F5241406AF7AB00DF245EC09A99999999594140DC10E335AF2A5EC09A99999999594140A54C6A68032D5EC0C03DCF9F36804140', 5875, '2516');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000007000000DC10E335AF2A5EC09A999999995941406AF7AB00DF245EC09A99999999594140B9FAB1497E215EC090BFB4A84F524140C7629B5434225EC0BBD6DEA7AA4A41406AF7AB00DF1C5EC04529215855354140A4703D0AD71F5EC06E88F19A57334140DC10E335AF2A5EC09A99999999594140', 5880, '2517');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000008000000FAB9A1293BC85DC087A3AB74770F4140E256410C74C65DC062F9F36DC10E4140BD8BF7E3F6C35DC0213D450E11094140B3B112F3ACC45DC0CDCCCCCCCC04414052B81E85EBCD5DC0AC8F87BEBB0B41407CF0DAA50DCC5DC04F0306499F0C4140E99C9FE238CA5DC0556D37C1370F4140FAB9A1293BC85DC087A3AB74770F4140', 5885, '2519');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000007000000ECAD4BC580C75DC0F0EA97650AEF4040EC6E39C580C75DC080F8DBFDC4D34040701C98D4D3F25DC0885CF3270000414040855B2EA5E75DC038AA082800004140A6592046F0D95DC046341A7AB80641407BF3AEAFF3C65DC0CC03635B33F34040ECAD4BC580C75DC0F0EA97650AEF4040', 31128, '289W');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000500000012841C13DED95CC0A10696FECC4C4540A7BDF80728ED5CC0738B5DFECC4C4540A8F1290828ED5CC05EC6D84211714540A4974D13DED95CC082E311431171454012841C13DED95CC0A10696FECC4C4540', 25063, '3202 HIGH');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000500000012841C13DED95CC0A10696FECC4C4540A7BDF80728ED5CC0738B5DFECC4C4540A8F1290828ED5CC05EC6D84211714540A4974D13DED95CC082E311431171454012841C13DED95CC0A10696FECC4C4540', 24878, '3202 LOW');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000B000000CBAB15609FE055C04D0E7978E9534240BFBEC65DE1DE55C0CA891C0A6A534240373A6C8C98DE55C01B7B2444D7534240BAA728E58ADE55C0B6B1EBADDA504240BC4FC45DE1DE55C09F544C14414F42401261B4F938E255C0D66BCDFF924F42409FB2B99E88E455C04E137768B74F4240CDC2BB9E88E455C0CAEE3A873C53424083DD93199DE255C072DB3D873C534240962CBB1263E155C00CE5ECEF60534240CBAB15609FE055C04D0E7978E9534240', 2570, '3701A');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000060000004EDEC06DB80657C03D77F82373D34240DE7A01A1EB0957C088FA25D399D14240558708A1EB0957C00214BD29CEDB4240ABA4FF5E650757C028FF6BF5BBDB42409DA484C6AA0657C0E2AD21F3FDD942404EDEC06DB80657C03D77F82373D34240', 4755, '4501B');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000060000007D05ADDD89C75CC06696559366664240746C640C41D35CC05FF3BC3D115142402DC5AC0C41D35CC0E35B8D7144A442406DD83322CECB5CC014579E7144A44240DCB8C35085C75CC09D0AEAC6999942407D05ADDD89C75CC06696559366664240', 5920, '4806E');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000A0000002DC5AC0C41D35CC0E35B8D7144A442406BF04E0C41D35CC0A85FF2A377374240D253B56196D85CC016C7E6A377374240C495E15085E75CC08FD81DD7AA4A4240CCC8266296F85CC02B4EF8D6AA4A42409E756595C9FB5CC0C21818F9CC4C424051DD9C95C9FB5CC0FDD88EF9CC8C4240BB61F22E63E55CC00F97C1F9CC8C4240AA39072F63E55CC05DF5637144A442402DC5AC0C41D35CC0E35B8D7144A44240', 5925, '4806W');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000001C000000F4CB2896C90B5DC088FA623E11F1424061D01296C90B5DC03947C2C699D94240E984A56296F85CC0FD4FEFC699D942402CD0936296F85CC00D40999366C64240958E2D0D41F35CC041A4A59366C64240B7D1230D41F35CC09832E8E8BBBB42408C7117DA0D005DC06B94CAE8BBBB42407B4E00DA0D005DC07351024F22A242403E23E095C90B5DC0686DE74E22A2424071D1E795C90B5DC0F2037ED7AAAA4240263E67FC2F125DC07F3BE13D11B142402936CC5185175DC0FFE8D43D11B14240B8462DA7DA1C5DC0D85F7DF9CCAC42404161BB1E52245DC0DB216CF9CCAC4240A80275EB1E215DC0F871B64E22A24240536314A7DA1C5DC08AF98E3D11914240A1F0FBA6DA1C5DC0B664A28155754240D13D0096C9235DC040C492815575424030CDF895C9235DC0270AFAF8CC6C42401289AEA7DA445DC086DBF1B488B84240EFFA7C2110465DC09367E49266C64240D6F6A42110465DC0E457D83D11F14240EB95A385B83A5DC07F65F33D11F14240F87D9785B83A5DC05E56107144E44240ECEF88B8EB2D5DC099EC1C9366C64240AF1A3196C91B5DC03647479366C6424009E75896C91B5DC05E013D3E11F14240F4CB2896C90B5DC088FA623E11F14240', 5930, '4807A');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000080000003E23E095C90B5DC0686DE74E22A24240A80275EB1E215DC0F871B64E22A242404161BB1E52245DC0DB216CF9CCAC4240B8462DA7DA1C5DC0D85F7DF9CCAC42402936CC5185175DC0FFE8D43D11B14240263E67FC2F125DC07F3BE13D11B1424071D1E795C90B5DC0F2037ED7AAAA42403E23E095C90B5DC0686DE74E22A24240', 5935, '4807B');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000F00000051DD9C95C9FB5CC0FDD88EF9CC8C4240E2886E95C9FB5CC039F6D5A377574240F1B3AA95C90F5DC0E59BA9A3775742406C81611E521C5DC00C624D4E226242405FBD6A1E521C5DC0EFCD0AF9CC6C424030CDF895C9235DC0270AFAF8CC6C4240D13D0096C9235DC040C4928155754240A1F0FBA6DA1C5DC0B664A28155754240536314A7DA1C5DC08AF98E3D11914240A80275EB1E215DC0F871B64E22A242407B4E00DA0D005DC07351024F22A242408C7117DA0D005DC06B94CAE8BBBB424022621C2F63E55CC0203C08E9BBBB4240BB61F22E63E55CC00F97C1F9CC8C424051DD9C95C9FB5CC0FDD88EF9CC8C4240', 5940, '4808N');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000006000000AF1A3196C91B5DC03647479366C64240ECEF88B8EB2D5DC099EC1C9366C64240F87D9785B83A5DC05E56107144E44240EB95A385B83A5DC07F65F33D11F1424009E75896C91B5DC05E013D3E11F14240AF1A3196C91B5DC03647479366C64240', 5950, '4809');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000A0000004939EF7C0C9150C0AD3723234AFF31402C32F49D4F9250C0509D39C15FFC314004741EA7479550C0279B7C04C5033240C8169BD41F9450C0B78A76DA8907324094C11986049450C06EE75E3C740A3240B99E9B50139350C00A59ADA9140E32401D7D078E1D9250C06765EE3F111132403EEDBAA4898F50C0F971388D4D0C3240DFB908233B9050C0FD8EF149E80432404939EF7C0C9150C0AD3723234AFF3140', 3475, '7103A');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000009000000886DB58B5F9050C005416E0DBDFA31408FB87905959150C0DCD4A3591AF93140DD5628F2C59250C01CD9CD7B3CFB31402C32F49D4F9250C0509D39C15FFC3140F737EF7C0C9150C05B70CBEE37FF3140DFB908233B9050C0FD8EF149E80432403EEDBAA4898F50C0F971388D4D0C3240538FFAC78A8E50C07C166CD9AA0A3240886DB58B5F9050C005416E0DBDFA3140', 3480, '7103B');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000050000002C32F49D4F9250C0509D39C15FFC3140DD5628F2C59250C01CD9CD7B3CFB3140D9D2A30E8D9450C00340B77A5DFE314065500796369450C0CC6B4F456C0132402C32F49D4F9250C0509D39C15FFC3140', 3485, '7103C');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000050000002F13BD78FB9F52C02BFA484E32644240B98C6B78FB9F52C0760CD53E9D964140B3E6F10600E052C0AFE8A02EF9F44140F74E220700E052C03B68794B736842402F13BD78FB9F52C02BFA484E32644240', 6610, '72A');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000700000025A1C6ADAA2A52C07A5E4B7AE98B414067D663F5AC6452C0BA5618D5783E41406583383D8E6B52C0FD6C8AA6C1464140B98C6B78FB9F52C0760CD53E9D9641402F13BD78FB9F52C02BFA484E326442404FFDE693A12A52C0572BCEC3EB59424025A1C6ADAA2A52C07A5E4B7AE98B4140', 6615, '72B');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000F0000004EBF201C52C45CC09116CF4B22C2404097B3DE0A41BB5CC02F19873A11A140405759554032BC5CC0241A3FA414964040BC6EC39E7FBC5CC0A10100D4AA924040CB9FC3BEE3C45CC072A8B40A7BA44040C9C96368AFCA5CC07F0FDE34B6B040403750B6A4DACC5CC0AD50010D39AE4040A13F6B4F85CF5CC009E4843A11B140405C1120FA2FD25CC07FCE31E5BBB34040D8136F4F85CF5CC06B39499B1CB740404C6E632D63D55CC01DE16107DEBD40405D87AF6096DC5CC094B22BD4AAC2404007685AFA2FE25CC02AF8AB5C33C34040C944AB9924E45CC0D11B7F84B0C540404EBF201C52C45CC09116CF4B22C24040', 5985, 'ABEL NORTH MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000005000000D53FA9109CCB5CC05B5CA0C29979404071ADC5A4DADC5CC0F81170B188784040CDEBF3492AE35CC0F4172807DEAD4040F016213E74C65CC0C791444B22824040D53FA9109CCB5CC05B5CA0C299794040', 5990, 'ABEL SOUTH MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000015000000E1BAD11C52DC5CC049CEC4E0605B414055189033BEE55CC079593D19EF2E4140847A2917F7EB5CC017EC6F6E44244140D4E60AD491EC5CC0CEC56E6E442441404540EB902CED5CC0789F6D6E442441404FACCC4DC7ED5CC02F796C6E442441407905AD0A62EE5CC0CA526B6E4424414083718EC7FCEE5CC0732C6A6E442441402A4C9AC7FCEE5CC0ADE29E7F553541400277A69EA0EF5CC01BA89D7F55354140DBA1B27544F05CC0896D9C7F55354140B4CCBE4CE8F05CC0E9329B7F5535414046F7CA238CF15CC049F8997F55354140D821D7FA2FF25CC0A9BD987F55354140B422E3FA2FF25CC06320CB9066464140EBFF1AC2A1FA5CC022D5A5C9F44941406C88C5B6EBFD5CC0B6F814E6BB4B4140FDDA320C41035DC0C2FDDBA1775741404D9FD1A5DA045DC06727632A005841403C1A52FB2F125DC063BD0CE6BB5B4140E1BAD11C52DC5CC049CEC4E0605B4140', 6005, 'BRISTOL MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000320000000E58CD95C95B5DC03AA472C399694140E5E47D2F63655DC00D33ED5C33634140763873DA0D805DC085CCA54B22624140C496AAFC2F865DC020EAE48F666641408B33ADFC2F865DC0566ECFC8F46941407BCC8AEB1E815DC0D908EF8F666641405D183E6D6D805DC0476BF08F666641401751F0EEBB7F5DC0B4CDF18F66664140B29CA3700A7F5DC02230F38F6666414007E856F2587E5DC07392F48F666641407C200974A77D5DC0D2F4F58F666641408A6BBCF5F57C5DC02457F78F6666414099B66F77447C5DC075B9F88F6666414080EE21F9927B5DC0B81BFA8F666641404839D57AE17A5DC0FC7DFB8F66664140CA8388FC2F7A5DC03FE0FC8F6666414025BB3A7E7E795DC07442FE8F666641406005EEFFCC785DC0A9A4FF8F66664140554FA1811B785DC0D0060190666641406A8653036A775DC0F76802906666414018D00685B8765DC01ECB039066664140C719BA0607765DC0372D0590666641404F506C8855755DC0508F069066664140B7991F0AA4745DC05BF1079066664140D9E2D28BF2735DC06653099066664140D418850D41735DC071B50A9066664140AF61388F8F725DC06E170C90666641408BAAEB10DE715DC06B790D9066664140F9DF9D922C715DC05ADB0E90666641408E2851147B705DC0493D10906666414097700496C96F5DC0379F11906666414005A6B617186F5DC01801139066664140C7ED6999666E5DC0F96214906666414089351D1BB56D5DC0DAC41590666641406A6ACF9C036D5DC0AC26179066664140E6B1821E526C5DC07F881890666641401BF935A0A06B5DC043EA199066664140702DE821EF6A5DC0084C1B90666641405F749BA33D6A5DC0BEAD1C90666641404EBB4E258C695DC0750F1E906666414016EF00A7DA685DC02B711F9066664140BF35B42829685DC0D4D2209066664140217C67AA77675DC07C34229066664140A2AF192CC6665DC02596239066664140BEF5CCAD14665DC0BFF7249066664140943B802F63655DC04B592690666641409C9D44FC2F625DC0250F3FA177674140CF7B47FC2F625DC0AE33DBDF606B4140BC22D095C95B5DC038788BB3676D41400E58CD95C95B5DC03AA472C399694140', 6010, 'BUCKHORN MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000120000004283188BD16C5CC0D4667A456CE942406CED153F74A65CC0F619E0E8BB5B424059343C0C41C35CC0EFB0A0E8BB5B42406BF04E0C41D35CC0A85FF2A3773742402DC5AC0C41D35CC0E35B8D7144A44240AA39072F63E55CC05DF5637144A4424022621C2F63E55CC0203C08E9BBBB4240B7D1230D41F35CC09832E8E8BBBB4240958E2D0D41F35CC041A4A59366C642402CD0936296F85CC00D40999366C64240E984A56296F85CC0FD4FEFC699D9424061D01296C90B5DC03947C2C699D94240F4CB2896C90B5DC088FA623E11F14240B5F7644DE8AC5CC099872214F7FF4240964130D90DA05CC0737793502202434048B17FFECC8C5CC093CCC050220243401FC64BA5DA6C5CC0E55C4BBFA1F242404283188BD16C5CC0D4667A456CE94240', 6015, 'DESERT MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000A1000000B7A44C8816B45CC0095E64AF723F40406C1E48FB17B45CC0A779B584903F4040C30265E20EB45CC05A8F316AD23F404021858A1500B45CC0F3C8C3D502404040D4F9FAC70DB45CC01F0C2C323B4040406D9691B714B45CC02F9A2AC08B404040B94AD02D2CB45CC0EAC14A85C5404040970EA5AA41B45CC0F3908B41F44040404493516D28B45CC0479C4217214140404C2BFD6D07B45CC0E4A040DF2A414040B1D27DE6E4B35CC0095C35571A4140409B35C77FB9B35CC0D61A759A1941404005BDA06595B35CC0CB471D1C394140407C36113072B35CC082B193E05A4140408147C3CD61B35CC06FE076268141404043D9E79C57B35CC03FC3D666B041404042BD25A558B35CC0C9D8A3B5EF4140402CCF379F72B35CC0E66422961A4240403167BE69B2B35CC0224CE9C12A42404016C81C7CD9B35CC018FCF62C55424040167E3162D7B35CC076C444AF8C424040FE92045BDDB35CC0BAC7638ABF424040755BFDFFF0B35CC09E947043EC424040AD89E1A20BB45CC08AB2DD271443404081FE489002B45CC0F168F96E404340400A747AB1E8B35CC0320626BF7043404061B3D78CC4B35CC0536F3199B0434040CFA9CCD6B2B35CC00A6FBE43D74340403383B0B098B35CC0D9757B7F0944404029BF494C88B35CC0B44D901241444040266E8AD46CB35CC019F78E4A704440408C84CE375AB35CC0FF5CFEBD9A4440404E67AC1F53B35CC0D3F59DA5EA44404062200A4257B35CC0763C4E6F184540402B3E6C657AB35CC006F6B5784A4540400EDAD59B89B35CC005BD09608945404074DC009E92B35CC0E1FA624FE7454040167DBF5078B35CC0B65FE0731F464040DEA6BC4342B35CC057D2E77E4646404026E461A710B35CC0F7A6A49F684640407457999EE8B25CC0E5B568AB8A464040269D984CCDB25CC0298439E0B24640403A9BC9AAC0B25CC0C14B7908DB464040CF688061B1B25CC096C3B4B10A474040F4B5BE10AAB25CC064582B913C4740407A803080A8B25CC06090FA6D804740409976CEFEB8B25CC0AE33FCF4D04740403F5FF113BFB25CC06699DECF214840407F6063C1B5B25CC0BC433C12604840400DA343A7B2B25CC0B83FFFB29948404066F0601CB9B25CC073FC8DD2D6484040AAF6774FD6B25CC0D888A7CED448404025E26AAFE3B25CC08200A0A89D48404021B7A30C0DB35CC0C1D938DC3F484040E7793DFE43B35CC0340443BD114840409CD7C9827AB35CC06A937C2FB647404039A1694AA3B35CC0CD50FF89894740405C9DEDB2D0B35CC036C3CAA47E47404010644F03F7B35CC0F7D0DC0D9A474040013B062811B45CC01F987F79D34740400E1B26041CB45CC0D3E18C24394840404B593C7F15B45CC0CE3C136B8E48404083EA4D4C08B45CC06CD97984CB484040840A7EE8F3B35CC09BD685E0E948404069B402D4C5B35CC04298304314494040BDBB27D69AB35CC0F419280F3C494040A653551074B35CC0F8D0B78B61494040B640DE195EB35CC072BECC568F494040FF2C522450B35CC0D49E2C18C6494040D0701ED94DB35CC0AFB5F32B074A40402E56E1C972B35CC05F208C7B5D4A404092D502B674B35CC0CD790380944A4040B02E9C895AB35CC0AAB2C98EF74A4040165485713BB35CC000D73AB2494B4040C620999D36B35CC096FC2ADA864B40402CF537142FB35CC07175869DCC4B40403008C36631B35CC09513297D0B4C40400D3AF91647B35CC0878B612D614C40409C080B4453B35CC07E9AF64CAC4C404097C899157BB35CC0D0EF6112D14C40406769F09394B35CC08B72CC95E44C40400908F3F5A6B35CC08E2FEA77044D4040E0CAA1D7B6B35CC0DBD2D627364D40404794FDCDB5B35CC0CADF10007E4D40400F215CDEC6B35CC0CF9D3BA2E54D4040A0E86432C6B35CC09265BB8C3E4E40401A021A2FC7B35CC0A5547AD77C4E40402CCCFDD2CCB35CC0DB6DF063A84E4040405FB60DCDB35CC0316693FBF94E40403181654EC1B35CC0DBC831B2404F4040533AF6CDA7B35CC0341C01578E4F4040AFE0EF4C92B35CC0D39F703AA54F40409181876046B35CC0FE290B63E74F40401E846A2820B35CC0510D77ECFE4F404089622B3BEEB25CC06B45F733D14F40408D7F48C7C6B25CC016EC32C9A44F4040406F6DE596B25CC0318D46D4A04F40407EBB4B1C6AB25CC035E44A66D14F404022DCF9D83BB25CC09F9BC3E1E14F4040227E7EDA19B25CC03C9949BBE64F4040A3F606CB09B25CC09BCF5C2D0C5040402DD47EF614B25CC0D6618EF1765040408C3F2FA008B25CC01C24C024BD50404076B2BBADE5B15CC0E9AC98440B5140400EC97662C7B15CC0D4627971305140406F867C719AB15CC0C55080385D514040E007A86471B15CC0488A45BE99514040BF35B46446B15CC0C25598D8CA514040B2AD3F5C2AB15CC0BD6F048DE7514040B95CD9D607B15CC05A339F781C524040322748ADE8B05CC099DFA3794E5240409D4B4B42DAB05CC0E2E0CFEF82524040128E2FC7E3B05CC0EFF3FCDDC2524040FF005829F5B05CC075895FD30A53404004039B0DEAB05CC00C32F47435534040D03947D1BBB05CC057AF44688B534040F8FBC55688B05CC0697A4B08DD53404056D7C17066B05CC01E20C3FD075440400174952833B05CC0D6C8167743544040C0E2D2370EB05CC07CBC0FAC7D5440408B920FE1FFAF5CC01D364916A15440405C388BE2BDAF5CC0E4A44916A1544040CC1374A213AF5CC0B5C24A16A154404082EF5C6269AE5CC078E04B16A1544040ABCA4522BFAD5CC03CFE4C16A1544040D4A52EE214AD5CC0FF1B4E16A1544040FE8017A26AAC5CC0C2394F16A15440400049FF61C0AB5CC086575016A1544040E323E82116AB5CC02D755116A15440407FFED0E16BAA5CC0E2925216A15440401CD9B9A1C1A95CC097B05316A154404072B3A26117A95CC03FCE5416A1544040C88D8B216DA85CC0D8EB5516A1544040D86774E1C2A75CC07F095716A1544040072F5CA118A75CC018275816A1544040D10845616EA65CC0B1445916A15440409AE22D21C4A55CC04A625A16A15440401DBC16E119A55CC0D57F5B16A1544040A095FFA06FA45CC0609D5C16A1544040236FE860C5A35CC0EBBA5D16A15440406048D1201BA35CC068D85E16A1544040760EB9E070A25CC0E5F55F16A15440406CE7A1A0C6A15CC062136116A15440401CC08A601CA15CC0D1306216A1544040CC98732072A05CC04E4E6316A15440407C715CE0C79F5CC0AF6B6416A1544040E64945A01D9F5CC01E896516A15440404F222E60739E5CC07FA66616A15440407F532860739E5CC0FE820677AC4A4040F356D40A1E9F5CC0A9660577AC4A4040026D81B5C89F5CC0534A0477AC4A404011832E6073A05CC0F02D0377AC4A4040F985DA0A1EA15CC08C110277AC4A4040B359D40A1EA15CC0078E8EE301404040CB56286073A05CC09AA88FE301404040BC407BB5C89F5CC011C390E301404040AD2ACE0A1E9F5CC096DD91E3014040407F272260739E5CC00DF892E30140404077831A60739E5CC03825BBBCAC324040ECCA41F4FAB35CC01E665E8C823F4040B7A44C8816B45CC0095E64AF723F4040', 6020, 'DOME MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000006000000DB25367044645BC02DD79C6F44744040610DE71AEF6E5BC0A830C62A004040401A80AC2C00A05BC0D028149166564040E066FF2C00A05BC05313F82B00E04040C8AA8B7044645BC0C6BDAE2C00004140DB25367044645BC02DD79C6F44744040', 4440, 'JACKAL MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000800000033333333330358C033333333335342403836960B700F58C0F993426A24494240193BE12538BF57C08770276C9A3041408B0AE6F91D7057C0D30C4EE9051D404033333333336357C0795C548B8828404053944BE3179B57C0295C8FC2F5E84040840F255AF2CB57C0A2B8E34D7E91414033333333330358C03333333333534240', 24035, 'AR313(N)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000009000000E9D7D64FFF1656C060E5D022DBB93E4009FB7612119156C0DB1324B6BBFB3E403333333333E356C08B5242B0AA2A3F40F2D24D62102057C062F6B2EDB4413F40732A1900AA2057C0873C388E0E2E3F40901FE0FF7DE356C0595D3DDD2F173F40950ED6FF399156C09E5DBEF561E93E4072851C00961756C0740CC85EEFA63E40E9D7D64FFF1656C060E5D022DBB93E40', 31713, 'AR302C(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000009000000E9D7D64FFF1656C060E5D022DBB93E4009FB7612119156C0DB1324B6BBFB3E403333333333E356C08B5242B0AA2A3F40F2D24D62102057C062F6B2EDB4413F40732A1900AA2057C0873C388E0E2E3F40901FE0FF7DE356C0595D3DDD2F173F40950ED6FF399156C09E5DBEF561E93E4072851C00961756C0740CC85EEFA63E40E9D7D64FFF1656C060E5D022DBB93E40', 31712, 'AR302C(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000060000009A99999999A15CC04529215855554240F365587B0EA05CC07B8A77DBE0524240A63E350381805CC0D2037A3C888C42402A38BC2022825CC0DFC2BAF1EE8E42403C2EAA45449C5CC087A3AB74775F42409A99999999A15CC04529215855554240', 12600, 'AR230V');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000800000033333333339353C0795C548B884844409A99999999F953C0CDCCCCCCCC4C444045DAC69FA85B54C0FC1C1F2DCE5E444028806264C9DF54C05C8FC2F5287C44409A99999999D154C040C23060C9DF444055320054714A54C01904560E2DC24440F70489EDEEF653C0213D450E11B14440684293C492B753C085EB51B81EA54440', 24004, 'AR220');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000008000000D8F2CAF5B61859C0D122DBF97EB2424078190F00661759C092617028D7A042400C83E8FF0B6358C0D514127A47CB4240FB100A00C49C57C0D474875E900F4340AF230ED9409F57C0894160E5D0224340D65416855D6558C096D05D1267DF4240CFF753E3A5A758C0B45549641FCE4240D8F2CAF5B61859C0D122DBF97EB24240', 24048, 'AR330(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000005E0100007534DE1A9E785BC0AE42FBF41B664040C42EF8477B785BC0C16234101A6640402B02837058785BC0889008471A66404050D9EF9F35785BC0A62C60991C6640404B81AAE112785BC006F1790621664040048E1B41F0775BC0717FE48C27664040BBC39FC9CD775BC0B5F0772A306640402F2A8986AB775BC0A7B662DC3A664040494F148389775BC0E3DF1E9F47664040EFB86ECA67775BC0711F816E5666404073DCA76746775BC07D9FA74567664040AC7CB66525775BC04C7A0F1F7A6640401E2671CF04775BC0E7D787F48E66404074E389AFE4765BC0B43936BFA5664040E9508F10C5765BC0DB5CA377BE66404071DEE1FCA5765BC0AE7DB015D9664040DE08B77E87765BC057EE9F90F566404006D611A069765BC00C3D17DF1367404018E7C36A4C765BC0F3A425F733674040F9CE63E82F765BC0D1C23FCE556740402E4B502214765BC0D8514A59796740400AD2A921F9755BC0792B9A8C9E674040356D50EFDE755BC09E47F45BC56740406A6EDF93C5755BC06FEA9EBAED674040F36EAD17AD755BC01EC2549B17684040A904C88295755BC05D3A58F042684040C562EEDC7E755BC0CEE56AAB6F68404079A6952D69755BC062ABDEBD9D684040362CDF7B54755BC0B0558F18CD684040B4B59ACE40755BC0239BF1ABFD684040B61E422C2E755BC0D9F710682F6940407736F79A1C755BC092F9933C62694040BFC083200C755BC01322C91896694040922955C2FC745BC014E7A6EBCA694040AFAA394E22725BC0762230B8046440403CA9553EF0795BC0474FE7C8154540408D1AC9DBF79E5BC0B0470EFEE85540402EA5FC33E59E5BC049C9ABA217564040700BFE45D29E5BC03E2B3221495640405F495D63BF9E5BC05C4D38AC7A56404030841C8CAC9E5BC05FBEB743AC564040EBE13DC0999E5BC05EE7A7E7DD564040EC9AC4FF869E5BC0055702980F574040FDFAB44A749E5BC04276BE5441574040DE2711A1619E5BC0DDD3D51D73574040EB59DC024F9E5BC01CB33DF3A45740400ECA19703C9E5BC016EEF3D4D6574040089ECBE8299E5BC077A2EBC208584040340EF56C179E5BC0C55E1EBD3A5840407C5399FC049E5BC0A6D787C36C584040A093BA97F29D5BC037501DD69E584040DD195D3EE09D5BC04157D8F4D05840403C0C83F0CD9D5BC0BE55B01F035940405EA32FAEBB9D5BC06ADA9E56355940409F176677A99D5BC0304E9B9967594040277C274C979D5BC0DB3F9FE899594040582F792C859D5BC07318A243CC594040AF565D18739D5BC088669DAAFE5940405205D50F619D5BC07E6D861D315A4040A599E5124F9D5BC0B5E1589C635A4040233991213D9D5BC0362C0C27965A4040D509DA3B2B9D5BC0FBB597BDC85A40405B44C361199D5BC0B10DF55FFB5A404012215093079D5BC06E9C1B0E2E5B404003C682D0F59C5BC002CB02C8605B4040697E5F19E49C5BC0144EA68D935B4040B25DE76DD29C5BC00043F95EC65B4040D4AE1ECEC09C5BC01284F93BF95B40409297073AAF9C5BC0C02E9A242C5C4040383EA4B19D9C5BC07AF7D6185F5C4040BDEDF8348C9C5BC04947A718925C404002B906C47A9C5BC017870224C55C4040D1EBD15E699C5BC0BD45E23AF85C4040EBAB5C05589C5BC019EC3D5D2B5D4040F131AAB7469C5BC0F4080F8B5E5D404060A3BC75359C5BC078DF4AC4915D4040004C983F249C5BC03124ED08C55D4040D22B3D15139C5BC04A1AEB58F85D4040F2A0B0F6019C5BC099503EB42B5E404089BEF3E3F09B5BC0EF2FDE1A5F5E404018D00ADDDF9B5BC02447C48C925E40403BE8F6E1CE9B5BC030FFE709C65E4040BA52BCF2BD9B5BC010C14092F95E404077225C0FAD9B5BC06F1BC8252D5F4040AEA2DA379C9B5BC0577775C4605F4040ADF9396C8B9B5BC07463426E945F4040634C7CAC7A9B5BC00D232423C85F404026E7A5F8699B5BC0926A16E3FB5F404068C9B650599B5BC086570CAE2F6040408E51B4B4489B5BC01CC4038463604040E6A5A024389B5BC0E5CDEF6497604040C4D87CA0279B5BC03529CC50CB604040F2354D28179B5BC0233F9047FF60404009D012BC069B5BC0A778334933614040B305D35BF69A5BC09F3EAD5567614040F2D68D07E69A5BC032FAF46C9B614040667C46BFD59A5BC0BE5F068FCF6140404D410183C59A5BC07CB2D6BB036240408738BF52B59A5BC0765B5DF3376240406388822EA59A5BC0270F96356C624040D77B4F16959A5BC0EBEA7382A06240400A26270A859A5BC068A3F2D9D46240409DBF0C0A759A5BC07EA1093C09634040EE800316659A5BC06328AEA83D63404003900D2E559A5BC0A5ECDB1F7263404059122D52459A5BC01F578AA1A66340401D416582359A5BC036ABAE2DDB634040A52EB7BE259A5BC04A9D44C40F64404053392807169A5BC093704165446440406E61B85B069A5BC0DCB39E107964404098DF6ABCF6995BC04EAA51C6AD64404074EC4229E7995BC066085686E26440407DAD42A2D7995BC06C11A150176540409B5B6D27C8995BC00D542C254C654040AE09C4B8B8995BC05139EF03816540405AF04956A9995BC0162AE1ECB56540401A3501009A995BC07F8FF9DFEA6540408E10EDB58A995BC01FF831DD1F664040E8BB10787B995BC00CCD81E45466404099366C466C995BC0F29CE2F5896640406BCC03215D995BC058854711BF664040BBB5DA074E995BC06D60AE36F466404014F3F0FA3E995BC0A94B0A662967404026CF4AFA2F995BC0C8D5549F5E6740408770EA0521995BC0D06785E2936740406BFCD11D12995BC07190952FC9674040D998034203995BC0A3B87C86FE674040757E8272F4985BC06F4932E7336840409AE551AFE5985BC0C1ABAD51696840408DCE71F8D6985BC09348E6C59E684040F371E54DC8985BC0A1AED543D4684040061BB1AFB9985BC0222171CB096940400ECAD41DAB985BC0A354B45C3F6940408DCA54989C985BC08C6692F7746940403E1C311F8E985BC01C31099CAA694040101E6FB27F985BC008AC094AE069404030CF0E5271985BC0E98B8F01166A4040156913FE62985BC0435F94C24B6A4040D22380B654985BC0B7430B8D816A40409012567B46985BC0F3C7ED60B76A4040105B974C38985BC0BF7A353EED6A4040AD35472A2A985BC0FAC4D924236B404070C867141C985BC0BB0FD214596B4040B54BFC0A0E985BC01D9E130E8F6B404008C0040E00985BC0F8FE9710C56B40405F70851DF2975BC0FAC0581CFB6B4040E26F7F39E4975BC05B274B31316C4040ECF6F561D6975BC0E5C0684F676C4040852BEB96C8975BC076F6A8769D6C4040703361D8BA975BC0620B01A7D36C404026345A26AD975BC00BB46CE0096D4040F653D8809F975BC0030EDF22406D4040CFB7DDE791975BC0BACD536E766D404025996D5B84975BC0295CC2C2AC6D40404E0A89DB76975BC089FC1F20E36D40405031326869975BC0963D6686196E4040AF596D015C975BC04A888CF54F6E404024833AA74E975BC0DC1F886D866E404098E69C5941975BC0CBB854EEBC6E4040EB96951834975BC05D96E777F36E40405BDF28E426975BC031473A0A2A6F404074C056BC19975BC08F0E42A5606F4040057222A10C975BC06F55F648976F4040832D8F92FF965BC05DD052F5CD6F404062F29C90F2965BC0B49C4AAA047040408BF94E9BE5965BC03E49D7673B7040409F7BA8B2D8965BC0F43EF02D727040405878A9D6CB965BC0DFE68CFCA8704040803B5607BF965BC09ECFA6D3DF70404016C5AE44B2965BC0783C33B3167140405760B78EA5965BC06796299B4D7140408A0D70E598965BC0266C838B847140403218DD488C965BC0EF003684BB7140400780FEB87F965BC07BE33A85F27140401A91D83573965BC0C67C898E29724040DF4A6BBF66965BC0CA3519A060724040F6E5B9555A965BC07277E1B9977240408975C5F84D965BC0D5AAD9DBCE724040184592A841965BC00F13F70506734040A554206535965BC0B96435383D734040ABC9712E29965BC0B1088C727473404011DD89041D965BC07D1CEEB4AB734040BAA169E710965BC0995457FFE2734040475014D704965BC0001ABF511A74404071E889D3F8955BC0E9AF1AAC5174404002B6CEDCEC955BC0417F610E89744040B5B8E2F2E0955BC0D2168D78C0744040B729C915D5955BC096DF94EAF77440403D2E8445C9955BC0D31C6E642F75404028D91482BD955BC0DB8214E666754040A8637ECBB1955BC0602F7B6F9E7540402FCDC021A6955BC0E2B09B00D67540404161E0849A955BC0B84A6B990D7640406920DDF48E955BC05FB1E539457640409F55BB7183955BC00E2800E27C76404048EE79FB77955BC0FFF1AF91B4764040E7351D926C955BC0A1C3F048EC764040163FA63561955BC039E0B70724774040FD1C16E655955BC0C2B0FCCD5B7740401E1B71A34A955BC0299EB69B937740405326B66D3F955BC08311DD70CB774040648AE94434955BC09F73674D03784040335A0C2929955BC0B22D4D313B7840403ABB201A1E955BC03DCE871C73784040E7C0271813955BC095980C0FAB7840402890232308955BC0F3CFD008E37840407462173BFD945BC0964ED2091B7940405B240260F2945BC0250C0212537940408934E991E7945BC02BBD5B218B7940401C80CBD0DC945BC0E0A4D437C37940405252AD1CD2945BC0312C6455FB794040B7AB8E75C7945BC026BC017A337A404039B171DBBC945BC0B8BDA4A56B7A40406C89584EB2945BC096BF46D8A37A4040875945CEA7945BC00505DD11DC7A4040AF34395B9D945BC0F3F65E52147B4040A74036F592945BC074FEC3994C7B4040E9A23E9C88945BC01BAA05E8847B40409C6E53507E945BC08817173DBD7B404083C9761174945BC01DFBF398F57B404037C6A9DF69945BC0129891FB2D7C4040E79DEFBA5F945BC06F57E764667C4040C04F48A355945BC02EA2ECD49E7C40403815B7984B945BC03BE1984BD77C404083133E9B41945BC09F7DE3C80F7D40400838DCAA37945BC053E0C34C487D404048CE95C72D945BC0357231D7807D4040DEE86BF123945BC0A9762168B97D4040D3AD60281A945BC00EA28FFFF17D4040261D746C10945BC0DC116F9D2A7E40405A82AABD06945BC0EB54B941637E404048CA021CFD935BC00BD465EC9B7E4040D82D8087F3935BC051F86B9DD47E4040ECBF2300EA935BC0F604C1540D7F4040FFA5EF85E0935BC09A885E12467F40401706E618D7935BC09FC639D67E7F404036E006B9CD935BC0A64D4CA0B77F4040B86C5566C4935BC0F3608B70F07F4040C2BED220BB935BC07469EE462980404037E97FE8B1935BC0E4F56E2362804040D7115FBDA8935BC08A4902069B8040401E5E729F9F935BC051CD9FEED380404033E1BA8E96935BC042EA3EDD0C814040159B388B8D935BC0092FD9D14581404002D7EF9484935BC01FB961CC7E8140404095E0AB7B935BC04D17D2CCB781404090FB0CD072935BC08DB221D3F0814040B32F77016A935BC0BCF347DF2982404064311F4061935BC03E1E3AF162824040AB26078C58935BC0A4C0F1089C824040202230E54F935BC0431E6426D5824040F55C9D4B47935BC0C7C58A490E8340409BD64EBF3E935BC078FA5A72478340401BB5464036935BC0F54ACEA0808340400F0B86CE2D935BC0DFD4D7D4B98340409EEB0D6A25935BC08A4C730EF38340406B8FE1121D935BC088CF934D2C84404075F600C914935BC0561235926584404037466E8C0C935BC04F324ADC9E844040D9912A5D04935BC04CBECC2BD88440403CEC363BFC925BC0371FB48011854040DA7A9526F4925BC05898F5DA4A854040DB50471FEC925BC08D92883A84854040FF934E25E4925BC0BA9C669FBD8540402957AC38DC925BC02ED48209F7854040F2AC6159D4925BC081EDD8783086404081A86F87CC925BC0CF2B5EED69864040986FD8C2C4925BC030F80967A3864040D1149D0BBD925BC0DB95D1E5DC8640405FB6572C00805BC0970E482B00804040AB9F7ABE67795BC0CBAE78E1B6724040F598FB5089795BC0955F8FEDA672404065C2667DAA795BC0441089BE94724040B7086641CB795BC034A3CB9080724040F0C12F92EB795BC0C29BF76A6A724040B1EB20650B7A5BC000955D5452724040B050BFAF2A7A5BC0F0A2E65438724040CBD4BD67497A5BC0D3A527751C7240403FC00083677A5BC02CAB49BEFE71404001D29EF7847A5BC02FD0163ADF714040A8B2E7BBA17A5BC00485EFF2BD714040EFF163C6BD7A5BC0A28CCAF39A7140400055D90DD97A5BC02C402A4876714040741F4F89F37A5BC03A0023FC4F7140400B3B10300D7B5BC024524E1C28714040DD48ACF9257B5BC07E51D1B5FE7040404C14FEDD3D7B5BC06E3647D6D3704040256C29D5547B5BC01B38CE8BA7704040C7A6A2D76A7B5BC017D0FCE479704040B0A22EDE7F7B5BC076FDD6F04A704040AFEBE4E1937B5BC07590D2BE1A704040C1E131DCA67B5BC0FA21C85EE96F40406402DBC6B87B5BC0A6AAFBE0B66F40406FD8FD9BC97B5BC0432F0956836F404049581556D97B5BC03EE6E6CE4E6F404083BBF7EFE77B5BC0D5A0DC5C196F4040E1DDDB64F57B5BC0477F7F11E36E4040FB3E59B0017C5BC0CBA5ADFEAB6E4040FDED66CE0C7C5BC0587F8336746E404051FC61BB167C5BC0D0BD5BCB3B6E40402E560B741F7C5BC0499DC4CF026E404037E989F5267C5BC039BE7D56C96D40403C7F683D2D7C5BC0A3686D728F6D404095419D49327C5BC065669E36556D40401D488318367C5BC0894635B61A6D40401FD2DDA8387C5BC0025D7004E06C4040DF7DDBF9397C5BC036069D34A56C40401DEC100B3A7C5BC05A35115A6A6C4040742F7FDC387C5BC06D2927882F6C4040725C8D6E367C5BC0B2D534D2F46B404049D40CC2327C5BC08096874BBA6B4040124539D82D7C5BC049745907806B4040D538B2B2277C5BC00D95D718466B4040B6AB8353207C5BC0287708930C6B4040EC881EBD177C5BC05088D488D36A4040D0BC59F20D7C5BC04943F90C9B6A40403F2271F6027C5BC04F550B32636A40402A8305CDF67B5BC0A624610A2C6A40404B5E197AE97B5BC0E4671BA8F5694040620F1302DB7B5BC0CA681A1DC0694040116EB769CB7B5BC0566DF57A8B6940400DD029B6BA7B5BC0BC46F4D2576940408CE2E9ECA87B5BC0DB76113625694040DFBCD413967B5BC0E44DEDB4F3684040B1491C31827B5BC06AC4CB5FC3684040BACB4E4B6D7B5BC08AE48B4694684040B70C4B69577B5BC019A4A578666840406A974392407B5BC06D7323053A6840400991BCCD287B5BC0193DA2FA0E684040CC488523107B5BC02D5E4267E5674040C581BC9BF67A5BC044CBA958BD674040D792C33EDC7A5BC074EB01DC966740403EFB4615C17A5BC0FFDAECFD716740408F943228A57A5BC04B9187CA4E67404089CAB480887A5BC051245F4D2D674040DB0436286B7A5BC0D4ED72910D67404071DE5B284D7A5BC0A81A2EA1EF664040E27CFF8A2E7A5BC09F846586D3664040F6B52F5A0F7A5BC03967534AB9664040F89C2AA0EF795BC0D21393F5A06640402D5F5B67CF795BC0C11723908A664040D20957BAAE795BC02DA55C2176664040963ED8A38D795BC0EE92F3AF636640405FE8BA2E6C795BC08482F84153664040B228FB654A795BC0C348D0DC446640402B0CB15428795BC099C8318538664040BD2A0B0606795BC09F632C3F2E6640406A844C85E3785BC0143E1D0E266640404433C8DDC0785BC01ED5B7F41F6640407534DE1A9E785BC0AE42FBF41B664040', 4445, 'JACKAL LOW MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000006000000E066FF2C00A05BC05313F82B00E040401A80AC2C00A05BC0D028149166564040B95953B588A85BC0782441C4995940405A7913B688D85BC06541C619EF8E404083D430B688D85BC03E9B361AEFBE4040E066FF2C00A05BC05313F82B00E04040', 4535, 'OUTLAW MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000006E00000023098AC7FCEE5CC082E9F607DE1D414098414C83B8F25CC01C947CA1771741406305470062F35CC0C4537BA1771741402FC9417D0BF45CC06C137AA177174140FA8C3CFAB4F45CC006D378A1771741409E3D36775EF55CC0A19277A177174140DD0031F407F65CC03B5276A1771741401CC42B71B1F65CC0C71175A177174140148726EE5AF75CC053D173A1771741400D4A216B04F85CC0D19072A177174140050D1CE8ADF85CC04F5071A177174140D6BC156557F95CC0CD0F70A177174140427F10E200FA5CC04BCF6EA177174140AE410B5FAAFA5CC0BB8E6DA177174140190406DC53FB5CC01D4E6CA1771741403FC60059FDFB5CC08D0D6BA1771741406488FBD5A6FC5CC0EFCC69A1771741406237F55250FD5CC0438C68A177174140FBF8EFCFF9FD5CC0A54B67A17717414093BAEA4CA3FE5CC0EA0A66A1771741402C7CE5C94CFF5CC03ECA64A177174140F861E6C94CFF5CC0106A39C6C61841408C003ACB2FFF5CC0B8B2E7ACE6184140D8161E5815FF5CC09DB01B310C19414096DBCDD4FDFE5CC0CB1FAEC436194140C806669AE9FE5CC05D5355C665194140A0E496F5D8FE5CC0A70FF883981941408A0D7D25CCFE5CC07CFF513DCE1941402F2CB55AC3FE5CC03F4AD426061A4140AD16A0B6BEFE5CC006A49B6C3F1A4140FF40E64ABEFE5CC08658A035791A414038B82E19C2FE5CC042E5DFA6B21A414033362013CAFE5CC0E2A3A4E6EA1A4140733A8E1AD6FE5CC06D21BA1F211B4140D513EE01E6FE5CC0F5029B84541B4140D5E4058DF9FE5CC072876D52841B4140C7D5C97110FF5CC06F0800D4AF1B4140669E78592AFF5CC03B415C64D61B4140CAF1E1E146FF5CC053B34D71F71B41402A39DD9E65FF5CC0B48D897D121C414024C1E31B86FF5CC057627C22271C4140F1BBC5DDA7FF5CC0D12BE211351C414095EC8564CAFF5CC0C1EAE3163C1C4140D577372DEDFF5CC0BBA8E3163C1C4140FA8BF6B30F005DC0C966E111351C41406A86D97531005DC0451D7B22271C414033DFDEF251005DC061CD877D121C41405814DBAF70005DC0657E4B71F71B41401B3A44388D005DC01CA05964D61B4140CCBAF11FA7005DC02005FDD3AF1B4140D26FB504BE005DC0552D6A52841B414020FFCC8FD1005DC0CB5E9784541B4140BDA42D77E1005DC01041B61F211B4140805E9B7EED005DC00E96A0E6EA1A41405C7C8B78F5005DC04DB9DBA6B21A414092B7D446F9005DC0381E9C35791A4140937F19DBF8005DC0886B976C3F1A4140B91B0437F4005DC07523D026061A4140AEED3B6CEB005DC01FFA4D3DCE19414087DF229CDE005DC0F13AF483981941401B7853F7CD005DC0D2BD51C665194140B462EBBCB9005DC0F1D6AAC43619414004DA9939A2005DC0EFC018310C19414030BD7DC687005DC05027E5ACE6184140F042D2C76A005DC07F4C37C6C6184140245DD1C76A005DC010AD62A177174140E565C17F16015DC01A6861A177174140616EB137C2015DC0162360A177174140DC76A1EF6D025DC012DE5EA177174140117F91A719035DC00E995DA177174140E099825FC5035DC0FC535CA177174140CFA1721771045DC0EA0E5BA177174140BEA962CF1C055DC0D8C959A17717414066B15287C8055DC0B88458A177174140C8B8423F74065DC0983F57A177174140681E473F74065DC0765FCA07DE1D4140EC25958EC3055DC032AFCB07DE1D41408F1AE2DD12055DC0E1FECC07DE1D4140EC0E2F2D62045DC08F4ECE07DE1D414048037C7CB1035DC02F9ECF07DE1D4140400ACACB00035DC0DEEDD007DE1D414056FE161B50025DC0703DD207DE1D414026F2636A9F015DC0028DD307DE1D414090F8B1B9EE005DC094DCD407DE1D41401AECFE083E005DC0182CD607DE1D4140A4DF4B588DFF5CC09C7BD707DE1D4140E7D298A7DCFE5CC020CBD807DE1D4140C5D8E6F62BFE5CC0961ADA07DE1D4140C2CB33467BFD5CC00C6ADB07DE1D414078BE8095CAFC5CC082B9DC07DE1D41402FB1CDE419FC5CC0EA08DE07DE1D414080B61B3469FB5CC04458DF07DE1D4140F0A86883B8FA5CC09EA7E007DE1D41401A9BB5D207FA5CC0F8F6E107DE1D414024A0032257F95CC05246E307DE1D414008925071A6F85CC09E95E407DE1D4140EB839DC0F5F75CC0E9E4E507DE1D41408875EA0F45F75CC02734E707DE1D4140C079385F94F65CC06583E807DE1D4140176B85AEE3F55CC095D2E907DE1D41406D5CD2FD32F55CC0C421EB07DE1D41407E4D1F4D82F45CC0F470EC07DE1D414028516D9CD1F35CC015C0ED07DE1D4140F241BAEB20F35CC0370FEF07DE1D41407632073B70F25CC04A5EF007DE1D4140DA35558ABFF15CC05EADF107DE1D41401826A2D90EF15CC071FCF207DE1D41405516EF285EF05CC0774BF407DE1D41404C063C78ADEF5CC07C9AF507DE1D414023098AC7FCEE5CC082E9F607DE1D4140', 6065, 'SUNDANCE MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000008000000D8F2CAF5B61859C0D122DBF97EB2424078190F00661759C092617028D7A042400C83E8FF0B6358C0D514127A47CB4240FB100A00C49C57C0D474875E900F4340AF230ED9409F57C0894160E5D0224340D65416855D6558C096D05D1267DF4240CFF753E3A5A758C0B45549641FCE4240D8F2CAF5B61859C0D122DBF97EB24240', 24049, 'AR330(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000008000000A4703D0AD7FB58C042EDB776A20E42400ADEEBFFF7EE58C076656199C8124240EC432800901A59C03AE8120EBD91434019ABCDFFAB4959C03F0C63C1B30F4540E17A14AE475559C0C5AD8218E80C4540C976BE9F1A3B59C0273108AC1C3A44405EBA490C021359C04A99D4D006E24240A4703D0AD7FB58C042EDB776A20E4240', 24059, 'AR400(N)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000009800000089FC5EF63E3F5DC034D354DAAAAA4440EFA1A83500405DC0C5B352DAAAAA444047DF143600405DC08C802A30000045407FD049D03A3F5DC078BB2C300000454070C17E6A753E5DC056F62E3000004540FCC4B404B03D5DC02631313000004540A7B5E99EEA3C5DC0E76B3330000045400BA61E39253C5DC09BA6353000004540299653D35F3B5DC040E13730000045402899896D9A3A5DC0D81B3A30000045400089BE07D5395DC061563C30000045409278F3A10F395DC0DD903E30000045402368283C4A385DC058CB403000004540096A5ED684375DC0B7054330000045400E599370BF365DC008404530000045401248C80AFA355DC04B7A4730000045408A36FDA434355DC080B44930000045400225323F6F345DC0A7EE4B30000045405B2668D9A9335DC0C0284E300000454046149D73E4325DC0CA625030000045403202D20D1F325DC0C79C523000004540D7EF06A859315DC0B6D654300000454016F03C4294305DC0961057300000454074DD71DCCE2F5DC0684A5930000045408DCAA676092F5DC02D845B30000045405EB7DB10442E5DC0E3BD5D300000454030A410AB7E2D5DC08BF75F30000045409CA34645B92C5DC02531623000004540E18F7BDFF32B5DC0B16A643000004540E07BB0792E2B5DC02FA4663000004540DF67E513692A5DC09FDD68300000454078661BAEA3295DC001176B3000004540EA515048DE285DC055506D30000045405C3D85E218285DC09A896F30000045404128BA7C53275DC0D2C27130000045404D26F0168E265DC0FCFB733000004540EC1025B1C8255DC017357630000045408BFB594B03255DC0246E783000004540E4E58EE53D245DC024A77A3000004540F6CFC37F78235DC015E07C3000004540E8CCF919B3225DC0F8187F30000045406EB62EB4ED215DC0BF518130000045403AA0634E28215DC0868A833000004540798998E862205DC03FC38530000045409885CE829D1F5DC0EAFB873000004540916E031DD81E5DC087348A3000004540435738B7121E5DC0076D8C3000004540F63F6D514D1D5DC088A58E3000004540423BA3EB871C5DC0FADD9030000045406823D885C21B5DC05F169330000045408D0B0D20FD1A5DC0A74E95300000454026F341BA371A5DC0F086973000004540BFDA765472195DC02ABF99300000454038D5ACEEAC185DC048F79B300000454044BCE188E7175DC0662F9E300000454051A3162322175DC07667A030000045405D8A4BBD5C165DC06A9FA23000004540BD83815797155DC05ED7A430000045403C6AB6F1D1145DC0360FA730000045407550EB8B0C145DC00D47A93000004540AE36202647135DC0C97EAB30000045403B2F56C081125DC085B6AD3000004540E7148B5ABC115DC024EEAF300000454093FABFF4F6105DC0C425B23000004540B3DFF48E31105DC0475DB43000004540D2C429296C0F5DC0CA94B630000045408CBC5FC3A60E5DC031CCB8300000454065A1945DE10D5DC08A03BB3000004540F885C9F71B0D5DC0E43ABD3000004540446AFE91560C5DC02072BF30000045402B61342C910B5DC04FA9C13000004540314569C6CB0A5DC070E0C33000004540F1289E60060A5DC09117C630000045406A0CD3FA40095DC0964EC83000004540E3EF07957B085DC08C85CA3000004540B0E53D2FB6075DC075BCCC3000004540E3C872C9F0065DC04FF3CE30000045408AABA7632B065DC01B2AD13000004540308EDCFD65055DC0DA60D3300000454070831298A0045DC08A97D530000045408A654732DB035DC02CCED73000004540A3477CCC15035DC0C004DA30000045407629B16650025DC0463BDC3000004540E41DE7008B015DC0BE71DE30000045402AFF1B9BC5005DC028A8E0300000454070E0503500005DC076DEE2300000454038CFF53400005DC01C27F0E1E4B7444046140224EF0E5DC01C47DCDAAAAA44407EC54B63B00F5DC0EB2ADADAAAAA4440B67695A271105DC0AC0ED8DAAAAA44406227DFE132115DC05FF2D5DAAAAA444053D82821F4115DC005D6D3DAAAAA4440D7757160B5125DC09CB9D1DAAAAA44403C26BB9F76135DC0339DCFDAAAAA4440A1D604DF37145DC0AE80CDDAAAAA44407A864E1EF9145DC01A64CBDAAAAA44407123975DBA155DC07947C9DAAAAA444003D3E09C7B165DC0D82AC7DAAAAA444095822ADC3C175DC01B0EC5DAAAAA4440E031741BFE175DC05DF1C2DAAAAA4440E5E0BD5ABF185DC084D4C0DAAAAA44400A7D069A80195DC0AAB7BEDAAAAA4440C82B50D9411A5DC0C29ABCDAAAAA444041DA9918031B5DC0CD7DBADAAAAA44407388E357C41B5DC0BB60B8DAAAAA4440A5362D97851C5DC0A943B6DAAAAA4440F6D175D6461D5DC08926B4DAAAAA44409B7FBF15081E5DC05B09B2DAAAAA4440402D0955C91E5DC02DECAFDAAAAA44409FDA52948A1F5DC0E3CEADDAAAAA4440FE879CD34B205DC08BB1ABDAAAAA4440EF21E5120D215DC02594A9DAAAAA444008CF2E52CE215DC0BE76A7DAAAAA4440947B78918F225DC03C59A5DAAAAA44402028C2D050235DC0B93BA3DAAAAA444065D40B1012245DC0291EA1DAAAAA4440836D544FD3245DC07C009FDAAAAA444082199E8E94255DC0D0E29CDAAAAA44403BC5E7CD55265DC015C59ADAAAAA4440F470310D17275DC04CA798DAAAAA4440201C7B4CD8275DC0758996DAAAAA44406BB4C38B99285DC0906B94DAAAAA4440975F0DCB5A295DC09D4D92DAAAAA44407C0A570A1C2A5DC09C2F90DAAAAA44401BB5A049DD2A5DC08D118EDAAAAA4440745FEA889E2B5DC07EF38BDAAAAA4440ECF632C85F2C5DC053D589DAAAAA4440FFA07C07212D5DC019B787DAAAAA4440CB4AC646E22D5DC0E09885DAAAAA444097F40F86A32E5DC0987A83DAAAAA44401D9E59C5642F5DC0435C81DAAAAA44407B34A20426305DC0D13D7FDAAAAA4440BBDDEB43E7305DC05F1F7DDAAAAA4440B4863583A8315DC0E0007BDAAAAA4440662F7FC269325DC052E278DAAAAA4440F2C4C7012B335DC0B6C376DAAAAA44405E6D1141EC335DC01AA574DAAAAA4440CA155B80AD345DC0628672DAAAAA4440AABDA4BF6E355DC09C6770DAAAAA44408965EEFE2F365DC0C8486EDAAAAA444042FA363EF1365DC0F4296CDAAAAA4440DBA1807DB2375DC0110B6ADAAAAA44402D49CABC73385DC013EC67DAAAAA44403AF013FC34395DC014CD65DAAAAA444000975D3BF6395DC008AE63DAAAAA4440E52AA67AB73A5DC0ED8E61DAAAAA444065D1EFB9783B5DC0C56F5FDAAAAA4440E57739F9393C5DC08E505DDAAAAA4440D71D8338FB3C5DC049315BDAAAAA444011C4CC77BC3D5DC0F61159DAAAAA4440DD5615B77D3E5DC0A4F256DAAAAA444089FC5EF63E3F5DC034D354DAAAAA4440', 31244, 'OWYHEE SOUTH MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000004F0000005FC4A382D76E5DC0C8A0A22F0000454068C8C7169C6F5DC0ED64A02F000045401080AE03CD6C5DC0C3D74B855535454043CC4BD099495DC04BFB9B30006045409B5478C4DC485DC0902F9E300060454046EFA5B81F485DC0C763A030006045401077D2AC62475DC0F097A23000604540751100A1A5465DC00BCCA43000604540FA982C95E8455DC02600A7300060454018335A892B455DC02434A9300060454010BA867D6E445DC01568AB3000604540E853B471B1435DC0059CAD300060454099DAE065F4425DC0DACFAF3000604540E5730E5A37425DC0AE03B230006045404FFA3A4E7A415DC06637B4300060454054936842BD405DC01E6BB630006045403219953600405DC0C89EB8300060454047DF143600405DC08C802A300000454022EF38CAC4405DC0F047283000004540FDFE5C5E89415DC0450F263000004540910E81F24D425DC08CD6233000004540DF1DA58612435DC0C59D2130000045404D1AC81AD7435DC0F0641F30000045400E29ECAE9B445DC00C2C1D30000045401638104360455DC01BF31A3000004540914634D724465DC01CBA1830000045400C55586BE9465DC01D8116300000454041637CFFAD475DC001481430000045402F71A09372485DC0D80E1230000045401D7FC42737495DC0A0D50F3000004540C58CE8BBFB495DC05A9C0D300000454046870B50C04A5DC015630B300000454061942FE4844B5DC0B3290930000045407DA15378494C5DC043F006300000454051AE770C0E4D5DC0C5B604300000454026BB9BA0D24D5DC0477D0230000045406EC7BF34974E5DC0AD43003000004540B6D3E3C85B4F5DC0050AFE2F00004540B8DF075D20505DC05DD0FB2F00004540D9D82AF1E4505DC09896F92F0000454094E44E85A9515DC0C65CF72F0000454009F072196E525DC0F322F52F0000454038FB96AD32535DC005E9F22F000045406706BB41F7535DC016AFF02F000045404F11DFD5BB545DC00C75EE2F00004540F11B036A80555DC0013BEC2F00004540932627FE44565DC0DA00EA2F00004540EE304B9209575DC0B3C6E72F0000454023286E26CE575DC07E8CE52F00004540F13192BA92585DC02D52E32F00004540C03BB64E57595DC0DC17E12F000045404945DAE21B5A5DC06FDDDE2F000045408B4EFE76E05A5DC002A3DC2F00004540CD57220BA55B5DC08668DA2F00004540C860469F695C5DC0FD2DD82F000045407E696A332E5D5DC058F3D52F00004540ED718EC7F25D5DC0B2B8D32F000045407B67B15BB75E5DC0FF7DD12F00004540A36FD5EF7B5F5DC03D43CF2F00004540CC77F98340605DC06D08CD2F00004540687F1D1805615DC08FCDCA2F00004540048741ACC9615DC0A392C82F00004540598E65408E625DC0A957C62F00004540AE9589D452635DC0A11CC42F00004540BE9CAD6817645DC08BE1C12F00004540A690D0FCDB645DC067A6BF2F000045402897F490A0655DC0356BBD2F00004540AA9D182565665DC0F52FBB2F00004540E6A33CB929675DC0A6F4B82F00004540DCA9604DEE675DC058B9B62F000045408BAF84E1B2685DC0ED7DB42F000045403AB5A87577695DC07542B22F00004540A3BACC093C6A5DC0FC06B02F000045400CC0F09D006B5DC067CBAD2F0000454007B21332C56B5DC0C48FAB2F00004540E4B637C6896C5DC02254A92F00004540C0BB5B5A4E6D5DC06318A72F000045400FC07FEE126E5DC0A4DCA42F000045405FC4A382D76E5DC0C8A0A22F00004540', 31245, 'PARADISE NORTH MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000057000000C374A5293D4F5DC090CE27DAAAAA4440BB98D83500505DC0F9A825DAAAAA44408E04954711715DC01B2AB77344E4444068C8C7169C6F5DC0ED64A02F000045405FC4A382D76E5DC0C8A0A22F000045400FC07FEE126E5DC0A4DCA42F00004540C0BB5B5A4E6D5DC06318A72F00004540E4B637C6896C5DC02254A92F0000454007B21332C56B5DC0C48FAB2F000045400CC0F09D006B5DC067CBAD2F00004540A3BACC093C6A5DC0FC06B02F000045403AB5A87577695DC07542B22F000045408BAF84E1B2685DC0ED7DB42F00004540DCA9604DEE675DC058B9B62F00004540E6A33CB929675DC0A6F4B82F00004540AA9D182565665DC0F52FBB2F000045402897F490A0655DC0356BBD2F00004540A690D0FCDB645DC067A6BF2F00004540BE9CAD6817645DC08BE1C12F00004540AE9589D452635DC0A11CC42F00004540598E65408E625DC0A957C62F00004540048741ACC9615DC0A392C82F00004540687F1D1805615DC08FCDCA2F00004540CC77F98340605DC06D08CD2F00004540A36FD5EF7B5F5DC03D43CF2F000045407B67B15BB75E5DC0FF7DD12F00004540ED718EC7F25D5DC0B2B8D32F000045407E696A332E5D5DC058F3D52F00004540C860469F695C5DC0FD2DD82F00004540CD57220BA55B5DC08668DA2F000045408B4EFE76E05A5DC002A3DC2F000045404945DAE21B5A5DC06FDDDE2F00004540C03BB64E57595DC0DC17E12F00004540F13192BA92585DC02D52E32F0000454023286E26CE575DC07E8CE52F00004540EE304B9209575DC0B3C6E72F00004540932627FE44565DC0DA00EA2F00004540F11B036A80555DC0013BEC2F000045404F11DFD5BB545DC00C75EE2F000045406706BB41F7535DC016AFF02F0000454038FB96AD32535DC005E9F22F0000454009F072196E525DC0F322F52F0000454094E44E85A9515DC0C65CF72F00004540D9D82AF1E4505DC09896F92F00004540B8DF075D20505DC05DD0FB2F00004540B6D3E3C85B4F5DC0050AFE2F000045406EC7BF34974E5DC0AD4300300000454026BB9BA0D24D5DC0477D02300000454051AE770C0E4D5DC0C5B60430000045407DA15378494C5DC043F006300000454061942FE4844B5DC0B32909300000454046870B50C04A5DC015630B3000004540C58CE8BBFB495DC05A9C0D30000045401D7FC42737495DC0A0D50F30000045402F71A09372485DC0D80E12300000454041637CFFAD475DC001481430000045400C55586BE9465DC01D81163000004540914634D724465DC01CBA1830000045401638104360455DC01BF31A30000045400E29ECAE9B445DC00C2C1D30000045404D1AC81AD7435DC0F0641F3000004540DF1DA58612435DC0C59D213000004540910E81F24D425DC08CD6233000004540FDFE5C5E89415DC0450F26300000454022EF38CAC4405DC0F04728300000454047DF143600405DC08C802A3000004540EFA1A83500405DC0C5B352DAAAAA4440C0C9DB41C3405DC02C8F50DAAAAA44404BF10E4E86415DC0926A4EDAAAAA4440D518425A49425DC0DC454CDAAAAA4440194075660C435DC025214ADAAAAA44401767A872CF435DC061FC47DAAAAA4440347BDA7E92445DC08FD745DAAAAA4440ECA10D8B55455DC0A1B243DAAAAA44405DC8409718465DC0B28D41DAAAAA4440CEEE73A3DB465DC0C4683FDAAAAA4440F814A7AF9E475DC0B9433DDAAAAA4440DD3ADABB61485DC0A11E3BDAAAAA44407A600DC824495DC07AF938DAAAAA4440188640D4E7495DC045D436DAAAAA444070AB73E0AA4A5DC011AF34DAAAAA4440C7D0A6EC6D4B5DC0C08932DAAAAA4440B2E2D8F8304C5DC06F6430DAAAAA44407C070C05F44C5DC0103F2EDAAAAA4440472C3F11B74D5DC095192CDAAAAA44408550721D7A4E5DC01AF429DAAAAA4440C374A5293D4F5DC090CE27DAAAAA4440', 31246, 'PARADISE SOUTH MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000003E00000056881D289E345DC071F0013E11F142401816FD8855355DC09B3B003E11F14240E860566BAF2A5DC0E92CA2DEE4FF4240B5F7644DE8AC5CC099872214F7FF4240F4CB2896C90B5DC088FA623E11F14240106308F7800C5DC0BB47613E11F14240C50CE957380D5DC0D2945F3E11F142407BB6C9B8EF0D5DC0E8E15D3E11F142403060AA19A70E5DC0FF2E5C3E11F1424079F6897A5E0F5DC0F97B5A3E11F14240A29F6ADB15105DC002C9583E11F14240CA484B3CCD105DC0EE15573E11F14240ADF12B9D84115DC0DA62553E11F1424068870BFE3B125DC0B9AF533E11F142400430EC5EF3125DC097FC513E11F142405AD8CCBFAA135DC05949503E11F14240CF6DAC2062145DC01B964E3E11F14240DF158D8119155DC0DDE24C3E11F14240A8BD6DE2D0155DC0912F4B3E11F1424071654E4388165DC0377C493E11F1424013FA2DA43F175DC0DDC8473E11F1424095A10E05F7175DC07515463E11F14240D248EF65AE185DC0FF61443E11F142400EF0CFC665195DC089AE423E11F142402384AF271D1A5DC005FB403E11F14240D32A9088D41A5DC081473F3E11F1424082D170E98B1B5DC0E0933D3E11F14240EC77514A431C5DC04EE03B3E11F142402E0B31ABFA1C5DC09F2C3A3E11F1424051B1110CB21D5DC0F178383E11F142407357F26C691E5DC034C5363E11F1424009FDD2CD201F5DC07811353E11F14240BF8FB22ED81F5DC0AD5D333E11F142405535938F8F205DC0D5A9313E11F14240A5DA73F046215DC0FCF52F3E11F14240CD6C5351FE215DC015422E3E11F14240D71134B2B5225DC0208E2C3E11F142409AB614136D235DC02CDA2A3E11F142405D5BF57324245DC02926293E11F14240F9ECD4D4DB245DC02672273E11F142402F91B53593255DC015BE253E11F14240653596964A265DC0F609243E11F142409BD976F701275DC0C955223E11F14240646A5658B9275DC09BA1203E11F142400E0E37B970285DC060ED1E3E11F14240B7B1171A28295DC025391D3E11F142401A55F87ADF295DC0DC841B3E11F1424056E5D7DB962A5DC092D0193E11F142407388B83C4E2B5DC02D1C183E11F14240492B999D052C5DC0D667163E11F14240DACD79FEBC2C5DC062B3143E11F14240895D595F742D5DC0EFFE123E11F1424019003AC02B2E5DC06D4A113E11F142401CA21A21E32E5DC0EC950F3E11F142408531FA819A2F5DC05CE10D3E11F1424042D3DAE251305DC0BE2C0C3E11F14240FF74BB4309315DC021780A3E11F1424076169CA4C0315DC075C3083E11F142400BA57B0578325DC0BB0E073E11F142403C465C662F335DC0015A053E11F142406CE73CC7E6335DC039A5033E11F1424056881D289E345DC071F0013E11F14240', 24863, 'REVEILLE SOUTH MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000001B0000002B6D5C25E7E55BC0B966CAEB99B93F403C628C581AE95BC0DFBCEB9544843F405673BAB3EB455CC0940912C977F73F405E37CAB3EB455CC0C10E98B188184040FE0F1D0941455CC0252099B18818404039FB705E96445CC07C319AB18818404092D3C3B3EB435CC0E1429BB188184040A5AB160941435CC037549CB18818404099966A5E96425CC080659DB188184040666EBDB3EB415CC0D7769EB1881840403346100941415CC01F889FB1881840409A30645E96405CC06899A0B1881840402008B7B3EB3F5CC0A2AAA1B188184040A6DF0909413F5CC0EBBBA2B188184040C7C95D5E963E5CC026CDA3B188184040C1A0B0B3EB3D5CC052DEA4B188184040BB770309413D5CC08DEFA5B1881840409561575E963C5CC0B900A7B1881840406567E9E61E395CC0F5455607DE3D404023AD271A52345CC00473CD628E6B404099F815D8CB2D5CC0C8F96925846C40406279586FA7295CC05AB17DB288684040A0629C0841135CC063FA084C225240401FC00BAE6FE65BC0AE986A2F5B2040402C88F7AD6FE65BC04C0528B966F63F40FCE29A692BE25BC0096D876311D13F402B6D5C25E7E55BC0B966CAEB99B93F40', 4525, 'SELLS 1 MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000015000000DE79ED0C41135DC0394A6DF8CC0C42401F97C56196F85CC033B19E5E33D34140EC496DD90D145DC077E4DF2A00A841404B5C7DD90D145DC01030AD7AFABC4140F6A4A7EA1E195DC09A10AFC499C9414019D5A23CD71B5DC0585AD6AC4ED34140D073CB0C41175DC076EFDFAC4ED3414035D2F09945175DC021A81400E6E64140DD25E5B9A91F5DC0D2C381B1CAE641409BF017D4B21F5DC09C511DD789EF4140ED2B5041531F5DC0A7E349F192EF41401C34B275651F5DC05373DB2684FC4140CC54F26E2B265DC04DC8F8408DFC414020BD066F2B265DC071A537529E154240804731B290295DC06C80B1A0B9154240EEB080599E295DC082E384434B264240B2CC490D412B5DC07FF5AA5D54264240F95000B0D22B5DC0579613A37727424033CFF522CE2B5DC04CD607E41E354240AD36DCF8922B5DC00A5808E41E354240DE79ED0C41135DC0394A6DF8CC0C4240', 6055, 'SHOSHONE MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000A000000A39410ACAAD25FC0C3F5285C8F423E400E5D9A6CCDCC5FC04FECFC361F143E400A6D9450559A5EC0430BBF8A422F3F40EB0896D956535EC0C0643E7B89663F400BD12170A40B5EC04E33935E8ACD3F4001DC2C5E2C115EC0F1B8A81611F13F4009FB761211595EC00F4757E9EE8E3F405BB39597FCE25EC062F6B2EDB4213F40C4D155BABB5B5FC03333333333B33E40A39410ACAAD25FC0C3F5285C8F423E40', 23992, 'AR209(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000A000000A39410ACAAD25FC0C3F5285C8F423E400E5D9A6CCDCC5FC04FECFC361F143E400A6D9450559A5EC0430BBF8A422F3F40EB0896D956535EC0C0643E7B89663F400BD12170A40B5EC04E33935E8ACD3F4001DC2C5E2C115EC0F1B8A81611F13F4009FB761211595EC00F4757E9EE8E3F405BB39597FCE25EC062F6B2EDB4213F40C4D155BABB5B5FC03333333333B33E40A39410ACAAD25FC0C3F5285C8F423E40', 23993, 'AR209(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000A0000005D6BEF5355B55AC0000000000000424003339534B5B15AC0408E41823DED4140E754320054375AC0B8AE9811DE2C42401271CEE38B5A59C0D62EB7C546D5414011A7936C755859C09EEFA7C64BE741407061DD78777759C04529215855F541407061DD7877B759C0DFC2BAF1EE0E42407061DD7877F759C0795C548B882842402B8716D9CE375AC00839EFFFE33E42405D6BEF5355B55AC00000000000004240', 24039, 'AR314(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000074000000005D4934F8425BC0484ECCDC88C83F402BE29D0469585BC0026EEFCE20A33F403A3898C67F585BC01AA2059678A33F40A20F8F8B96585BC0943C7052D0A33F40DBC7707FAD585BC0B50A7A7F27A43F400C4AF3A1C4585BC0AB66F61B7EA43F408321C7F2DB585BC098D8C926D4A43F40EC11A071F3585BC0CB51D09E29A53F4029932D1E0B595BC0E10EEA827EA53F404A5622F822595BC0B04CF7D1D2A53F4097C02CFF3A595BC0F6DEE08A26A63F40F96FFE3253595BC04F0287AC79A63F4092B644936B595BC0E0D5D635CCA63F40CF0CAF1F84595BC01EE2B4251EA73F40F0B1E9D79C595BC033DD167B6FA73F40641EA4BBB5595BC05C4FE134C0A73F40897E89CACE595BC0DFEE095210A83F402C124604E8595BC0812682D15FA83F40D2188668015A5BC007613BB2AEA83F40FBABF3F61A5A5BC01FA02FF3FCA83F4069E538AF345A5BC0489A54934AA93F4029DFFF904E5A5BC0989CA89197A93F40FEB2F29B685A5BC0F5A825EDE3A93F406054B9CF825A5BC01458CEA42FAA3F40DCB7FB2B9D5A5BC0DBAB9CB77AAA3F4078D161B0B75A5BC081889724C5AA3F40EE94935CD25A5BC075D2C5EA0EAB3F40A0BD3530ED5A5BC0F06D2E0958AB3F40B12CEF2A085B5BC0443FD87EA0AB3F40C69D644C235B5BC0E7C1D24AE8AB3F40BDF13C943E5B5BC031712D6C2FAC3F4034BE1A025A5B5BC0A67CF3E175AC3F40D2BEA295755B5BC091AB38ABBBAC3F40D29B784E915B5BC0FE0F15C700AD3F408CEA3E2CAD5B5BC068BCA03445AD3F404A2E972EC95B5BC0C877EFF288AD3F40480F2555E55B5BC066EB2101CCAD3F40A8FD889F015C5BC00975545E0EAE3F409E7B640D1E5C5BC0AE72A30950AE3F404CF9579E3A5C5BC061703C0291AE3F40F7D30252575C5BC049803747D1AE3F400E680428745C5BC0F179C6D710AF3F40FC25FD1F915C5BC027520EB34FAF3F4051578B39AE5C5BC08F4938D88DAF3F408E334C74CB5C5BC0E3827A46CBAF3F401705DECFE85C5BC02E8A02FD07B03F409902DE4B065D5BC0C53602FB43B03F407976EAE7235D5BC0B8ABAF3F7FB03F404E5F9DA3415D5BC07F5745CAB9B03F4054F4937E5F5D5BC075A8FD99F3B03F40A1596A787D5D5BC02B0D13AE2CB13F403AA1BB909B5D5BC0048BC80565B13F402CC921C7B95D5BC0FADB5CA09CB13F4058D0361BD85D5BC04451177DD3B13F4017DB968CF65D5BC028F03A9B09B23F401AAFD81A155E5BC0ABA017FA3EB23F40225E97C5335E5BC0CDB3F49873B23F40E8D36B8C525E5BC0B2112277A7B23F401CD6EC6E715E5BC041A2EF93DAB23F40BC50B36C905E5BC0A4E4B5EE0CB33F40832F5885AF5E5BC0C4C0C4863EB33F403F2571B8CE5E5BC04C01795B6FB33F400E0B9605EE5E5BC093702F6C9FB33F40C1935C6C0D5F5BC0DD8D40B8CEB33F4096855BEC2C5F5BC0A3BA113FFDB33F403CA629854C5F5BC0130D04002BB43F40E9955B366C5F5BC0A5E67CFA57B43F4061F585FF8B5F5BC08DF4E52D84B43F40C5893FE0AB5F5BC02898A499AFB43F40FAE01BD8CB5F5BC050612F3DDAB43F400C88AEE6EB5F5BC08148F41704B53F4058328D0B0C605BC0594661292DB53F40ED6C4B462C605BC01536F17055B53F405E9F7A964C605BC09C5B16EE7CB53F40097DB0FB6C605BC0E9DD4FA0A3B53F40125A7D758D605BC04FE31C87C9B53F403CD77503AE605BC0AB92FCA1EEB53F401B5C2BA5CE605BC006C769F012B63F409662305AEF605BC013D5F47136B63F408652162210615BC0162F212659B63F40C5936EFC30615BC024DE7A0C7BB63F40A18DCAE851615BC0F03692249CB63F40CB94BAE672615BC025F7EE6DBCB63F40B923D1F593615BC01C562EE8DBB63F403B7C9D15B5615BC06BA8E092FAB63F40E505B145D6615BC0638E9A6D18B73F40A9EF9985F7615BC02BD6017835B73F4019A1E9D418625BC07A6BAFB151B73F40E96E30333A625BC0A985401A6DB73F40E174FB9F5B625BC0DCF25AB187B73F40231BDC1A7D625BC0F5CCA876A1B73F403AA361A39E625BC0FCE1CF69BAB73F40F0281939C0625BC00A4C7A8AD2B73F40A3EE91DBE1625BC02F7056D8E9B73F4098355B8A03635BC0D44A1B5300B83F40E93F044525635BC0A88C7BFA15B83F40C416190B47635BC090E629CE2AB83F40B4FB28DC68635BC041A0E1CD3EB83F40F21DC2B78A635BC02B4D62F951B83F408E99719DAC635BC00235675064B83F40799DC58CCE635BC03C82B8D275B83F407C454B85F0635BC0C47C118086B83F40D0C0908612645BC0A6E5425896B83F403E2B239034645BC08FE7145BA5B83F403D8E8EA156645BC0A0AC4F88B3B83F40BD1861BA78645BC0D941C8DFC0B83F4089E627DA9A645BC01AB45361CDB83F40CF006F00BD645BC0C3C4C20CD9B83F402E84C32CDF645BC03BCCEEE1E3B83F400B729F01C56B5BC0992FEFF2F4B93F4096A7DE7E97735BC0B41C9C2B83AD3F40F2A60C4609785BC07706B79744B43F40A1B781AC6F7A5BC0526E262628CD3F40A2E7B8E0816E5BC06E204B7622F23F40D3894F34F8425BC0829FDB2549E03F40005D4934F8425BC0484ECCDC88C83F40', 4565, 'TOMBSTONE A MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000007500000022C1477BF1555BC0F11F38A855553F40C27DBF2E9D565BC0392B36A855553F40B923CA2E9D565BC04C11505300803F4080A0474509405BC0DAF6F8AEB0A53F4049BE3C672B325BC02D1E899844B43F40CB15F8551A215BC02948D2AFB0D53F40AADB6B11D60C5BC08B1B116611D13F40E8B44C11D60C5BC0EE7F0CA955553F40467FC4C4810D5BC0108F0AA955553F405E493C782D0E5BC0319E08A955553F404E00B32BD90E5BC037AD06A955553F4065CA2ADF840F5BC03CBC04A955553F40F093A29230105BC025CB02A955553F407B5D1A46DC105BC02ADA00A955553F40052792F987115BC0F7E8FEA855553F4090F009AD33125BC0E1F7FCA855553F408EB98160DF125BC0AE06FBA855553F40D282F9138B135BC07B15F9A855553F40D04B71C736145BC04824F7A855553F408814E97AE2145BC0F832F5A855553F4086DD602E8E155BC0A941F3A855553F40F7A5D8E139165BC03E50F1A855553F40686E5095E5165BC0EF5EEFA855553F40D936C84891175BC0846DEDA855553F4004FF3FFC3C185BC0FC7BEBA855553F402FC7B7AFE8185BC0918AE9A855553F405A8F2F6394195BC00A99E7A855553F403E57A716401A5BC066A7E5A855553F40DC1E1FCAEB1A5BC0C2B5E3A855553F407BE6967D971B5BC03BC4E1A855553F4019AE0E31431C5BC07BD2DFA855553F40707586E4EE1C5BC0D8E0DDA855553F40C83CFE979A1D5BC018EFDBA855553F40D903764B461E5BC03CFDD9A855553F40EBCAEDFEF11E5BC07C0BD8A855553F40FC9165B29D1F5BC0A019D6A855553F40C758DD6549205BC0C527D4A855553F404C1F5519F5205BC0CD35D2A855553F40D0E5CCCCA0215BC0D543D0A855553F4055AC44804C225BC0DD51CEA855553F409372BC33F8225BC0C85FCCA855553F40D13834E7A3235BC0D06DCAA855553F40C9FEAB9A4F245BC0BC7BC8A855553F40C1C4234EFB245BC08C89C6A855553F40738A9B01A7255BC05C97C4A855553F40245013B552265BC02BA5C2A855553F408F158B68FE265BC0FBB2C0A855553F40FBDA021CAA275BC0AFC0BEA855553F4066A07ACF55285BC062CEBCA855553F408A65F28201295BC0F9DBBAA855553F40AF2A6A36AD295BC0ADE9B8A855553F408EEFE1E9582A5BC044F7B6A855553F406CB4599D042B5BC0C004B5A855553F400479D150B02B5BC05712B3A855553F409C3D49045C2C5BC0D21FB1A855553F403402C1B7072D5BC0312DAFA855553F4086C6386BB32D5BC0AD3AADA855553F40918AB01E5F2E5BC00C48ABA855553F409C4E28D20A2F5BC04F55A9A855553F40A812A085B62F5BC0AE62A7A855553F408CC3163962305BC0F16FA5A855553F4051878EEC0D315BC0347DA3A855553F40CF4A06A0B9315BC05A8AA1A855553F404E0E7E5365325BC081979FA855553F4086D1F50611335BC0A8A49DA855553F40BE946DBABC335BC0CFB19BA855553F40F757E56D68345BC0DABE99A855553F40E81A5D2114355BC0E4CB97A855553F4094DDD4D4BF355BC0D3D895A855553F403FA04C886B365BC0C1E593A855553F40EB62C43B17375BC0B0F291A855553F4050253CEFC2375BC09EFF8FA855553F40B5E7B3A26E385BC0710C8EA855553F401AAA2B561A395BC043198CA855553F40396CA309C6395BC015268AA855553F40112E1BBD713A5BC0CB3288A855553F40E9EF92701D3B5BC0823F86A855553F407BB10A24C93B5BC0384C84A855553F40547382D7743C5BC0D25882A855553F409F34FA8A203D5BC0886580A855553F40EBF5713ECC3D5BC006727EA855553F4037B7E9F1773E5BC0A07E7CA855553F403C7861A5233F5BC01E8B7AA855553F404139D958CF3F5BC09C9778A855553F4046FA500C7B405BC0FEA376A855553F4005BBC8BF26415BC07CB074A855553F407E7B4073D2415BC0C1BC72A855553F40F63BB8267E425BC023C970A855553F406FFC2FDA29435BC069D56EA855553F40A1BCA78DD5435BC0AEE16CA855553F40D37C1F4181445BC0F4ED6AA855553F40BF3C97F42C455BC01DFA68A855553F40ABFC0EA8D8455BC0470667A855553F4050BC865B84465BC0701265A855553F40F57BFE0E30475BC07E1E63A855553F40543B76C2DB475BC08B2A61A855553F40B3FAED7587485BC098365FA855553F4012BA652933495BC08A425DA855553F402B79DDDCDE495BC0974E5BA855553F40FD3755908A4A5BC0885A59A855553F4016F7CC43364B5BC05D6657A855553F40A2B544F7E14B5BC0327255A855553F407474BCAA8D4C5BC0077E53A855553F40BA32345E394D5BC0DC8951A855553F4046F1AB11E54D5BC095954FA855553F408BAF23C5904E5BC04EA14DA855553F408B6D9B783C4F5BC0EBAC4BA855553F408A2B132CE84F5BC0A4B849A855553F4089E98ADF93505BC040C447A855553F40619401933F515BC0C1CF45A855553F40D3517946EB515BC05EDB43A855553F40460FF1F996525BC0DEE641A855553F40B8CC68AD42535BC05FF23FA855553F40E489E060EE535BC0C3FD3DA855553F40114758149A545BC028093CA855553F403D04D0C745555BC08C143AA855553F4022C1477BF1555BC0F11F38A855553F40', 4570, 'TOMBSTONE B MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000B30000003FD62BD05D7F5BC0D515BFA755553F40CCEF0F4609805BC0CC1FBDA755553F409239344609805BC02D44028733E33F40FD0E0C24E77D5BC0776E94FEAAEA3F40AAB115571A715BC03154588733F33F40EE885B783C335BC0EE653AEE99D93F40AADB6B11D60C5BC08B1B116611D13F40E8B44C11D60C5BC0EE7F0CA955553F4005D12F87810D5BC0D58F0AA955553F40DBEC12FD2C0E5BC0839F08A955553F406B08F672D80E5BC04DAF06A955553F40DC36DAE8830F5BC0FCBE04A955553F406C52BD5E2F105BC0AACE02A955553F40B56DA0D4DA105BC058DE00A955553F40E09B844A86115BC0EAEDFEA855553F40E3B667C031125BC07CFDFCA855553F40E6D14A36DD125BC0F20CFBA855553F40A3EC2DAC88135BC0681CF9A855553F40411A122234145BC0DE2BF7A855553F40B734F597DF145BC0543BF5A855553F402D4FD80D8B155BC0AD4AF3A855553F40A469BB8336165BC0075AF1A855553F40B5969FF9E1165BC06169EFA855553F40E5B0826F8D175BC09F78EDA855553F40CECA65E538185BC0DC87EBA855553F4099F7495BE4185BC01A97E9A855553F403C112DD18F195BC03BA6E7A855553F40E02A10473B1A5BC05DB5E5A855553F408344F3BCE61A5BC07EC4E3A855553F40C170D732921B5BC083D3E1A855553F40D789BAA83D1C5BC089E2DFA855553F40EEA29D1EE91C5BC08EF1DDA855553F40E5CE8194941D5BC07700DCA855553F40B5E7640A401E5BC0600FDAA855553F4086004880EB1E5BC04A1ED8A855553F4010192BF6961F5BC0332DD6A855553F407A440F6C42205BC0003CD4A855553F40045DF2E1ED205BC0CD4AD2A855553F404875D55799215BC07E59D0A855553F40458DB8CD44225BC02E68CEA855553F4023B89C43F0225BC0DF76CCA855553F4020D07FB99B235BC07485CAA855553F40D6E7622F47245BC02594C8A855553F406E1247A5F2245BC0BAA2C6A855553F40DE292A1B9E255BC032B1C4A855553F404F410D9149265BC0ABBFC2A855553F40BF58F006F5265BC023CEC0A855553F40CA82D47CA0275BC09CDCBEA855553F40AD99B7F24B285BC0F8EABCA855553F4091B09A68F7285BC055F9BAA855553F4056DA7EDEA2295BC0B107B9A855553F40F3F061544E2A5BC0F215B7A855553F40900745CAF92A5BC03224B5A855553F40E71D2840A52B5BC07232B3A855553F401F470CB6502C5BC09640B1A855553F402F5DEF2BFC2C5BC0BA4EAFA855553F404073D2A1A72D5BC0DE5CADA855553F40319CB617532E5BC0E66AABA855553F40FBB1998DFE2E5BC0EE78A9A855553F40C5C77C03AA2F5BC0F686A7A855553F4049DD5F7955305BC0FE94A5A855553F40AE0544EF00315BC0EAA2A3A855553F40EB1A2765AC315BC0D6B0A1A855553F4029300ADB57325BC0A6BE9FA855553F402045ED5003335BC075CC9DA855553F40F86CD1C6AE335BC045DA9BA855553F40A881B43C5A345BC015E899A855553F40599697B205355BC0C8F597A855553F40EABD7B28B1355BC07C0396A855553F4055D25E9E5C365BC02F1194A855553F40BFE6411408375BC0C71E92A855553F40E3FA248AB3375BC05E2C90A855553F40E82109005F385BC0F6398EA855553F40C535EC750A395BC071478CA855553F40A349CFEBB5395BC0EC548AA855553F406170B361613A5BC0676288A855553F40B28396D70C3B5BC0C66F86A855553F404997794DB83B5BC0267D84A855553F409AAA5CC3633C5BC0858A82A855553F40CCD040390F3D5BC0E49780A855553F40D6E323AFBA3D5BC027A57EA855553F40E1F60625663E5BC06AB27CA855553F40A509EA9A113F5BC090BF7AA855553F404A2FCE10BD3F5BC0B7CC78A855553F40C841B18668405BC0DED976A855553F40455494FC13415BC005E774A855553F40A4797872BF415BC010F472A855553F40DB8B5BE86A425BC01A0171A855553F40CC9D3E5E16435BC0250E6FA855553F40BDAF21D4C1435BC0131B6DA855553F408FD4054A6D445BC002286BA855553F403AE6E8BF18455BC0F03469A855553F40E4F7CB35C4455BC0C34167A855553F40701CB0AB6F465BC0B14E65A855553F408E2D93211B475BC0675B63A855553F40F23E7697C6475BC03A6861A855553F401050590D72485BC0F0745FA855553F40C8733D831D495BC0A6815DA855553F40A08420F9C8495BC0408E5BA855553F407795036F744A5BC0DA9A59A855553F40E9B8E7E41F4B5BC091A757A855553F407AC9CA5ACB4B5BC00EB455A855553F40C5D9ADD0764C5BC08CC053A855553F4010EA9046224D5BC00ACD51A855553F403B0D75BCCD4D5BC088D94FA855553F40F91C5832794E5BC0EAE54DA855553F40FE2C3BA8244F5BC04CF24BA855553F40BC3C1E1ED04F5BC0AEFE49A855553F405B5F02947B505BC00F0B48A855553F40D26EE50927515BC0551746A855553F40047EC87FD2515BC09B2344A855553F405CA0ACF57D525BC0C42F42A855553F4047AF8F6B29535BC0EE3B40A855553F4079BE72E1D4535BC017483EA855553F4063CD555780545BC040543CA855553F40E9EE39CD2B555BC04E603AA855553F408DFD1C43D7555BC05B6C38A855553F40EC0B00B982565BC0687836A855553F40712DE42E2E575BC05A8434A855553F40893BC7A4D9575BC04B9032A855553F40A149AA1A85585BC03C9C30A855553F40B9578D9030595BC011A82EA855553F406B787106DC595BC0E6B32CA855553F403C86547C875A5BC0BBBF2AA855553F40C79337F2325B5BC090CB28A855553F4052A11A68DE5B5BC049D726A855553F40BEC1FEDD895C5BC002E324A855553F4003CFE153355D5BC09FEE22A855553F4001DCC4C9E05D5BC058FA20A855553F40E1FBA83F8C5E5BC0F4051FA855553F40DF088CB5375F5BC075111DA855553F4097156F2BE35F5BC0121D1BA855553F404F2252A18E605BC0922819A855553F40A14136173A615BC0F73317A855553F40134E198DE5615BC0773F15A855553F403E5AFC0291625BC0DC4A13A855553F404A79E0783C635BC0405611A855553F407685C3EEE7635BC088610FA855553F405A91A66493645BC0ED6C0DA855553F40F99C89DA3E655BC035780BA855553F4078BB6D50EA655BC0618309A855553F4017C750C695665BC08D8E07A855553F406FD2333C41675BC0BA9905A855553F40A8F017B2EC675BC0E6A403A855553F40BAFBFA2798685BC012B001A855553F40CB06DE9D43695BC022BBFFA755553F409711C113EF695BC016C6FDA755553F40432FA5899A6A5BC026D1FBA755553F400F3A88FF456B5BC01ADCF9A755553F4094446B75F16B5BC00DE7F7A755553F40D24E4EEB9C6C5BC001F2F5A755553F40F26B3261486D5BC0D9FCF3A755553F40307615D7F36D5BC0B107F2A755553F402980F84C9F6E5BC06C12F0A755553F40029DDCC24A6F5BC0441DEEA755553F40B4A6BF38F66F5BC00028ECA755553F4066B0A2AEA1705BC0BB32EAA755553F40D1B985244D715BC05A3DE8A755553F401ED6699AF8715BC0FA47E6A755553F4089DF4C10A4725BC09952E4A755553F40AEE82F864F735BC0395DE2A755553F406E0414FCFA735BC0BC67E0A755553F404D0DF771A6745BC03F72DEA755553F402C16DAE751755BC0A67CDCA755553F40C41EBD5DFD755BC02A87DAA755553F403D3AA1D3A8765BC09191D8A755553F408F42844954775BC0F89BD6A755553F40E24A67BFFF775BC043A6D4A755553F40ED524A35AB785BC08EB0D2A755553F40DA6D2EAB56795BC0D9BAD0A755553F40E6751121027A5BC008C5CEA755553F40AB7DF496AD7A5BC053CFCCA755553F400B98D80C597B5BC081D9CAA755553F408A9FBB82047C5BC094E3C8A755553F4009A79EF8AF7C5BC0C3EDC6A755553F4041AE816E5B7D5BC0D6F7C4A755553F405BC865E4067E5BC0E801C3A755553F404DCF485AB27E5BC0DF0BC1A755553F403FD62BD05D7F5BC0D515BFA755553F40', 4575, 'TOMBSTONE C MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000A0000005D6BEF5355B55AC0000000000000424003339534B5B15AC0408E41823DED4140E754320054375AC0B8AE9811DE2C42401271CEE38B5A59C0D62EB7C546D5414011A7936C755859C09EEFA7C64BE741407061DD78777759C04529215855F541407061DD7877B759C0DFC2BAF1EE0E42407061DD7877F759C0795C548B882842402B8716D9CE375AC00839EFFFE33E42405D6BEF5355B55AC00000000000004240', 24040, 'AR314(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000800000057EA5910CAF055C01766A19DD3F64240FF06EDD5C7F455C07E891D328AE14240F3DDF7B96B0655C0B6204A6A576E4240F2C693EEF88054C047109D54EA8E424033333333338354C0213D450E11A14240D7A3703D0A0755C03927F6D03E8442409A999999998955C05470784144C4424057EA5910CAF055C01766A19DD3F64240', 24041, 'AR315(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000800000057EA5910CAF055C01766A19DD3F64240FF06EDD5C7F455C07E891D328AE14240F3DDF7B96B0655C0B6204A6A576E4240F2C693EEF88054C047109D54EA8E424033333333338354C0213D450E11A14240D7A3703D0A0755C03927F6D03E8442409A999999998955C05470784144C4424057EA5910CAF055C01766A19DD3F64240', 24042, 'AR315(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000A00000000000000007055C066666666660646406666666666F655C0EE0912DBDD3D46409FCBD424780C56C0C26856B60F474640D6C743DFDD5956C0EAB303AE2B8846402A38BC20226256C0795C548B88684640F96B0D00B00C56C052B3ACA00E414640F621140008D355C001738813F3284640002A0B15529855C06A78C432471246407ADC5CA1349655C0D6C4025FD116464000000000007055C06666666666064640', 24045, 'AR321');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000800000033333333330358C033333333335342403836960B700F58C0F993426A24494240193BE12538BF57C08770276C9A3041408B0AE6F91D7057C0D30C4EE9051D404033333333336357C0795C548B8828404053944BE3179B57C0295C8FC2F5E84040840F255AF2CB57C0A2B8E34D7E91414033333333330358C03333333333534240', 24036, 'AR313(S)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000063000000426060AC5DDF5CC095811408DE1D414042496DD80DE05CC00B341308DE1D4140817B0F83B8DA5CC00C0BDFB288284140ED287BE91ED15CC0FF1665C499594140587B6BD70D805CC01416B68055554140A62B52D70D805CC0F9F7233C113141408DFEA8D70DA05CC0CCFB8B08DE1D4140E607B703BEA05CC067B08A08DE1D414017FEC32F6EA15CC0F5648908DE1D414049F4D05B1EA25CC082198808DE1D414034EADD87CEA25CC001CE8608DE1D414020E0EAB37EA35CC081828508DE1D4140C5D5F7DF2EA45CC0F2368408DE1D41404ADE050CDFA45CC063EB8208DE1D4140A9D312388FA55CC0D49F8108DE1D4140C1C81F643FA65CC037548008DE1D4140D9BD2C90EFA65CC09B087F08DE1D4140F2B239BC9FA75CC0F0BC7D08DE1D4140C3A746E84FA85CC045717C08DE1D414030AF541400A95CC09A257B08DE1D4140BBA36140B0A95CC0E1D97908DE1D414046986E6C60AA5CC01A8E7808DE1D41408C8C7B9810AB5CC061427708DE1D41408A8088C4C0AB5CC09AF67508DE1D4140897495F070AC5CC0C4AA7408DE1D4140227BA31C21AD5CC0EF5E7308DE1D4140DA6EB048D1AD5CC00C137208DE1D41404C62BD7481AE5CC037C77008DE1D4140BE55CAA031AF5CC0467B6F08DE1D4140EA48D7CCE1AF5CC0622F6E08DE1D4140163CE4F891B05CC063E36C08DE1D4140DC41F22442B15CC072976B08DE1D4140C134FF50F2B15CC0724B6A08DE1D414060270C7DA2B25CC073FF6808DE1D4140FF1919A952B35CC066B36708DE1D4140570C26D502B45CC058676608DE1D4140B0FE3201B3B45CC03D1B6508DE1D4140A203412D63B55CC021CF6308DE1D41406EF54D5913B65CC006836208DE1D41403AE75A85C3B65CC0DC366108DE1D414006D967B173B75CC0A4EA5F08DE1D41408BCA74DD23B85CC07B9E5E08DE1D4140ABCE8209D4B85CC043525D08DE1D4140EABF8F3584B95CC0FD055C08DE1D414029B19C6134BA5CC0B8B95A08DE1D414022A2A98DE4BA5CC0726D5908DE1D4140D492B6B994BB5CC01E215808DE1D41408683C3E544BC5CC0CAD45608DE1D4140D386D111F5BC5CC068885508DE1D41403F77DE3DA5BD5CC0063C5408DE1D41406467EB6955BE5CC0A5EF5208DE1D41408A57F89505BF5CC035A35108DE1D4140B04705C2B5BF5CC0C5565008DE1D4140483712EE65C05CC0470A4F08DE1D4140083A201A16C15CC0C9BD4D08DE1D41405B292D46C6C15CC03D714C08DE1D4140AD183A7276C25CC0B0244B08DE1D41400008479E26C35CC024D84908DE1D41400CF753CAD6C35CC08A8B4808DE1D414018E660F686C45CC0F03E4708DE1D4140BEE76E2237C55CC056F24508DE1D41403ED67B4EE7C55CC0AEA54408DE1D4140BDC4887A97C65CC0F7584308DE1D41403CB395A647C75CC0410C4208DE1D414075A1A2D2F7C75CC08BBF4008DE1D4140688FAFFEA7C85CC0C6723F08DE1D41403B90BD2A58C95CC002263E08DE1D41402E7ECA5608CA5CC03DD93C08DE1D4140946BD782B8CA5CC06B8C3B08DE1D41404059E4AE68CB5CC0983F3A08DE1D4140A646F1DA18CC5CC0B8F23808DE1D4140A646FF06C9CC5CC0D7A53708DE1D4140C6330C3379CD5CC0F7583608DE1D41409F20195F29CE5CC0080C3508DE1D4140780D268BD9CE5CC00BBF3308DE1D41400BFA32B789CF5CC01D723208DE1D41409DE63FE339D05CC020253108DE1D4140CBE54D0FEAD05CC015D82F08DE1D4140D1D15A3B9AD15CC00B8B2E08DE1D41401DBE67674AD25CC0003E2D08DE1D4140DDA97493FAD25CC0E7F02B08DE1D41409C9581BFAAD35CC0CEA32A08DE1D41405C818EEB5AD45CC0A7562908DE1D4140B67F9C170BD55CC080092808DE1D4140E96AA943BBD55CC059BC2608DE1D41401C56B66F6BD65CC0246F2508DE1D41404F41C39B1BD75CC0EF212408DE1D4140F52BD0C7CBD75CC0ACD42208DE1D4140E116DDF37BD85CC069872108DE1D41406814EB1F2CD95CC0263A2008DE1D4140C8FEF74BDCD95CC0D5EC1E08DE1D414028E904788CDA5CC0849F1D08DE1D414041D311A43CDB5CC025521C08DE1D41405BBD1ED0ECDB5CC0C5041B08DE1D41402EA72BFC9CDC5CC066B71908DE1D4140E2A339284DDD5CC0F9691808DE1D41406E8D4654FDDD5CC07E1C1708DE1D4140FB765380ADDE5CC010CF1508DE1D4140426060AC5DDF5CC095811408DE1D4140', 6070, 'TURTLE MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000060000005D6BEF5355B556C00000000000003E40F96B0D0030AA56C0505A136635FE3D40EA9E2B00FC9256C08E85329E52FE41400000000000A056C0000000000000424009FB761211B156C08B5242B0AA2A3F405D6BEF5355B556C00000000000003E40', 23911, 'AR101(N)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000060000005D6BEF5355B556C00000000000003E40F96B0D0030AA56C0505A136635FE3D40EA9E2B00FC9256C08E85329E52FE41400000000000A056C0000000000000424009FB761211B156C08B5242B0AA2A3F405D6BEF5355B556C00000000000003E40', 23912, 'AR101(S)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000C000000A39410ACAA9A57C0BBD6DEA7AA6A40405D6BEF5355F557C09C51F355F25B404000000000006058C000000000000040402A38BC2022E258C025ECDB4944C43F40C4D155BABB5B59C025ECDB4944843F40C4D155BABBDB59C00F4757E9EE6E3F4092C4DCFF91DB59C0FA60191BBA553F4078190F00E65A59C06B69C93E236A3F40898BEDFF2D5F58C0B9AB5791D1E73F4088E6F0FF99F357C00FB16609D751404097B3D2FF4D9A57C0E95212C8DB5E4040A39410ACAA9A57C0BBD6DEA7AA6A4040', 23918, 'AR104M');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000070000000000000000B058C0000000000000454015E5D2F885AC58C0A0B07A76AFEC444097225404931158C0D25DC8D92A1B454027A9A7EA797D57C005C58F31773D454000000000008057C0213D450E115145403C2EAA45441458C0DFC2BAF1EE2E45400000000000B058C00000000000004540', 23919, 'AR105(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000070000000000000000B058C0000000000000454015E5D2F885AC58C0A0B07A76AFEC444097225404931158C0D25DC8D92A1B454027A9A7EA797D57C005C58F31773D454000000000008057C0213D450E115145403C2EAA45441458C0DFC2BAF1EE2E45400000000000B058C00000000000004540', 23920, 'AR105(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000090000000000000000805AC0EE0912DBDD5D4740CE4F711CF8835AC0C21EC99BB2424740F8C610001CD959C023CF3F0B530B4740D0F46D1C8C2D59C01A40AEC387D24640D4916D2A1C9E58C013B875374F9646405307793D989758C05245F12A6BB546409A999999992959C0DFC2BAF1EEEE4640909E228788E859C0DFC2BAF1EE2E47400000000000805AC0EE0912DBDD5D4740', 23923, 'AR106L(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000090000000000000000805AC0EE0912DBDD5D4740CE4F711CF8835AC0C21EC99BB2424740F8C610001CD959C023CF3F0B530B4740D0F46D1C8C2D59C01A40AEC387D24640D4916D2A1C9E58C013B875374F9646405307793D989758C05245F12A6BB546409A999999992959C0DFC2BAF1EEEE4640909E228788E859C0DFC2BAF1EE2E47400000000000805AC0EE0912DBDD5D4740', 23924, 'AR106L(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000400000000000000006057C00000000000803B407061DD7877E756C00000000000803B4033333333339356C00000000000803B40A39410ACAA1A56C00000000000803B40', 23926, 'AR108(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000009000000A39410ACAA1A56C00000000000803B4033333333339356C00000000000803B407061DD7877E756C00000000000803B4000000000006057C00000000000803B4000000000006057C09A99999999993B407061DD7877E756C09A99999999993B4033333333339356C09A99999999993B40A39410ACAA1A56C09A99999999993B40A39410ACAA1A56C00000000000803B40', 23927, 'AR108(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000090000000000000000605DC0CDCCCCCCCC3C474062670A9DD7645DC05A6F8A7DB8214740F3D71A0060CE5CC049E30632F1F0464007E7F80D38F75BC096A47C5237A04640FB63100EAC655BC01AB9B8D7936246400000000000605BC000000000008046409A99999999F15BC0AC8F87BEBBBB4640A39410ACAACA5CC0CDCCCCCCCC0C47400000000000605DC0CDCCCCCCCC3C4740', 23910, 'AR10(SE)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000A000000A39410ACAA0A57C0000000000020424000000000000757C0DEBBBCEFCE0E42400FCDE1FF33C456C056C7E0174D2C4240E9F92E00688156C0645DDC46034842407FAD0100361D56C02A03626DE76E4240950ED6FFB99955C07BC6191E56654240909E2287889855C087A3AB7477774240D6C743DFDD1D56C000000000008042403C2EAA45448456C09A99999999594240A39410ACAA0A57C00000000000204240', 23936, 'AR111(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000A000000A39410ACAA0A57C0000000000020424000000000000757C0DEBBBCEFCE0E42400FCDE1FF33C456C056C7E0174D2C4240E9F92E00688156C0645DDC46034842407FAD0100361D56C02A03626DE76E4240950ED6FFB99955C07BC6191E56654240909E2287889855C087A3AB7477774240D6C743DFDD1D56C000000000008042403C2EAA45448456C09A99999999594240A39410ACAA0A57C00000000000204240', 23937, 'AR111(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000005000000A39410ACAA1A57C0AC8F87BEBB3B42405D6BEF53559557C0DFC2BAF1EEEE414009FB761211D157C0BBD6DEA7AACA4140A39410ACAA0A58C0AC8F87BEBB9B414000000000005058C0CDCCCCCCCC8C4140', 25301, 'AR112L(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000900000046B6F3FDD4045AC0295C8FC2F5083F40E9F92E0068055AC0846EE5DB71F53E40FE5A0300EC8159C09103C0C293C73E401661D4FF832659C0EEEC2B0FD2B13E40898BEDFFADCF58C03937B753848D3E404567994528CF58C0404F030649A33E40E4F4F57CCD2559C05C751DAA29C53E40355EBA490C8259C054C90050C5D93E4046B6F3FDD4045AC0295C8FC2F5083F40', 23940, 'AR113(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000900000046B6F3FDD4045AC0295C8FC2F5083F40E9F92E0068055AC0846EE5DB71F53E40FE5A0300EC8159C09103C0C293C73E401661D4FF832659C0EEEC2B0FD2B13E40898BEDFFADCF58C03937B753848D3E404567994528CF58C0404F030649A33E40E4F4F57CCD2559C05C751DAA29C53E40355EBA490C8259C054C90050C5D93E4046B6F3FDD4045AC0295C8FC2F5083F40', 23941, 'AR113(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000A0000007061DD7877375BC0213D450E11114540996AC1E6F7375BC0C2B92B60A7024540719AF4ADC5A65AC0B3356CA521024540DF8B2FDAE35B5AC05775FB5179FE444064833B069A0F5AC0D436B4B74AFA44400E3AD7E6354759C01A266431FB4445409A999999994959C033333333335345400000000000105AC0BBD6DEA7AA0A45406666666666A65AC0213D450E111145407061DD7877375BC0213D450E11114540', 23932, 'AR11(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000A0000007061DD7877375BC0213D450E11114540996AC1E6F7375BC0C2B92B60A7024540719AF4ADC5A65AC0B3356CA521024540DF8B2FDAE35B5AC05775FB5179FE444064833B069A0F5AC0D436B4B74AFA44400E3AD7E6354759C01A266431FB4445409A999999994959C033333333335345400000000000105AC0BBD6DEA7AA0A45406666666666A65AC0213D450E111145407061DD7877375BC0213D450E11114540', 23933, 'AR11(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000800000098BD6C3B6DE05AC0834D9D47C5814140D2EDDBFFB6E25AC06E63586A628041405AD4CCFFD0D75AC092E11D8590374140F3D71A00E0C85AC035B973BC5D194140C6FCDCD094C65AC0D5EB1681B11C41401EA9BEF38BD55AC00AD7A3703D3A414038D89B1892DE5AC0452921585575414098BD6C3B6DE05AC0834D9D47C5814140', 23947, 'AR125V(N)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000003000000145FED28CE8E5BC0B0E595EB6D114040BFEE74E789925BC014AE47E17A1C404076E272BC02B45BC09CC420B072804040', 24962, 'AR136V(N)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000300000076E272BC02B45BC09CC420B072804040C74B378941B05BC06F9F55664A754040145FED28CE8E5BC0B0E595EB6D114040', 24963, 'AR136V(S)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000060000004260E5D0227359C0E9995E622C1941407444BE4BA99459C01283C0CAA19D4040E3A59BC420045AC081AFE8D66BCE3D4065170CAEB9305AC052B81E85EBD13E40A7EA1ED95CE459C039B4C876BE4F40404792205C019659C0CFF753E3A5334140', 31352, 'AR197H');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000060000004260E5D0227359C0E9995E622C1941407444BE4BA99459C01283C0CAA19D4040E3A59BC420045AC081AFE8D66BCE3D4065170CAEB9305AC052B81E85EBD13E40A7EA1ED95CE459C039B4C876BE4F40404792205C019659C0CFF753E3A5334140', 31353, 'AR197L');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000080000007061DD78777753C0F1B8A81611513E40069BDFD5176B53C0B79D1100774E3E40FC15D79D136953C0191C25AFCE1E4040F389E18FC76953C0790F86F01E2D414011346612F57753C08D0A9C6C032D414066666666667653C012F6ED24222240407061DD78777753C0DB1324B6BB7B3F407061DD78777753C0F1B8A81611513E40', 23979, 'AR202A(N)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000080000007061DD78777753C0F1B8A81611513E40069BDFD5176B53C0B79D1100774E3E40FC15D79D136953C0191C25AFCE1E4040F389E18FC76953C0790F86F01E2D414011346612F57753C08D0A9C6C032D414066666666667653C012F6ED24222240407061DD78777753C0DB1324B6BB7B3F407061DD78777753C0F1B8A81611513E40', 31322, 'AR202A(S)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000070000007061DD78777753C075ADBD4F55153C400740DCD52B6653C0CE740A4D6D123C40F2FB485BA66553C0AD133C2AA329414011346612F57753C08D0A9C6C032D414066666666667653C012F6ED24222240407061DD78777753C00000000000C03D407061DD78777753C075ADBD4F55153C40', 23980, 'AR202(N)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000070000007061DD78777753C075ADBD4F55153C400740DCD52B6653C0CE740A4D6D123C40F2FB485BA66553C0AD133C2AA329414011346612F57753C08D0A9C6C032D414066666666667653C012F6ED24222240407061DD78777753C00000000000C03D407061DD78777753C075ADBD4F55153C40', 23981, 'AR202(S)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000B00000033333333335356C04529215855C54140EDD1C034B14C56C022382EE3A6B0414010D2AE9D836055C08948A8740B5142400EE665039F0155C0F196506628914240F1796A9A9C8654C0D514127A47CB42402A38BC20228A54C0EE0912DBDDDD424066666666660655C06666666666A642407061DD78776755C054707841446442406666666666A655C0AC8F87BEBB3B42403333333333E355C0333333333313424033333333335356C04529215855C54140', 23982, 'AR203(NE)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000B00000033333333335356C04529215855C54140EDD1C034B14C56C022382EE3A6B0414010D2AE9D836055C08948A8740B5142400EE665039F0155C0F196506628914240F1796A9A9C8654C0D514127A47CB42402A38BC20228A54C0EE0912DBDDDD424066666666660655C06666666666A642407061DD78776755C054707841446442406666666666A655C0AC8F87BEBB3B42403333333333E355C0333333333313424033333333335356C04529215855C54140', 23983, 'AR203(SW)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000A0000000AD7A3703DDA52C07DCC07043A9D45409A999999996953C000000000008045401F85EB51B8FE53C0A69BC420B0524540022B8716D95A54C0EE0912DBDD4D454015B5EA29285A54C072535E865A3A4540FE1F71D9B2FC53C0DD9156218A3F4540140434B67CB153C05F63F26151564540EBBB6C85FA6653C08FBAE70A006C454010A8A388B1D952C02691D849D88945400AD7A3703DDA52C07DCC07043A9D4540', 23984, 'AR204(NE)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000007000000A39410ACAA8A54C03333333333F33F40E67393BD4A8254C0ECA17DACE0DB3F40FDBBE3B963A853C0EFBF3A3366E641402A38BC2022B253C048E17A14AEEF41405DDE1CAED51D54C08BF9B9A129FD40402A38BC20224254C06666666666A64040A39410ACAA8A54C03333333333F33F40', 23989, 'AR207NE(NE)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000007000000A39410ACAA8A54C03333333333F33F40E67393BD4A8254C0ECA17DACE0DB3F40FDBBE3B963A853C0EFBF3A3366E641402A38BC2022B253C048E17A14AEEF41405DDE1CAED51D54C08BF9B9A129FD40402A38BC20224254C06666666666A64040A39410ACAA8A54C03333333333F33F40', 23990, 'AR207SW(SW)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000008000000A4703D0AD7FB58C042EDB776A20E42400ADEEBFFF7EE58C076656199C8124240EC432800901A59C03AE8120EBD91434019ABCDFFAB4959C03F0C63C1B30F4540E17A14AE475559C0C5AD8218E80C4540C976BE9F1A3B59C0273108AC1C3A44405EBA490C021359C04A99D4D006E24240A4703D0AD7FB58C042EDB776A20E4240', 24060, 'AR400(S)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000009000000658A39083A9558C05E471CB281EE434070E01F00829258C0891E9D5F39DD434097B3D2FF4D4E58C0BCE078E349F2434078190F00660958C003D59A41D7074440F621140008C257C0C60B337E2B2244400794F2FF4F7A57C0570A815CE23B4440C89A9141EE7D57C01CCD91955F4C44407AC5538F340D58C0A0A70183A4194440658A39083A9558C05E471CB281EE4340', 25200, 'AR406H(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000009000000658A39083A9558C05E471CB281EE434070E01F00829258C0891E9D5F39DD434097B3D2FF4D4E58C0BCE078E349F2434078190F00660958C003D59A41D7074440F621140008C257C0C60B337E2B2244400794F2FF4F7A57C0570A815CE23B4440C89A9141EE7D57C01CCD91955F4C44407AC5538F340D58C0A0A70183A4194440658A39083A9558C05E471CB281EE4340', 25201, 'AR406H(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000009000000658A39083A9558C05E471CB281EE434070E01F00829258C0891E9D5F39DD434097B3D2FF4D4E58C0BCE078E349F2434078190F00660958C003D59A41D7074440F621140008C257C0C60B337E2B2244400794F2FF4F7A57C0570A815CE23B4440C89A9141EE7D57C01CCD91955F4C44407AC5538F340D58C0A0A70183A4194440658A39083A9558C05E471CB281EE4340', 25202, 'AR406L(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000009000000658A39083A9558C05E471CB281EE434070E01F00829258C0891E9D5F39DD434097B3D2FF4D4E58C0BCE078E349F2434078190F00660958C003D59A41D7074440F621140008C257C0C60B337E2B2244400794F2FF4F7A57C0570A815CE23B4440C89A9141EE7D57C01CCD91955F4C44407AC5538F340D58C0A0A70183A4194440658A39083A9558C05E471CB281EE4340', 25203, 'AR406L(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000A000000C4D155BABBE355C0B0E595EB6DF942409AFDCBFFF5E455C02A08799851E44240732A19002A4855C0F2272A1BD6CB4240FDB50600580B55C042F79B3F5CC24240950ED6FF39CF54C0C769E3E36EB942400FCDE1FFB36454C0223E0B9D32A44240C6FCDCD0946254C0CDCCCCCCCCBC42409A99999999CD54C0213D450E11D14240A39410ACAA4655C03333333333E34240C4D155BABBE355C0B0E595EB6DF94240', 24070, 'AR455(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000A000000C4D155BABBE355C0B0E595EB6DF942409AFDCBFFF5E455C02A08799851E44240732A19002A4855C0F2272A1BD6CB4240FDB50600580B55C042F79B3F5CC24240950ED6FF39CF54C0C769E3E36EB942400FCDE1FFB36454C0223E0B9D32A44240C6FCDCD0946254C0CDCCCCCCCCBC42409A99999999CD54C0213D450E11D14240A39410ACAA4655C03333333333E34240C4D155BABBE355C0B0E595EB6DF94240', 24071, 'AR455(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000A00000079E9263108805CC0452921585555414011A7936C75445CC0AC8F87BEBB534140EB025E66D8255CC035EB8CEF8B15414009FB761211215CC0BBD6DEA7AA0A41407A3881E9B4095CC05AD76839D0D140400000000000105CC012F6ED2422C240408FC2F5285C335CC012F6ED2422C240401283C0CAA1495CC05AD76839D0D1404079E9263108805CC0B81E85EB51F8404079E9263108805CC04529215855554140', 24093, 'AR603');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000050000000000000000805BC000000000008048400000000000C05AC000000000008048400000000000C05AC00000000000C047400000000000805BC00000000000C047400000000000805BC00000000000804840', 24094, 'AR604');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000800000066666666668652C087A3AB7477B745407061DD78779752C03333333333B345403C2EAA45440453C0CDCCCCCCCCAC45402A38BC20220253C00000000000E04540D6C743DFDDFD52C0CDCCCCCCCCEC45402A38BC2022F252C03333333333F34540CEA8F92AF98952C012F6ED2422F2454066666666668652C087A3AB7477B74540', 24099, 'AR609');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000009000000F70489EDEE6E5BC0F2D24D62104040403C2EAA4544645BC054707841447440403C2EAA4544645BC0E318C91EA1F440401D5A643BDF4B5BC000000000000041403333333333335BC000000000000041403333333333335BC03333333333F34040A1698995D1075BC0B22AC24D46BF4040B517D1764C545BC054707841443C4040F70489EDEE6E5BC0F2D24D6210404040', 24104, 'AR613');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000005000000909E228788285CC06666666666864240CDCCCCCCCC2C5CC03333333333D34140909E228788085CC0213D450E11D141403333333333035CC05470784144844240909E228788285CC06666666666864240', 24116, 'AR624');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000009000000FED478E926F954C0C15774EB35074040D6C743DFDDF554C08C868C47A9B83F40B29DEFA7C6EB54C097546D37C1E33E40AF963B33C1E754C00000000000A03E404930D5CC5ACD54C0BC5AEECC049F3E4015FDA19927D254C0AC02B5183CE83E402E01F8A754DC54C0E90C8CBCACC53F40508D976E12DF54C07B87DBA161074040FED478E926F954C0C15774EB35074040', 24120, 'AR627');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000005000000F70489EDEE2E55C06666666666D64140D6C743DFDDC554C0DFC2BAF1EE0E4240C4D155BABBD354C054707841445442405D6BEF53553D55C0BBD6DEA7AA1A4240F70489EDEE2E55C06666666666D64140', 24126, 'AR633A');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000050000007061DD78777F56C0CDCCCCCCCCCC3C405D6BEF53555556C0A8E0F08288883B4066666666663656C0DB1324B6BBBB3B4009FB7612116156C00000000000003D407061DD78777F56C0CDCCCCCCCCCC3C40', 24146, 'AR647');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000050000005D6BEF5355C554C0DB1324B6BB5B3B40D6C743DFDD1D55C0DB1324B6BB5B3B40D6C743DFDD1D55C00F4757E9EECE3B405D6BEF5355C554C00F4757E9EECE3B405D6BEF5355C554C0DB1324B6BB5B3B40', 24156, 'AR655');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000090000003C2EAA4544E45BC012F6ED2422924140D6C743DFDDDD5BC0DFC2BAF1EEAE4140F70489EDEE9E5BC0213D450E11014240D6C743DFDD8D5BC0666666666606424009FB761211815BC0CDCCCCCCCCEC41406666666666865BC0213D450E11D141407061DD7877C75BC0EE0912DBDD7D4140909E228788D85BC0AC8F87BEBB7B41403C2EAA4544E45BC012F6ED2422924140', 24158, 'AR658');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000110000007061DD78776F5BC0C3F5285C8FB24140C4D155BABB6B5BC0AC8F87BEBBBB41405D6BEF5355655BC06666666666C64140D6C743DFDD5D5BC0CDCCCCCCCCCC4140D6C743DFDD055BC0AC8F87BEBBFB4140C4D155BABBFB5AC0EE0912DBDDFD41403333333333F35AC01CCD91955FFC4140D6C743DFDDED5AC09A99999999F941400000000000E85AC0AC8F87BEBBDB4140A39410ACAAEA5AC0A4703D0AD7D341402A38BC2022F25AC087A3AB7477C741402A38BC2022FA5AC012F6ED2422C241402A38BC2022525BC03333333333934140A39410ACAA5A5BC0213D450E119141403C2EAA4544645BC012F6ED24229241409A99999999695BC045292158559541407061DD78776F5BC0C3F5285C8FB24140', 24163, 'AR674');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000060000003C2EAA45442C5AC0EE0912DBDD4D46403C2EAA4544245AC04529215855254640909E228788085AC03333333333934540CDCCCCCCCCEC59C0DFC2BAF1EE9E45400000000000085AC0213D450E113146403C2EAA45442C5AC0EE0912DBDD4D4640', 24164, 'AR678');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000050000002A38BC20229254C08B5242B0AA2A3A40A39410ACAA2A55C08B5242B0AA2A3A40A39410ACAA2A55C0F1B8A81611513B402A38BC2022B254C0F1B8A81611513B402A38BC20229254C08B5242B0AA2A3A40', 24165, 'AR716');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000007000000BD8BF7E3F65F51C087A3AB7477D7454036E84B6F7F3851C0BBD6DEA7AAEA4540BD8BF7E3F6BF50C0CDCCCCCCCC2C4640BD8BF7E3F6BF50C06666666666E645409C4EB2D5E52E51C0213D450E11B14540BD8BF7E3F65F51C0BBD6DEA7AA8A4540BD8BF7E3F65F51C087A3AB7477D74540', 7635, '102-LOW');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000007000000BD8BF7E3F65F51C087A3AB7477D7454036E84B6F7F3851C0BBD6DEA7AAEA4540BD8BF7E3F6BF50C0CDCCCCCCCC2C4640BD8BF7E3F6BF50C06666666666E645409C4EB2D5E52E51C0213D450E11B14540BD8BF7E3F65F51C0BBD6DEA7AA8A4540BD8BF7E3F65F51C087A3AB7477D74540', 7650, '102-HIGH');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000080000009A99999999D952C00000000000C04140C4D155BABB7B52C0EE0912DBDD1D414033333333333353C09A999999991940403C2EAA45445453C0BBD6DEA7AA2A4040D6C743DFDD5D53C0000000000080404000000000006053C04529215855954040F70489EDEE5E53C0213D450E113141409A99999999D952C00000000000C04140', 13913, '122');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000004000000168A743FA7BD5AC0795C548B88684140B29DEFA7C6BB5AC06ABC7493185C41408D976E1283B45AC01DE736E15E2B41403333333333B35AC00000000000004140', 23946, 'AR117V');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000009000000A39410ACAA2A5BC0BBD6DEA7AA2A4740732A1900AA2B5BC0C6DB4AAFCD1E47409858CFFFE14E5AC08208CC9E5F09474097B3D2FFCD7259C04B88033285B1464000000000007059C00000000000C046400000000000005AC087A3AB7477F74640CDCCCCCCCC4C5AC045292158551547400000000000905AC0AC8F87BEBB1B4740A39410ACAA2A5BC0BBD6DEA7AA2A4740', 23955, 'AR12L(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000DF100000F884829A778F58C0B4AFAA5FC3594340544D300C778F58C015039637C359434029D77904768F58C0BADDBFEDC25943406F7EB6FC748F58C069F252A4C2594340FB68E8F4738F58C0E166515BC2594340F0700DED728F58C06315B912C25943404BA926E5718F58C0EDFD89CAC1594340D72435DD708F58C08120C482C1594340DABD36D56F8F58C01D7D673BC1594340169A2DCD6E8F58C0923976F4C0594340AAA618C56D8F58C0C355F0ADC059434096E3F7BC6C8F58C04A86D167C0594340BA63CCB46B8F58C08D161E22C0594340361495AC6A8F58C0E7E0D3DCBF594340EB0753A4698F58C04AE5F297BF594340FE2B059C688F58C069497D53BF5943404393AC93678F58C09FE7700FBF594340E02A488B668F58C0A0E5CFCBBE594340B505D982658F58C0AA1D9888BE594340CA235F7A648F58C0CA8FC945BE5943401185DA71638F58C0A7616603BE59434090294B69628F58C08D6D6CC1BD5943404E11B160618F58C08AB3DB7FBD5943403F3C0C58608F58C04359B63EBD59434067AA5C4F5F8F58C01439FAFDBC594340B06EA3465E8F58C0A078A9BDBC5943405163DE3D5D8F58C052F2C17DBC59434004AE0F355C8F58C0F0A5433EBC594340F03B362C5B8F58C067B930FFBB594340FC1F53235A8F58C0A92C89C0BB5943403947651A598F58C001DA4A82BB59434097C46D11588F58C046C17544BB5943400F986C08578F58C072080C07BB594340B7AE60FF558F58C099890BCABA594340801B4BF6548F58C0986A768DBA5943407BCB2AED538F58C092854A51BA59434076E401E4528F58C064008A15BA5943408B53CFDA518F58C040B532DAB9594340D90592D1508F58C0D7C9469FB959434019214CC84F8F58C09418C464B95943407A92FCBE4E8F58C0FFC6AC2AB9594340F459A3B54D8F58C043D500F1B8594340887740AC4C8F58C08F1DBEB7B859434015FED4A24B8F58C0F39FE47EB8594340BCDA5F994A8F58C012827646B8594340750DE18F498F58C00BC4730EB85943402FA95986488F58C0FE3FDAD6B7594340E4ADC97C478F58C0CA1BAC9FB7594340B1083073468F58C09031E768B759434079CC8D69458F58C02FA78D32B75943403AF9E25F448F58C0D7569DFCB6594340FD8E2F56438F58C00B8C1AC7B6594340D27A724C428F58C086D5FE91B6594340A1CFAC42418F58C08DA4505DB65943404BA0DF38408F58C09DAD0B29B6594340EED9092F3F8F58C0B7F02FF5B5594340AC692A253E8F58C05CB9C1C1B55943404A75431B3D8F58C05696BA8EB5594340DCE953113C8F58C0DCF8205CB559434050DA5C073B8F58C05E95F029B5594340B7335DFD398F58C0B7912BF8B459434018F654F3388F58C0DBEDD1C6B45943405B3445E9378F58C00984E195B459434071EE2DDF368F58C0007A5C65B459434081110ED5358F58C000AA4035B459434074B0E6CA348F58C0CB399005B45943403ACBB7C0338F58C061294BD6B3594340E26181B6328F58C0C07871A7B35943407D6142AC318F58C037020179B3594340DAEFFCA1308F58C06AEBFB4AB359434032E7AE972F8F58C06734621DB3594340456D5A8D2E8F58C03DDD33F0B25943404B5CFD822D8F58C01CC06EC3B2594340F4EC9A782C8F58C0B7021597B259434097E62F6E2B8F58C02BA5266BB2594340EF6EBE632A8F58C0A881A13FB259434029734559298F58C0EFBD8714B25943403EF3C44E288F58C0005AD9E9B15943400E023E44278F58C0EA5596BFB1594340999FB039268F58C0CF8BBC95B1594340E1CB1C2F258F58C08C214E6CB159434002748124248F58C006174B43B1594340E0AADF19238F58C04A6CB31AB1594340985D360F228F58C0662187F2B0594340EDB18704218F58C08C10C4CAB0594340FD94D2F91F8F58C07C5F6CA3B0594340CF0617EF1E8F58C0280E807CB0594340570755E41D8F58C0AD1CFF55B059434099968CD91C8F58C03B65E72FB059434097B4BDCE1B8F58C054333D0AB05943403974E9C31A8F58C0853BFCE4AF5943408FC20EB9198F58C072A326C0AF594340A19F2DAE188F58C0296BBC9BAF594340551E47A3178F58C0F76CBB77AF594340A03E5B98168F58C043F42754AF594340ACED688D158F58C0A7B5FD30AF5943404E3E7182148F58C0C6D63E0EAF594340AC1D7377138F58C0BE57EBEBAE5943408DB1706C128F58C0813803CAAE5943402AD46761118F58C01B7986A8AE59434064985956108F58C0A3F37287AE5943401311474B0F8F58C0D3F3CC66AE59434085182E400E8F58C0FE2D9046AE59434093C10F350D8F58C0F3C7BE26AE594340171FED290C8F58C0B2C15807AE5943403F1EC51E0B8F58C04A1B5EE8AD59434002BF97130A8F58C09ED4CEC9AD59434043146608098F58C0CBEDAAABAD594340200B2FFD078F58C0F340F08DAD5943407AB6F3F1068F58C0B419A370AD5943407103B3E6058F58C07F2CBF53AD594340E4046EDB048F58C0149F4637AD594340F4A723D0038F58C07371391BAD59434088FFD4C4028F58C09DA397FFAC5943408A0B82B9018F58C09F3561E4AC594340F9DE2BAE008F58C05E2796C9AC5943401C41CFA2FF8E58C0F57836AFAC5943407D7D7097FE8E58C0482A4295AC594340825B0C8CFD8E58C0A515B77BAC594340FDEDA380FC8E58C09B869962AC594340F5343775FB8E58C09A31E549AC5943405143C769FA8E58C018629E31AC5943402B06535EF98E58C0ACCCC019AC5943405C90DB52F88E58C00A974E02AC59434009CF5F47F78E58C033C147EBAB5943403AC2DF3BF68E58C0E870AED4AB594340CA7C5C30F58E58C0B45A7EBEAB594340B0FED524F48E58C03CA4B9A8AB594340FB474C19F38E58C08F4D6093AB594340C245BE0DF28E58C0AC56727EAB594340E80A2D02F18E58C0A1BFEF69AB594340649798F6EF8E58C0A062D655AB59434045EB00EBEE8E58C01C8B2A42AB594340840666DFED8E58C07113EA2EAB59434021E9C7D3EC8E58C090FB141CAB594340FCA527C8EB8E58C0B81DA909AB5943405B1783BCEA8E58C06DC5AAF7AA594340F262DCB0E98E58C0EBCC17E6AA594340E77532A5E88E58C0800EEED4AA5943401A638699E78E58C094D531C4AA594340AA17D78DE68E58C0B0D6DEB3AA5943407AA62582E58E58C0585DF9A3AA594340A7FC7076E48E58C0171E7D94AA594340192DBA6AE38E58C062646E85AA594340C337015FE28E58C0A8E4C876AA594340B31C4653E18E58C088EA9068AA594340F9C88747E08E58C0712AC25AAA594340854FC73BDF8E58C0E6EF604DAA59434029C30530DE8E58C063EF6840AA59434032FE4024DD8E58C0AB4EDC33AA59434053267B18DC8E58C07F33BD27AA594340D915B20CDB8E58C05C52071CAA5943407EF2E700DA8E58C0D3F6BE10AA59434043BC1CF5D88E58C045D5DF05AA594340654D4EE9D78E58C08F136CFBA959434087DE7FDDD68E58C057D765F1A95943400037AED1D58E58C036D5C8E7A9594340A67CDBC5D48E58C0A15899DEA959434065AF07BAD38E58C00716D3D5A959434043CF32AED28E58C0463378CDA95943405FC95BA2D18E58C010D68AC5A95943409AB08396D08E58C0E3B206BEA9594340F584AA8ACF8E58C05015F0B6A95943406F46D07ECE8E58C0B8B142B0A95943400FF5F472CD8E58C0ACD302AAA9594340C8901867CC8E58C0B72F2CA4A9594340812C3C5BCB8E58C04011C39EA959434078A25D4FCA8E58C0DF2CC399A959434076187F43C98E58C03BA82E95A9594340937B9F37C88E58C032A90791A9594340D0CBBE2BC78E58C031E4498DA9594340051CDE1FC68E58C0BBA4F989A9594340426CFD13C58E58C011C51487A959434097A91B08C48E58C06F1F9984A959434012D438FCC28E58C059FF8A82A95943406D1157F0C18E58C04C19E680A9594340E93B74E4C08E58C0CBB8AE7FA9594340646691D8BF8E58C06192E07EA9594340DF90AECCBE8E58C075F17F7EA95943405ABBCBC0BD8E58C053B08A7EA9594340D5E5E8B4BC8E58C049A9FE7EA9594340501006A9BB8E58C0CA27E07FA9594340CB3A239DBA8E58C015062D81A959434027784191B98E58C06A1EE382A9594340A2A25E85B88E58C03CBC0685A959434005E07C79B78E58C0F5B99587A959434042309C6DB68E58C06A17908AA95943408580BB61B58E58C0E8AEF38DA9594340A3E3DB55B48E58C0F2CBC491A9594340C746FC49B38E58C0C7480196A9594340C5BC1D3EB28E58C07425A99AA9594340CA323F32B18E58C01C3CBA9FA95943408ACE6226B08E58C05ED838A5A9594340506A861AAF8E58C05CD422ABA9594340F818AB0EAE8E58C0323078B1A959434080DAD002AD8E58C0D4EB38B8A9594340E9AEF7F6AB8E58C07EE162BFA959434013A920EBAA8E58C0B35CFAC6A95943403DA349DFA98E58C0B437FDCEA959434022C374D3A88E58C07F726BD7A9594340F6F5A0C7A78E58C0140D45E0A9594340844ECFBBA68E58C073078AE9A9594340F3B9FEAFA58E58C0AB613AF3A959434042382FA4A48E58C0A01B56FDA95943405ADC6198A38E58C0AB0FDB07AA5943402DA6968CA28E58C03489CD12AA594340E082CC80A18E58C096622B1EAA5943405C850475A08E58C0C29BF429AA59434092AD3E699F8E58C0B9342936AA59434091FB7A5D9E8E58C07A2DC942AA594340705CB8519D8E58C00586D44FAA594340EBF5F8459C8E58C09A18495DAA59434027B53B3A9B8E58C0BA302B6BAA594340339A802E9A8E58C0A5A87879AA594340F9A4C722998E58C068803188AA5943407AD51017988E58C0E7B75597AA594340AB3E5D0B978E58C07E29E3A6AA5943408FCDABFF958E58C09220DEB6AA5943401D95FDF3948E58C07F7744C7AA5943406C8251E8938E58C0750814D8AA59434064A8A8DC928E58C0E81E51E9AA59434017F401D1918E58C03495F9FAAA5943406C785EC5908E58C089450B0DAB5943406435BEB98F8E58C06A7B8A1FAB594340042B21AE8E8E58C054EB7232AB594340405987A28D8E58C0D8E0C845AB59434044ADEF968C8E58C057108859AB594340C44C5C8B8B8E58C061C5B46DAB5943400D12CB7F8A8E58C083B44A82AB594340D2223E74898E58C022294E97AB594340406CB468888E58C0D9D7BAACAB59434031012F5D878E58C04CE692C2AB594340C4CEAC51868E58C09754D6D8AB594340F9D42D46858E58C0AC2285EFAB594340CA13B23A848E58C07F509F06AC594340259E3A2F838E58C037DE241EAC5943400974C723828E58C0ACCB1536AC5943406A955818818E58C0EB18724EAC5943406DEFEC0C808E58C0F5C53967AC594340F39485017F8E58C0C9D26C80AC594340028622F67D8E58C0B519099AAC594340ADAFC2EA7C8E58C01EE612B4AC594340BC3768DF7B8E58C09EEC85CEAC594340550B12D47A8E58C09B7866E9AC594340712AC0C8798E58C0B03EB004AD594340089572BD788E58C090646520AD5943402A4B29B2778E58C02BEA853CAD594340A85FE5A6768E58C0ADCF1159AD594340B1BFA59B758E58C0EC140976AD5943403C6B6A90748E58C0F5B96B93AD5943402B753485738E58C0C8BE39B1AD5943407EDD037A728E58C0A5FD70CFAD5943405491D76E718E58C00DC215EEAD5943408DA3B063708E58C08CC0230DAE5943404A018E586F8E58C0C81E9D2CAE5943406ABD704D6E8E58C0DCDC814CAE594340CEEA59426D8E58C0ACFAD16CAE594340BD6347376C8E58C055788D8DAE594340083B3A2C6B8E58C0C855B4AEAE594340BF7032216A8E58C0446D44D0AE594340B2173116698E58C04D0A42F2AE594340300A340B688E58C05EE1A814AF594340EB6D3D00678E58C039187B37AF59434010304CF5658E58C0D1AEB85AAF5943407A6361EA648E58C04FA5617EAF59434048F57BDF638E58C0C9D573A2AF5943407AE59BD4628E58C0DC8BF3C6AF594340E946C2C9618E58C0EA7BDCEBAF594340AB19EFBE608E58C0D0CB3011B0594340C94A21B45F8E58C0817BF036B05943400C005BA95E8E58C0EF8A1B5DB0594340B4139A9E5D8E58C073D4AF83B0594340BF85DE935C8E58C083A3B1AAB0594340F67B2A895B8E58C09DAC1CD2B05943406AE37C7E5A8E58C0BFEFF0F9B059434024BCD573598E58C06DB83222B159434028063569588E58C0E5E0DF4AB15943404BD49B5E578E58C06643F673B1594340D8000854568E58C0B205789DB15943408BB17B49558E58C0D62765C7B159434082D3F53E548E58C00484BBF1B15943409F797734538E58C0ED3F7D1CB2594340D9A3002A528E58C0AF5BAA47B25943407F2C8F1F518E58C02ED74273B25943402A4C2615508E58C084B2469FB25943401ADDC30A4F8E58C0E4C7B3CBB259434036F268004E8E58C00E3D8CF8B2594340708B15F64C8E58C00312D025B3594340CFA8C9EB4B8E58C001217D53B35943405B4A85E14A8E58C0C98F9581B3594340057048D7498E58C05B5E19B0B3594340DB1913CD488E58C0B88C08DFB3594340CF47E5C2478E58C02CF5600EB4594340EFF9BEB8468E58C06ABD243EB45943401643A1AE458E58C064E5536EB459434079FD89A4448E58C07647EC9EB4594340CB617C9A438E58C04409F0CFB4594340424A7690428E58C0EA2A5F01B5594340DEB67786418E58C09A863733B559434080BA817C408E58C014427B65B5594340285594723F8E58C0585D2A98B5594340FC73AE683E8E58C0A5B242CBB5594340CF29D15E3D8E58C0BC67C6FEB5594340A876FC543C8E58C09E7CB532B65943408E5A304B3B8E58C089CB0D67B659434073D56C413A8E58C04D7AD19BB659434065E7B137398E58C00B63FED0B65943405590FF2D388E58C0A1AB9606B75943404CD05524378E58C0F5539A3CB759434031BAB51A368E58C05F360773B7594340223B1E11358E58C09378DFA9B75943400C538F07348E58C0C2F420E1B7594340E3140AFE328E58C0CAD0CD18B8594340C06D8DF4318E58C09C0CE650B8594340A35D19EB308E58C078826789B85943404D0AB0E12F8E58C02B5854C2B85943401D3B4ED82E8E58C0CC67AAFBB8594340BB28F7CE2D8E58C053D76B35B959434039C0A9C52C8E58C0D580966FB9594340C4EE64BC2B8E58C02F8A2CAAB959434035C729B32A8E58C084CD2BE5B95943408649F8A9298E58C0B2709620BA5943409F88D1A0288E58C09C736C5CBA594340C55EB397278E58C0DC8AA998BA594340B2F19F8E268E58C0A72754D5BA594340852E9685258E58C07BFE6712BB5943404015967C248E58C0590FE54FBB594340C2B8A073238E58C00180CD8DBB5943402A06B56A228E58C0B12A1FCCBB5943407AFDD261218E58C02C35DC0ABC59434090B1FB58208E58C0B079024ABC5943406E222F501F8E58C00D1E9489BC5943403A3D6C471E8E58C064FC8EC9BC594340CE14B43E1D8E58C0C514F309BD59434021A906361C8E58C0FD8CC24ABD5943403DFA632D1B8E58C0F264FD8BBD5943402608CC241A8E58C03D519FCDBD594340D7D23E1C198E58C0529DAC0FBE5943406F47BB13188E58C032492552BE594340A88B430B178E58C01A2F0795BE594340AF8CD602168E58C0FD4E52D8BE594340665D75FA148E58C0B9CE081CBF594340DDEA1EF2138E58C08C882860BF5943401C35D3E9128E58C05A7CB1A4BF594340223C92E1118E58C0F2CFA5E9BF594340D7125DD9108E58C0A15D032FC05943402DB933D10F8E58C04B25CA74C0594340521C15C90E8E58C0BF4CFCBAC0594340184F02C10D8E58C04AAE9701C15943408D51FBB80C8E58C0DE499C48C1594340CA10FFB00B8E58C02F450C90C159434088B20FA90A8E58C0D554E3D7C159434015112BA1098E58C0F9E92720C25943404A3F5299088E58C08193D368C259434008508691078E58C0C49CEAB1C25943408E1DC589068E58C050BA68FBC2594340A3CD1082058E58C0675D5445C35943405A4D687A048E58C0C614A78FC359434099AFCC72038E58C02D0663DAC3594340A0CE3B6B028E58C06D578A25C459434018E3B863018E58C0A8E21A71C459434050B4405C008E58C0FAA714BDC45943401868D554FF8D58C009CD7909C559434069FE764DFE8D58C06C064656C559434043772546FD8D58C08C9F7DA3C5594340BFBFDF3EFC8D58C0D2721EF1C5594340B1FDA737FB8D58C00480283FC6594340450B7C30FA8D58C04DC79B8DC65943405BFB5C29F98D58C09F4878DCC659434008CE4A22F88D58C0C929C02BC75943403783451BF78D58C01F1F6F7BC7594340EF1A4D14F68D58C04D7489CBC75943403695610DF58D58C0D1DD0A1CC8594340E1048406F48D58C011A7F76CC85943401B57B3FFF28D58C068AA4DBEC8594340BF9EF0F8F18D58C0BAE70C10C9594340ECC83AF2F08D58C0235F3562C95943409BD591EBEF8D58C09510C7B4C9594340BAD7F6E4EE8D58C001FCC107CA59434063BC68DEED8D58C08521265BCA59434055A9E9D7EC8D58C01281F3AECA594340D17877D1EB8D58C0A71A2A03CB594340B73D13CBEA8D58C046EEC957CB5943400DF8BCC4E98D58C0EDFBD2ACCB594340E59473BEE88D58C05F694702CC594340073A39B8E78D58C018EB2258CC5943409BD40CB2E68D58C0198165AECC5943409864EEABE58D58C0F2761305CD594340F7E9DDA5E48D58C0C6A62A5CCD594340CE64DB9FE38D58C0B210ABB3CD594340E2E7E799E28D58C0A6B4940BCE5943406D600294E18D58C0D36CE563CE59434035E12B8EE08D58C0D984A1BCCE59434074576388DF8D58C018B1C415CF59434016C3A882DE8D58C06E17516FCF594340E449FE7CDD8D58C0CDB746C9CF59434022C66177DC8D58C03692A523D0594340C237D371DB8D58C0A7A66D7ED05943408EC4546CDA8D58C021F59ED9D0594340CA46E466D98D58C0F0573735D159434032E48361D88D58C0BAF43891D1594340FC76315CD78D58C08ECBA3EDD1594340F924EF56D68D58C078DC774AD25943405FC8BA51D58D58C05D27B5A7D2594340F086964CD48D58C098865905D3594340D34D8147D38D58C0CD1F6763D3594340DA2F7C42D28D58C01AF3DDC1D35943404A07853DD18D58C0AEDABB20D4594340CE0C9F38D08D58C04BFC0280D4594340B407C733CF8D58C0F057B3DFD4594340AD30002FCE8D58C09FEDCC3FD5594340EA61482ACD8D58C087974DA0D5594340779B9F25CC8D58C0947B3701D65943400A030821CB8D58C09C998A62D6594340EE727F1CCA8D58C0FACB44C4D6594340FEFD0618C98D58C052386826D75943403FA49E13C88D58C0B4DEF488D7594340A565460FC78D58C05C99E8EBD75943403642FE0AC68D58C01C8E454FD8594340F239C606C58D58C0239709B3D8594340D94C9E02C48D58C025DA3617D9594340D48D87FEC28D58C03F57CD7BD9594340F9E980FAC18D58C09FE8CAE0D959434042618AF6C08D58C0478E2F46DA5943409F06A5F2BF8D58C0F86DFDABDA59434026C7CFEEBE8D58C0B2873412DB594340BAB50BEBBD8D58C0B3B5D278DB59434078BF57E7BC8D58C0BD1DDADFDB594340240AB6E3BB8D58C00F9A4847DC594340195D23E0BA8D58C0695020AFDC594340FCF0A2DCB98D58C0191B5F17DD594340F1B233D9B88D58C003FA0480DD5943400A90D4D5B78D58C0031314E9DD59434017AE87D2B68D58C0FF658C52DE59434049E74ACFB58D58C08EA769BCDE5943406E6120CCB48D58C02623B026DF594340BEF605C9B38D58C0B9D85F91DF594340FACCFDC5B28D58C0A2A276FCDF5943401DE407C3B18D58C0D280F467E0594340592923C0B08D58C01999DBD3E05943409A9C4FBDAF8D58C08BC52940E1594340EE3D8DBAAE8D58C05306DFACE15943402820DDB7AD8D58C0635BFB19E25943404F433FB5AC8D58C089EA8087E259434069A7B3B2AB8D58C0E98D6DF5E2594340883939B0AA8D58C0516BC363E35943409A0CD1ADA98D58C04E377ED2E3594340B20D7AABA88D58C0453DA241E4594340A56236A9A78D58C092572DB1E459434076F804A7A68D58C0E8AB2121E559434043CFE5A4A58D58C0B6EE7A91E559434014D4D7A2A48D58C09B6B3D02E6594340B22CDDA0A38D58C0C7FC6673E65943401ED9F59EA28D58C03BA2F7E4E65943409DB31F9DA18D58C0F65BEF56E7594340E9E15C9BA08D58C0F9294EC9E75943401B51AC999F8D58C0430C143CE859434022140F989E8D58C0A42843AFE85943400E1884969D8D58C03059D922E9594340CE6F0C959C8D58C05E78D496E9594340631BA8939B8D58C096D1380BEA594340D60756929A8D58C0063F0480EA5943401E481791998D58C0CDC036F5EA5943403ADCEB8F988D58C00B31CE6AEB5943403CB1D28E978D58C060DBCEE0EB594340F3ECCD8D968D58C0FD993657EC594340717CDC8C958D58C0E16C05CEEC594340E24CFD8B948D58C0FE533B45ED594340FA83328B938D58C0714FD8BCED594340C7217C8A928D58C06A39DA34EE5943408100D889918D58C06B5D45ADEE594340E9454889908D58C0F36F1526EF5943401FDFCB888F8D58C084BC4E9FEF59434029CC62888E8D58C0A8F7EC18F0594340DA1F0E888D8D58C00647F292F059434039DACD878C8D58C0ACAA5E0DF159434066E8A0878B8D58C0A7223288F1594340485D88878A8D58C0DBAE6C03F2594340D8388487898D58C0A4290C7FF25943402E689387888D58C0A5B812FBF25943401A11B887878D58C0FD5B8077F3594340D40DF087868D58C09B1355F4F35943403C713C88858D58C082DF9071F4594340324E9E88848D58C0EE9931EFF4594340FD7E1389838D58C0A168396DF559434050299E89828D58C09C4BA8EBF5594340583A3D8A818D58C01D1D7C6AF659434007B2F08A808D58C0E602B7E9F65943406C90B88B7F8D58C003FD5869F75943405FE8958C7E8D58C099E55FE9F7594340DAB9888D7D8D58C076E2CD69F85943400AF28F8E7C8D58C0A9F3A2EAF8594340E990AB8F7B8D58C054F3DC6BF959434037BCDD907A8D58C054077EEDF9594340334E2492798D58C0CC09846FFA594340E4467F93788D58C09920F1F1FA594340FECBF094778D58C0ED25C374FB594340A7CA7796768D58C0883FFCF7FB59434005301398758D58C0A9479A7BFC594340D321C599748D58C011649FFFFC5943404F7A8B9B738D58C0B3940B84FD594340335F689D728D58C0F6B3DC08FE594340ADBD5A9F718D58C0B2C1128EFE594340BE9562A1708D58C0B5E3AF13FF59434036FA80A36F8D58C03EF4B199FF5943403ED8B4A56E8D58C05BF31820005A4340D52FFEA76D8D58C0B206E7A6005A4340E2135EAA6C8D58C09C081A2E015A43407771D3AC6B8D58C0C01EB4B5015A4340636E60AF6A8D58C07823B33D025A4340FED101B2698D58C0A81617C6025A4340E9D4BAB4688D58C02D1EE24E035A43405C5189B7678D58C077EE0FD8035A43402D6D6FBA668D58C008D3A461045A434086026BBD658D58C0E0CBA0EB045A43404F247DC0648D58C07E8DFF75055A43408ED2A5C3638D58C06263C500065A4340370DE5C6628D58C0CC27F08B065A43402FE73BCA618D58C0BDDA7F17075A43409E4DA9CD608D58C0337C74A3075A43407D402DD15F8D58C0FF31D02F085A4340CBBFC7D45E8D58C081B08EBC085A43406ADE79D85D8D58C04B43B449095A4340788942DC5C8D58C0A9C43ED7095A4340D7D322E05B8D58C08D342E650A5A4340A5AA19E45A8D58C0E89282F30A5A4340AB3329E8598D58C0D8DF3B820B5A43403A364EEC588D58C04D1B5A110C5A434000EB8BF0578D58C03B45DDA00C5A43402F2CE0F4568D58C0BC5DC5300D5A4340961F4DF9558D58C0C46412C10D5A43406D9FD0FD548D58C0515AC4510E5A434095BE6B02548D58C0643EDBE20E5A43400C7D1E07538D58C03CEB54740F5A4340BCEDE90B528D58C05BAC3506105A4340D4EACB10518D58C00E5C7B98105A43401E9AC615508D58C078D4232B115A434098FBD91A4F8D58C0376133BE115A434089E903204E8D58C0ADB6A551125A4340A58946254D8D58C0B6FA7CE5125A4340FFDBA12A4C8D58C0382DB979135A43409CCD14304B8D58C07E28580E145A4340975E9F354A8D58C019385EA3145A43409DB4433B498D58C07910C738155A4340F4A9FF40488D58C05FD794CE155A43407B51D446478D58C0FB66C564165A43405A98C04C468D58C039E55AFB165A434044A4C652458D58C0F0515592175A43406662E558448D58C02CADB429185A4340D1BF1B5F438D58C02CD176C1185A434055E26B65428D58C0B3E39D59195A43400BB7D46B418D58C0C0E429F2195A4340F13D5672408D58C09FAE188B1A5A43401077F0783F8D58C034416A241B5A43403975A47F3E8D58C011E822BE1B5A4340932571863D8D58C0FF313C581C5A43402688568D3C8D58C02690BCF21C5A4340C3AF55943B8D58C05F919D8D1D5A43407A9C6E9B3A8D58C0DEA6E5281E5A43405A3BA0A2398D58C0535F8EC41E5A43405B9FEBA9388D58C05C069C601F5A43407EB54FB1378D58C0EB9B0EFD1F5A4340A2A3CEB8368D58C03EFAE399205A4340F04366C0358D58C055211C37215A434050A917C8348D58C0F336B9D4215A4340C9D3E2CF338D58C05515B972225A43402ED6C8D7328D58C03DE21D11235A4340CA8AC7DF318D58C02852E3AF235A43407904E0E7308D58C099B00D4F245A4340135613F02F8D58C09EFD9CEE245A4340C66C60F82E8D58C098ED8C8E255A43409248C7002E8D58C018CCE12E265A434049FC48092D8D58C06A7399CF265A43401375E4112C8D58C081E3B370275A4340EEB2991A2B8D58C00F423312285A4340C3C869232A8D58C0AF4313B4285A434083B6542C298D58C0D5335856295A43403D7C5A35288D58C0BFECFFF8295A434009077A3E278D58C09E48089C2A5A4340C769B447268D58C01193753F2B5A434078A40951258D58C00ACC47E32B5A43403BA4785A248D58C006A87A872C5A4340D28E0364238D58C0C74C102C2D5A43405B51A96D228D58C05ABA08D12D5A4340DDEB6977218D58C0A3F063762E5A4340525E4581208D58C0B1EF211C2F5A4340B3A83B8B1F8D58C083B742C22F5A4340EEDD4D951E8D58C02848C668305A43401CEB7A9F1D8D58C083A1AC0F315A43403CD0C2A91C8D58C0B1C3F5B6315A43404F8D25B41B8D58C0E2889F5E325A43401D48A5BE1A8D58C08B3CAE06335A4340F6C73EC9198D58C036931DAF335A43408345F5D3188D58C0B4B2EF57345A4340099BC6DE178D58C0F79A2401355A43405CDBB3E9168D58C03D26BAAA355A4340B0F3BBF4158D58C008A0B454365A4340B009E1FF148D58C0D7BC0FFF365A43409DF7200B148D58C06AA2CDA9375A43406AD07C16138D58C0002BEC54385A4340E5A6F521128D58C0687C6D00395A43405255892D118D58C0879651AC395A434074013A39108D58C0A95396583A5A43408F8505450F8D58C08FD93D053B5A43403F1AEF500E8D58C0482848B23B5A4340E186F35C0D8D58C0F619B35F3C5A434038F114690C8D58C068D4800D3D5A43405A4652750B8D58C0EB31AFBB3D5A43403F99AC810A8D58C03358406A3E5A4340F1D6228E098D58C0702132193F5A43405612B69A088D58C07FB386C83F5A4340963865A7078D58C091E83B78405A4340835C31B4068D58C0A6C05128415A43402B7E1AC1058D58C08061CAD8415A4340879D20CE048D58C01ECBA589425A434097BA43DB038D58C0FEB1DF3A435A43405CD583E8028D58C0A2617CEC435A4340D4EDE0F5018D58C049B4799E445A434020F15903018D58C0B4CFD950455A43400705F110008D58C0238E9A03465A43409C16A51EFF8C58C0A2EFBBB6465A4340CD38772CFE8C58C017F43D6A475A4340AA58663AFD8C58C04FC1221E485A434043767248FC8C58C0D80B66D2485A434090919B56FB8C58C0171F0C87495A434071BDE264FA8C58C067D5123C4A5A434007E74673F98C58C0AB2E7AF14A5A43401934CA81F88C58C0C35044A74B5A4340F86B6990F78C58C01BF06C5D4C5A434053C7279FF68C58C07732F6134D5A4340632003AEF58C58C0973DE2CA4D5A4340008AFCBCF48C58C0F9C52C824E5A4340390414CCF38C58C05EF1D7394F5A4340078F49DBF28C58C087E5E5F14F5A434089179CEAF18C58C0F25652AA505A434080C30DFAF08C58C05F6B1F63515A43400D809D09F08C58C0D0224D1C525A4340354D4B19EF8C58C0527DDBD5525A4340CC3D1829EE8C58C0C87ACA8F535A4340FF3E0339ED8C58C0421B1A4A545A4340C6500C49EC8C58C0CC5ECA04555A434023733359EB8C58C08A1FD9BF555A4340F5B87969EA8C58C05983487B565A43405B0FDE79E98C58C01D8A1837575A43403889618AE88C58C0230E47F3575A43409126049BE78C58C03935D6AF585A434077D4C4ABE68C58C053FFC56C595A4340DBA5A4BCE58C58C06F6C162A5A5A4340CC87A2CDE48C58C0CD56C5E75A5A43401BA0C0DEE38C58C02EE4D4A55B5A4340E6DBFDEFE28C58C0D0EE42645C5A434038285901E28C58C0769C11235D5A4340E7AAD412E18C58C01EED40E25D5A4340323E6E24E08C58C008BBCEA15E5A4340CD072836DF8C58C03306BB615F5A4340E4F40048DE8C58C062F40722605A43407105F959DD8C58C0A185B5E2605A43406C39106CDC8C58C01494C1A3615A4340C4A3477EDB8C58C0D61F2C65625A434092319E90DA8C58C08D4EF726635A4340BEF514A3D98C58C094FA20E9635A434058DDAAB5D88C58C0CE23A9AB645A434048FB60C8D78C58C019F0916E655A4340B53C36DBD68C58C09839D931665A434053C72CEED58C58C066007FF5665A43406C754201D58C58C0764483B9675A4340FB467714D48C58C0892BE87D685A4340C261CD27D38C58C0DD8FAB42695A4340FE9F423BD28C58C06471CD076A5A43407127D94ED18C58C03CD04DCD6A5A434041E58F62D08C58C024D22E936B5A434080C66576CF8C58C07E2B6C596C5A4340FDF05C8ACE8C58C0DB270A206D5A4340C951749ECD8C58C0B87B04E76D5A4340F3E8ABB2CC8C58C098725FAE6E5A434053C904C7CB8C58C0BAE618766F5A43400AE07DDBCA8C58C069B22E3E705A4340182D17F0C98C58C01C21A506715A43405CC3D104C98C58C032E777CF715A4340FE8FAC19C88C58C06850AB98725A4340B0B8A92EC78C58C01E113B62735A4340E004C643C68C58C0154F292C745A434027AD0459C58C58C03F0A76F6745A4340C48B636EC48C58C0B94221C1755A434098B3E383C38C58C075F82A8C765A4340A4248599C28C58C0A2059157775A434006CC46AFC18C58C01F905523785A434086CF2AC5C08C58C0EC9778EF785A4340371C30DBBF8C58C0DE1CFABB795A434026B256F1BE8C58C06CF9D7887A5A434044919E07BE8C58C02D5314567B5A4340A1B9071EBD8C58C06F04AD237C5A4340163E9334BC8C58C0F232A4F17C5A4340C90B404BBB8C58C0B6DEF9BF7D5A4340AC220E62BA8C58C009E2AB8E7E5A4340A695FE78B98C58C08F62BC5D7F5A4340DF511090B88C58C0953A292D805A4340296A44A7B78C58C0EA8FF4FC805A4340B0CB99BEB68C58C0B23C1CCD815A4340508911D6B58C58C0C966A29D825A434007A3ABEDB48C58C060E8846E835A4340D6186805B48C58C068C1C33F845A4340DCD7451DB38C58C0C1176111855A4340FAF24535B28C58C08BC55AE3855A4340376A684DB18C58C0E4CAB0B5865A43408C3DAD65B08C58C07E4D6588875A4340D27F157EAF8C58C09827765B885A43405D0B9F96AE8C58C03259E32E895A4340FAF24AAFAD8C58C04CE2AC028A5A43408E491AC8AC8C58C0A7E8D4D68A5A43403BFC0BE1AB8C58C0834659AB8B5A4340FF0A20FAAA8C58C02BD637808C5A4340BC885713AA8C58C006E374558D5A43409762B12CA98C58C062470E2B8E5A43408B982D46A88C58C03D0304018F5A4340773DCD5FA78C58C0A71656D78F5A43405C519079A68C58C0828104AE905A434058C17593A58C58C0DD430F85915A43404DA07EADA48C58C0C75D765C925A43403BEEAAC7A38C58C030CF3934935A434028ABFAE1A28C58C00C98590C945A434026C46CFCA18C58C067B8D5E4945A4340234C0217A18C58C08F0AACBD955A4340FA55BC31A08C58C037B4DE96965A4340E9BB984C9F8C58C05FB56D70975A4340B0A399679E8C58C0070E594A985A434090E7BC829D8C58C021BEA024995A434050AD049E9C8C58C016A042FF995A434002E26FB99B8C58C07DD940DA9A5A43409498FFD49A8C58C0636A9BB59B5A43403EABB1F0998C58C0082D50919C5A4340BA3F880C998C58C02D47616D9D5A434016568328988C58C0D2B8CE499E5A434072DBA144978C58C0445C96269F5A4340A0E2E460968C58C06631B803A05A4340C7584B7D958C58C0085E36E1A05A4340CE50D699948C58C038E210BFA15A4340A7CA85B6938C58C01998459DA25A434061C659D3928C58C0C67FD47BA35A4340133151F0918C58C0E5BEBF5AA45A43409F1D6D0D918C58C0C32F053AA55A4340E59EAE2A908C58C02EF8A619A65A43402A8F13488F8C58C058F2A2F9A65A434041019D658E8C58C0411EF9D9A75A434013084C838D8C58C0AAA1ABBAA85A4340E47D1EA18C8C58C00131B69BA95A43406F8816BF8B8C58C0E7171D7DAA5A4340D41433DD8A8C58C08B30DE5EAB5A4340F23575FB898C58C0B0A0FB40AC5A4340EAD8DB19898C58C0D11C7123AD5A4340C2FD6638888C58C0B1CA4006AE5A43404DB71757878C58C010D06CE9AE5A4340B2F2EC75868C58C02F07F3CCAF5A4340D7C2E794858C58C0584AD1B0B05A4340B72708B4848C58C0F3E40B95B15A4340700E4DD3838C58C04DB1A079B25A4340E389B7F2828C58C0A4898D5EB35A4340109A4712828C58C089B9D643B45A4340FE3EFD31818C58C05DF57729B55A4340BE65D751808C58C0FD62730FB65A43402034D8717F8C58C04E02C9F5B65A43403697FE917E8C58C06BD378DCB75A4340327C49B27D8C58C047D682C3B85A4340BB08BBD27C8C58C012E5E4AAB95A43400D2A52F37B8C58C0AA25A192BA5A4340F2F20F147B8C58C00098B77ABB5A4340B03DF2347A8C58C0063C2863BC5A43400A30FB55798C58C018ECF04BBD5A434005CA2A77788C58C0E8CD1335BE5A4340BAF87F98778C58C0B5BB8E1EBF5A434029BCFAB9768C58C040DB6308C05A434033279CDB758C58C0C90691F2C05A4340F72663FD748C58C0106418DDC15A434056CE501F748C58C016F3F9C7C25A4340561D6541738C58C0656831B3C35A4340F213A063728C58C01835C59EC45A434021B20186718C58C023E8AE8AC55A434011E588A8708C58C0DECCF276C65A43409CBF36CB6F8C58C066E39063C75A4340A3540CEE6E8C58C01BE08450C85A4340637E07116E8C58C08F0ED33DC95A4340C64F29346D8C58C0CF6E7B2BCA5A43409DDB72576C8C58C03DB57919CB5A4340150FE37A6B8C58C0772DD207CC5A434029EA799E6A8C58C0ED8B80F6CC5A4340D76C37C2698C58C0141C89E5CD5A434001AA1CE6688C58C045B8E9D4CE5A4340C68E280A688C58C07460A2C4CF5A4340251B5B2E678C58C0533AB5B4D05A43400062B552668C58C07BFA1DA5D15A43405E633777658C58C0A1C6DE95D25A4340560CE09B648C58C0C39EF786D35A4340CA6FB0C0638C58C0E3826878D45A4340D27AA7E5628C58C0FF72316AD55A43404453C70A628C58C0196F525CD65A43404AD30D30618C58C03077CB4ED75A4340CB0D7C55608C58C082659A41D85A4340CF02127B5F8C58C0DF5FC134D95A43404EB2CFA05E8C58C0ED8B4228DA5A4340421CB5C65D8C58C07578171CDB5A4340B940C2EC5C8C58C0C9964610DC5A4340AA1FF7125C8C58C04B9BCB04DD5A4340F9CB54395B8C58C0CAABA8F9DD5A4340E91FD95F5A8C58C092A2DBEEDE5A43402E418686598C58C04AA566E4DF5A4340F61C5BAD588C58C00CB449DAE05A43401AC658D4578C58C0FCA882D0E15A4340B3297EFB568C58C0F7A913C7E25A4340AF5ACC22568C58C02E91FABDE35A43402746424A558C58C0925E37B5E45A434001FFE071548C58C00138CCACE55A43405172A799538C58C06D1DB9A4E65A434003B396C1528C58C015E9FB9CE75A434012C1AEE9518C58C0F89A9495E85A4340779CEF11518C58C01733838EE95A43405D32583A508C58C071B1C787EA5A434088A8EA624F8C58C0C83B6481EB5A434027D9A48B4E8C58C04DAC567BEC5A434023D787B44D8C58C0DD28A175ED5A43405CB594DD4C8C58C0F5653F70EE5A4340174EC9064C8C58C03B89336BEF5A43400FC727304B8C58C07DB87F66F05A4340640DAF594A8C58C0FBCD2162F15A434014215F83498C58C0F3A3175EF25A4340021539AD488C58C0F685655AF35A43404CD63BD7478C58C073280757F45A4340F3646701478C58C0E0D60054F55A4340DDD3BC2B468C58C0C6454E51F65A434024103B56458C58C0B7C0F34EF75A4340A72CE380448C58C014FCEC4CF85A43406129B5AB438C58C0BB1D3C4BF95A434085F3AFD6428C58C09E25E149FA5A4340DF9DD401428C58C0ECEDD948FB5A43407D28232D418C58C046C22A48FC5A434071809A58408C58C01957CF47FD5A434089CB3C843F8C58C067ACC747FE5A4340FDE307B03E8C58C0E2E71548FF5A4340A8DCFCDB3D8C58C0A609BA48005B434077C81C083D8C58C0A711B449015B4340A98165343C8C58C021DA014B025B4340121BD8603B8C58C01563A34C035B43409FA7758D3A8C58C045D29A4E045B434063143DBA398C58C0B027E850055B43406A612EE7388C58C0E2178753065B43408FA14A14388C58C003147E56075B4340F1C19041378C58C0DDAAC659085B434090C2006F368C58C0F227655D095B434054B69B9C358C58C0816557610A5B43402F9D61CA348C58C04B899F650B5B43404E6451F8338C58C0DC47396A0C5B4340AA0B6B26338C58C09BEC286F0D5B4340FDB8B054328C58C0E2516C740E5B43409B462083318C58C0569D057A0F5B434070B4B9B1308C58C09183F07F105B434043287FE02F8C58C0382A2F86115B43403A8F6F0F2F8C58C01AB7C38C125B434068D6893E2E8C58C0C3DEA993135B4340BA10CF6D2D8C58C0A8ECE59A145B43400B51409D2C8C58C0459573A2155B43409971DBCC2B8C58C01E2457AA165B43402698A2FC2A8C58C0AF4D8CB2175B4340D0B1942C2A8C58C0AC3715BB185B43409FBEB15C298C58C031E2F1C3195B434085BEF98C288C58C06F2720CD1A5B434070C46DBD278C58C0E952A4D61B5B434079BD0CEE268C58C01B197AE01C5B434081BCD71E268C58C0C79FA3EA1D5B4340A6AECD4F258C58C0EDE620F51E5B4340EA93EE80248C58C0CBC8EFFF1F5B4340327F3BB2238C58C0246B120B215B43407A70B4E3228C58C035A88616225B4340DF545815228C58C0C0A54E22235B43401C522947218C58C0123E682E245B43409D2F2479208C58C0D096D53A255B4340FE254CAB1F8C58C008B09647265B43405D22A0DD1E8C58C0F863A954275B4340E0111F101E8C58C0B0B20D62285B43403C1ACB421D8C58C01F9CC36F295B4340BD15A2751C8C58C0FB45CD7D2A5B43401D2AA6A81B8C58C09D8A288C2B5B43409B31D5DB1A8C58C0AB8FD79A2C5B4340F851310F1A8C58C0B109D6A92D5B43405478B942198C58C03E4428B92E5B434096B76E76188C58C08419CCC82F5B4340EFE94EAA178C58C08289C1D8305B43402E355CDE168C58C02B9408E9315B43404C999612168C58C05D5FA3F9325B434088F0FB46158C58C0859F8D0A345B434084738F7B148C58C0667AC91B355B434085FC4EB0138C58C0FFEF562D365B43407E8B3AE5128C58C00426383F375B43405E33531A128C58C00FD16851385B434015F4984F118C58C0D216EB63395B4340B3CD0B85108C58C08CD1BC763A5B43404FADAABA0F8C58C0C04CE2893B5B4340CBA576F00E8C58C0EB3C579D3C5B43402DB76F260E8C58C0DDC71DB13D5B434048F4965C0D8C58C079ED35C53E5B43406837EA920C8C58C00C889DD93F5B434061936AC90B8C58C01AE358EE405B4340400818000B8C58C06B8D6103425B4340FE95F2360A8C58C066D2BB18435B43407C4FFB6D098C58C01AB2672E445B4340000F30A5088C58C0C6066344455B43403CFA92DC078C58C037F6AF5A465B434040112414078C58C0925A4C71475B4340422EE14B068C58C0B4593A88485B43400477CC83058C58C0BECD779F495B434080EBE5BB048C58C0CEB604B74A5B4340E8782CF4038C58C0963AE3CE4B5B43400A32A12C038C58C0473311E74C5B43400A044365028C58C0EFA08EFF4D5B4340D201139E018C58C09C835B184F5B4340791810D7008C58C002017A31505B4340C16D3C10008C58C09ECDE54A515B4340E8DB9549FF8B58C0E434A364525B4340CF751D83FE8B58C02F11B07E535B4340763BD3BCFD8B58C071620C99545B4340E42CB7F6FC8B58C0AA28B8B3555B43400B4AC930FC8B58C0193EB1CE565B43401880086BFB8B58C040EEFBE9575B4340C6F476A5FA8B58C05F139605595B4340349513E0F98B58C0B3877D215A5B43404A74DF1AF98B58C0BF96B63D5B5B4340386CD855F88B58C002F53C5A5C5B4340C7A20091F78B58C03BC812775D5B43401D0557CCF68B58C06B1038945E5B43403393DB07F68B58C0D1A7AAB15F5B4340E95F8F43F58B58C03CB46CCF605B4340416B727FF48B58C090357EED615B4340778F82BBF38B58C01A06DD0B635B43403605C3F7F28B58C09A4B8B2A645B4340AEA63134F28B58C05FE08649655B4340E673CE70F18B58C00CEAD168665B4340AE929BADF08B58C0FD426A88675B43402EDD96EAEF8B58C0D71052A8685B43406853C027EF8B58C0E62D87C8695B4340311B1A65EE8B58C0FBBF0BE96A5B43409B21A3A2ED8B58C045A1DD096C5B4340BE535AE0EC8B58C0B7D1FC2A6D5B434088C4401EEC8B58C06C51694C6E5B4340CD86575CEB8B58C00B46256E6F5B4340E1749C9AEA8B58C02C642C90705B43406EB411D9E98B58C043F782B2715B43409C32B617E98B58C082D926D5725B434073EF8956E88B58C0050B18F8735B4340E2EA8C95E78B58C07FB1581B755B4340FA24BFD4E68B58C06D81E43E765B434093B02114E68B58C083A0BD62775B4340CD7AB353E58B58C0EA0EE486785B434088967593E48B58C078CC57AB795B4340E4F066D3E38B58C03DD918D07A5B4340C99C8813E38B58C0293527F57B5B43404787D953E28B58C097BA801A7D5B43404EC35A94E18B58C00AB529407E5B4340F53D0BD5E08B58C0D5D81D667F5B4340FF1CED15E08B58C030265D8C805B4340D027FD56DF8B58C074E8EBB2815B4340FC963E98DE8B58C02DD4C5D9825B4340B057B0D9DD8B58C059E9EA00845B4340FF56511BDD8B58C08B735F28855B4340B6BA235DDC8B58C061011D50865B43400E5D259FDB8B58C02E042A78875B4340E85057E1DA8B58C0AE0A80A0885B43402BA9BA23DA8B58C0726023C9895B4340E9524E66D98B58C05D0514F28A5B43404E3B11A9D88B58C0BCD34F1B8C5B43400E8805ECD78B58C09DCBD6448D5B434057262A2FD78B58C0E4ECA86E8E5B434003298072D68B58C06F5DC8988F5B4340367D06B6D58B58C060F732C3905B4340E422BDF9D48B58C0D3BAE8ED915B4340F52CA53DD48B58C0BAA7E918935B43408E88BD81D38B58C008BE3544945B4340A83506C6D28B58C0D7FDCC6F955B43402547800AD28B58C0CE8CB19B965B434004BD2B4FD18B58C0861FDFC7975B434045970894D08B58C0B1DB57F4985B434007C315D9CF8B58C051C11B219A5B43403353541ECF8B58C026F62C4E9B5B4340E134C363CE8B58C0DF08857B9C5B4340CA8D64A9CD8B58C0DB6A2AA99D5B43403C3836EFCC8B58C04BF61AD79E5B4340F1593A35CC8B58C06E855405A05B43402ECD6E7BCB8B58C0043ED933A15B4340CDA4D4C1CA8B58C00F20A962A25B4340A9F36C08CA8B58C0CD05C291A35B43400D94354FC98B58C0FE1426C1A45B4340B4AB3096C88B58C0E327D3F0A55B4340DC145CDDC78B58C03B64CB20A75B434048F5B924C78B58C007CA0E51A85B4340F64C4A6CC68B58C086339B81A95B43402DF60AB4C58B58C0B8A070B2AA5B4340A716FEFBC48B58C05E3791E3AB5B4340839B2244C48B58C0C4D1FA14AD5B43409B97798CC38B58C0CF6FAD46AE5B434024F801D5C28B58C04E37AB78AF5B4340E8CFBC1DC28B58C08002F2AAB05B4340F01EAA66C18B58C064D181DDB15B434060D2C8AFC08B58C009A45A10B35B43402CEA18F9BF8B58C0527A7C43B45B43402A8C9C42BF8B58C01E7AE976B55B43408292518CBE8B58C0CC579DAAB65B43401E1039D6BD8B58C0FD5E9CDEB75B4340FD045320BD8B58C01144E212B95B4340455E9E6ABC8B58C0A7527347BA5B4340AA411DB5BB8B58C0203F4B7CBB5B43407889CDFFBA8B58C05A2F6CB1BC5B4340695BB14ABA8B58C03823D6E6BD5B43409EA4C795B98B58C0D71A891CBF5B434035520FE1B88B58C029168552C05B4340F6898A2CB88B58C05DEFC788C15B4340FB383878B78B58C052CC53BFC25B43401C7219C4B68B58C0ECAC28F6C35B4340A70F2C10B68B58C0856B442DC55B43405537725CB58B58C0D12DA964C65B434046D6EAA8B48B58C00DCE549CC75B434062FF96F5B38B58C0FD7149D4C85B4340BA9F7542B38B58C0DDF3840CCA5B43403DCA878FB28B58C062790945CB5B4340036CCCDCB18B58C0E6DCD47DCC5B43400585432AB18B58C02B44E9B6CD5B4340193BEF77B08B58C0836342F0CE5B43406968CDC5AF8B58C09C86E429D05B4340030DDE13AF8B58C068ADCF63D15B43409B4E2362AE8B58C0638CFF9DD25B43407C079BB0AD8B58C0116F78D8D35B4340814A46FFAC8B58C0B02F3813D55B4340AA17254EAC8B58C040CE3E4ED65B4340F76E379DAB8B58C0CF4A8C89D75B43408E3D7CECAA8B58C041A520C5D85B434022A9F53BAA8B58C0E3B7F900DA5B4340E19EA28BA98B58C038CE1B3DDB5B4340BD1E83DBA88B58C07DC28479DC5B4340C328972BA88B58C0B49434B6DD5B4340F4BCDE7BA78B58C0281F29F3DE5B434042DB59CCA68B58C041AD6630E05B43409496091DA68B58C08AF3E86DE15B434011DCEC6DA58B58C010F2AFABE25B4340ABAB03BFA48B58C03BF4BFE9E35B434076054E10A48B58C096AE1428E55B4340200FCE61A38B58C02E21AE66E65B43400D9080B3A28B58C0A9718EA5E75B4340FEAD6705A28B58C015A0B5E4E85B434013568257A18B58C0BF862124EA5B4340339BD1A9A08B58C05A4BD463EB5B4340587D55FC9F8B58C017C8CBA3EC5B434081FC0D4F9F8B58C003FD07E4ED5B4340CE05FAA19E8B58C0EF0F8B24EF5B4340469919F59D8B58C00ADB5265F05B43409CDC6E489D8B58C0168461A6F15B43401DAAF79B9C8B58C083BFB2E7F25B43408327B6EF9B8B58C0EED84A29F45B4340052FA8439B8B58C089AA276BF55B43409AD3CE979A8B58C0463449ADF65B43402D152AEC998B58C04076AFEFF75B4340A506BB40998B58C05C705A32F95B434047827F95988B58C0C4224A75FA5B4340EE9A78EA978B58C03F8D7EB8FB5B43407A63A73F978B58C0368AF5FBFC5B434023B60995968B58C01F65B33FFE5B4340BFB8A1EA958B58C037F8B583FF5B43403A6B6F40958B58C0AF1DFBC7005C4340DFA77096948B58C073FB840C025C43406294A7EC938B58C059915351035C4340D1301443938B58C060DF6696045C43406557B499928B58C0F1BFBCDB055C4340BE408BF0918B58C096585721075C43403BB49547918B58C0B7833467085C434085EAD69E908B58C0086756AD095C4340CCBD4CF68F8B58C0D5DCBAF30A5C43401F2EF74D8F8B58C0C30A643A0C5C4340574ED7A58E8B58C020CB4F810D5C4340741EEDFD8D8B58C0AC4380C80E5C4340769E38568D8B58C0A64EF30F105C434065CEB9AE8C8B58C00FECA857115C4340519B6F078C8B58C0E61BA19F125C43402A185B608B8B58C0EC03DEE7135C4340C8577DB98A8B58C06E7E5D30155C43406B34D4128A8B58C0518B1F79165C4340F3C0606C898B58C0A22A24C2175C434060FD22C6888B58C0605C6B0B195C4340B9E91A20888B58C08D20F5541A5C4340D998497A878B58C03777C19E1B5C4340FDE4ACD4868B58C00186D2E81C5C4340E6F3462F868B58C0C5DB21331E5C4340B5B2168A858B58C0ABE9B57D1F5C43406A211CE5848B58C0FE898CC8205C4340EB525840848B58C00D97A313225C43404A34CA9B838B58C03D5CFF5E235C434096C571F7828B58C0586899AA245C4340A7195053828B58C0B12C78F6255C43409E1D64AF818B58C0A85D9742275C43405BE4AE0B818B58C01C21F98E285C4340E56D3068808B58C03C519BDB295C43404DA7E7C47F8B58C0BC1380282B5C4340A190D4217F8B58C0F742A5752C5C4340BB3CF87E7E8B58C092040DC32D5C43409BAB52DC7D8B58C0E832B5102F5C434041DDE3397D8B58C0DDCD9D5E305C4340CCBEAA977C8B58C04DFBC8AC315C43400576A9F57B8B58C05C9534FB325C43401CDDDD537B8B58C0269CE049345C4340000749B27A8B58C05E35CF98355C4340B2F3EA107A8B58C08215FCE7365C43401BA3C36F798B58C005886B37385C43405815D3CE788B58C043671B87395C4340534A192E788B58C06C8D09D73A5C43401C42968D778B58C0F5453A273C5C43408C0F4BED768B58C0396BAB773D5C4340E18C354D768B58C068D75AC83E5C4340DCDF57AD758B58C006D64C19405C43409EF5B00D758B58C08E1B7D6A415C43402CCE406E748B58C0C3CDEDBB425C43407A6907CF738B58C0A5EC9E0D445C43407CDA0530738B58C072528E5F455C434017213C91728B58C0AD4AC0B1465C43409E17A8F2718B58C011642E04485C4340D2E34B54718B58C0D60FDF56495C4340A78527B6708B58C09402CEA94A5C434041EA3918708B58C03D3CFBFC4B5C43408924847A6F8B58C093E268504D5C4340783406DD6E8B58C096F516A44E5C43402D07BF3F6E8B58C0D02901F84F5C434088AFAFA26D8B58C0A9CA2B4C515C4340B11AD7056D8B58C02ED896A0525C43405A6E37696C8B58C0DD063EF5535C4340D084CECC6B8B58C02BA2254A555C4340EC709D306B8B58C080844B9F565C4340AF32A4946A8B58C0B2ADAFF4575C434019CAE2F8698B58C09143544A595C43403137595D698B58C099FA34A05A5C4340086706C2688B58C08DF853F65B5C4340667FEC26688B58C03B63B34C5D5C4340716D0A8C678B58C005EF4EA35E5C4340243160F1668B58C0BAC128FA5F5C43407DCAED56668B58C05ADB4051615C4340654CB4BC658B58C0E63B97A8625C43400B91B122658B58C06AE32B00645C434040BEE788648B58C00AACFC57655C434015C155EF638B58C096BB0BB0665C43407FACFC55638B58C01A125908685C4340896DDBBC628B58C0BB89E260695C43403904F223628B58C04648AAB96A5C43407883418B618B58C00928AE126C5C434057D8C8F2608B58C0A94EF06B6D5C4340C415895A608B58C073966EC56E5C4340D82881C25F8B58C036252B1F705C43407424B22A5F8B58C015D52379715C4340B6F51A935E8B58C0EDCB5AD3725C434086AFBCFB5D8B58C01FBECB2D745C4340D75197645D8B58C03CF77A88755C4340B6DCAACD5C8B58C0915166E3765C43403C3DF6365C8B58C0C3F28F3E785C43404A867AA05B8B58C06C8FF399795C4340DFB7370A5B8B58C03E4D93F57A5C4340FBD12D745A8B58C0ED5171517C5C4340A6D45CDE598B58C0045289AD7D5C4340F8ACC348598B58C01599DF097F5C4340B18064B3588B58C08DDB6F66805C4340F33C3E1E588B58C0E3643EC3815C4340DBCE4F89578B58C0AFE94620835C43402B5C9BF4568B58C0E369897D845C434009D21F60568B58C0F5300ADB855C43406F30DDCB558B58C06EF3C438875C4340368AD437558B58C020D7BB96885C4340B2B903A4548B58C0FADBEEF4895C43408FE46C10548B58C02FDC5B538B5C4340F4F70E7D538B58C09CFD04B28C5C4340E0F3E9E9528B58C0711AE8108E5C43403BEBFE56528B58C0AE3205708F5C4340FEDD4DC4518B58C0076C5ECF905C434068A6D431518B58C098C6F32E925C43403B6A959F508B58C0CFF6C08E935C43407529900D508B58C02248CAEE945C43403ED1C37B4F8B58C0ACBA0F4F965C4340687431EA4E8B58C0DE028DAF975C43402100D8584E8B58C02A6C4610995C4340229AB9C74D8B58C02CAB37719A5C4340D109D3364D8B58C0570B65D29B5C4340C28727A64C8B58C0EB66CC339D5C434042EEB4154C8B58C0E6BD6D959E5C434023507C854B8B58C089EA46F79F5C434073AD7DF54A8B58C047385C59A15C43402B06B9654A8B58C07B81ABBBA25C43406A472DD6498B58C056A0321EA45C4340F396DC46498B58C099BAF380A55C43400ACFC4B7488B58C044D0EEE3A65C43406315E828488B58C096BB2147A85C43404A44449A478B58C012C890AAA95C43407A81DB0B478B58C07384350EAB5C434032A7AB7D468B58C0FD611672AC5C43403ADBB6EF458B58C02F152FD6AD5C4340A20AFC61458B58C0079E7F3AAF5C43407B357BD4448B58C039220A9FB05C4340946E3547448B58C0207CCC03B25C43403D9028BA438B58C07DD1C868B35C43402EC0562D438B58C064FCFCCDB45C434070FEBFA0428B58C001FD6833B65C434031256214428B58C052D30C99B75C43403C5A3F88418B58C0EFA4EAFEB85C43409E9D57FC408B58C08E26FE64BA5C434059DCA970408B58C078A34BCBBB5C4340841636E53F8B58C026F6D031BD5C4340FF5EFD593F8B58C06C1E8E98BE5C4340BCB5FFCE3E8B58C0591C83FFBF5C4340E8073C443E8B58C02BCAAD66C15C43405668B3B93D8B58C0657312CEC25C434033C4642F3D8B58C046F2AE35C45C4340414152A53C8B58C00C21819DC55C4340C9A6781B3C8B58C078258B05C75C4340882DDB913B8B58C08CFFCC6DC85C434089C278083B8B58C0858944D6C95C4340F952507F3A8B58C032E9F33ECB5C4340B2F162F6398B58C06A1EDBA7CC5C4340B49EB06D398B58C0A303F810CE5C4340FF5939E5388B58C075BE4C7ACF5C43409A23FD5C388B58C02D29D7E3D05C43407DFBFBD4378B58C0C943974DD25C4340A3E1354D378B58C00C348FB7D35C434019D6AAC5368B58C0F6F9BE21D55C4340D7D85A3E368B58C0114A228CD65C4340C7FC46B7358B58C0C66FBDF6D75C4340171C6D30358B58C05F458E61D95C4340985CCFA9348B58C0DECA94CCDA5C43405BAB6C23348B58C04200D137DC5C43406E08459D338B58C05A0B45A3DD5C4340CA735817338B58C088A0EC0EDF5C43405000A891328B58C09CE5C97AE05C4340269B320C328B58C06400DFE6E15C43404444F886318B58C042A52753E35C4340850EFA01318B58C005FAA5BFE45C434017E7367D308B58C0ECD8572CE65C4340D1E0AFF82F8B58C0878D4199E75C4340D5E863742F8B58C039CC5E06E95C43400A1254F02E8B58C0CFBAB173EA5C4340615C806C2E8B58C059593AE1EB5C434008B5E7E82D8B58C0F881F64EED5C4340F81B8A652D8B58C07D5AE8BCEE5C4340F2B669E22C8B58C033BD0D2BF05C43403560845F2C8B58C0C1CF6899F15C4340C917DADC2B8B58C0726CF707F35C43405F036D5A2B8B58C04793B976F45C434046FD3AD82A8B58C00F6AB1E5F55C4340561845562A8B58C0EDCADC54F75C434090548BD4298B58C0B0DB3DC4F85C4340F4B10D53298B58C0E350D033FA5C43408830CCD1288B58C0EE7598A3FB5C434040D0C650288B58C02A259413FD5C4340467EFCCF278B58C07C5EC383FE5C434051606F4F278B58C0F22126F4FF5C434093631ECF268B58C08B6FBC64015D43401775084F268B58C0952184D5025D4340A5BA2FCF258B58C084838146045D43406521934F258B58C0896FB2B7055D43402EBC33D0248B58C0EFBF1429075D43403A650F51248B58C0889AAA9A085D4340564228D2238B58C036FF730C0A5D4340C32D7C53238B58C055C86E7E0B5D434014600ED5228B58C04A419FF00C5D4340B5A0DB56228B58C0E1F8FE620E5D43405A15E6D8218B58C06B6094D50F5D43402FAB2C5B218B58C087065948115D43400E75B0DD208B58C0C73651BB125D434017607060208B58C039F17C2E145D4340516C6CE31F8B58C0FF0FDAA1155D434095ACA5661F8B58C035936815175D4340FC0D1BEA1E8B58C081A02A89185D434075A3CD6D1E8B58C03E121EFD195D4340F86CBDF11D8B58C04EE842711B5D4340A457E9751D8B58C0C12299E51C5D4340627652FA1C8B58C0A4C1205A1E5D43402AC9F87E1C8B58C0E9C4D9CE1F5D4340153DDB031C8B58C0822CC443215D434012E5FA881B8B58C0401EE2B8225D434019C1570E1B8B58C0AC4E2F2E245D434049BEF0931A8B58C06CE3ADA3255D43406C02C8191A8B58C09CDC5D19275D4340B167DB9F198B58C05F143D8F285D434008012C26198B58C054D64F052A5D434069CEB9AC188B58C0DCD6917B2B5D4340D5CF8433188B58C0D33B05F22C5D43404B058DBA178B58C05EDFA7682E5D4340EB5BD141178B58C059E77BDF2F5D43407DF953C9168B58C0E62D7F56315D434019CB1351168B58C0E4D8B3CD325D4340C0D010D9158B58C074C21745345D4340710A4B61158B58C07510ADBC355D43400D8BC3E9148B58C0099D7134375D4340DA2C7872148B58C04B6865AC385D43408C156BFB138B58C0E1978A243A5D43406D1F9A84138B58C02706DF9C3B5D43401B83080E138B58C0FEB262153D5D4340F307B397128B58C0859E158E3E5D4340B5D39B21128B58C09FC8F706405D434089D3C1AB118B58C067310980415D434061072536118B58C0C2D849F9425D43402B82C6C0108B58C0CBBEB972445D4340FF30A54B108B58C076E358EC455D4340DD13C1D60F8B58C0B3462766475D434088501C620F8B58C091E824E0485D434063AEB3ED0E8B58C05CA34F5A4A5D4340225389790E8B58C0BA9CA9D44B5D4340D33E9D050E8B58C0C6D4324F4D5D43408F5EEE910D8B58C0A425E9C94E5D43403DC57D1E0D8B58C031B5CE44505D4340C9724BAB0C8B58C08F5DE1BF515D43406C5456380C8B58C09C44233B535D4340F47C9FC50B8B58C03B6A94B6545D43408DD925530B8B58C0C8A83232565D4340F28FEBE00A8B58C02500FEAD575D4340627AEE6E0A8B58C07170F629595D4340C4AB2FFD098B58C04E1F1EA65A5D43400A24AF8B098B58C01AE772225C5D434061D06B1A098B58C0B6C7F49E5D5D434084D667A9088B58C040C1A31B5F5D4340B210A138088B58C0A9D37F98605D4340A4A419C8078B58C0A4248B15625D4340AF6CCF57078B58C0BE68C192635D4340A67BC3E7068B58C0C4C52410655D434061E4F677068B58C09C3BB58D665D43402D816708068B58C061CA720B685D4340C6771799058B58C0F8715D89695D434068A2042A058B58C0BA0C73076B5D4340D72631BB048B58C01DE6B7856C5D434038F29B4C048B58C090B227046E5D4340840445DE038B58C02072C2826F5D4340B55D2C70038B58C09E4A8A01715D4340B8105302038B58C0ED3B7F80725D4340A60AB894028B58C068209FFF735D4340874B5B27028B58C0B41DEC7E755D43404BD33CBA018B58C02C0E64FE765D4340E3B45D4D018B58C0B3F1067E785D43405FDDBCE0008B58C028EED6FD795D4340D44C5A74008B58C0EBB7CF7D7B5D43400D163708008B58C05DC0F7FD7C5D43401A39539CFF8A58C01D96487E7E5D43402A90AC30FF8A58C0FB5EC4FE7F5D4340EE5346C5FE8A58C0C6406D7F815D43409D5E1E5AFE8A58C0DFEF3E00835D434030B034EFFD8A58C0E6B73D81845D4340965B8A84FD8A58C03B4D6502865D4340EF4D1E1AFD8A58C0BCD5B783875D4340EDACF2AFFC8A58C04C513505895D4340FC3F0446FC8A58C008C0DD868A5D4340B83F56DCFB8A58C0D421B1088C5D43405F86E672FB8A58C0FD50AD8A8D5D4340D226B609FB8A58C01299D60C8F5D43401821C5A0FA8A58C0B588268F905D434042621238FA8A58C0836BA111925D43403FFD9ECFF98A58C061414794935D434008F26A67F98A58C06A0A1817955D43409D4076FFF88A58C0017B0F9A965D4340FEE8C097F88A58C0B5DE311D985D43402BEB4A30F88A58C095357FA0995D43404A3413C9F78A58C00134F3239B5D434015EA1B62F78A58C08C2592A79C5D4340CCE662FBF68A58C081E4592B9E5D43402F50EA94F68A58C085964CAF9F5D43407E00B02EF68A58C033F06533A15D4340791DB6C8F58A58C0F03CAAB7A25D43404794FB62F58A58C05631153CA45D434000527FFDF48A58C0CB18ABC0A55D4340667C4398F48A58C0DCA76745A75D434091004733F48A58C049044DCAA85D434096DE89CEF38A58C0202E5B4FAA5D434047290D6AF38A58C0452592D4AB5D4340DDBACE05F38A58C0C6E9F159AD5D434026B9D0A1F28A58C0F15578DFAE5D43403B11123EF28A58C06A8F2765B05D4340FDD593DAF18A58C04C96FFEAB15D4340AAE15377F18A58C0BC44FE70B35D43400B5A5414F18A58C0C79A23F7B45D4340113F95B1F08A58C02DBE717DB65D43400A6B144FF08A58C0FFAEE803B85D43408F16D5ECEF8A58C05C47868AB95D43400009D48AEF8A58C063874A11BB5D434025681329EF8A58C0F66E3598BC5D4340EF3393C7EE8A58C0E623491FBE5D434086595266EE8A58C0718083A6BF5D4340EFD85005EE8A58C0A484E42DC15D4340E5D790A4ED8A58C056306CB5C25D4340C71D0F44ED8A58C0BF831A3DC45D434056D0CDE3EC8A58C0B57EEFC4C55D434098EFCC83EC8A58C04521EB4CC75D4340867B0C24EC8A58C07E6B0DD5C85D434041618BC4EB8A58C0445D565DCA5D4340A8B34A65EB8A58C0E4D0C3E5CB5D4340BC724A06EB8A58C0DF115A6ECD5D43409C8B89A7EA8A58C0B4D414F7CE5D434030110949EA8A58C0243FF67FD05D43406903C9EAE98A58C07B2BFC08D25D4340754FC88CE98A58C05FBF2892D35D43400E1B092FE98A58C01CD5791BD55D4340744089D1E88A58C07492F1A4D65D43408DD24974E88A58C066F78F2ED85D43404BD14A17E88A58C07FB850B8D95D4340BE3C8CBAE78A58C024213842DB5D4340DD140E5EE78A58C0643146CCDC5D4340A959D001E78A58C0BC9D7656DE5D4340210BD3A5E68A58C0AFB1CDE0DF5D43404D29164AE68A58C07B47496BE15D43401FB499EEE58A58C0205FE9F5E25D4340C3985C93E58A58C09EF8AD80E45D4340F5FC6038E58A58C0B839990BE65D4340D4CDA5DDE48A58C0E9D6A696E75D4340401E2C83E48A58C0F3F5D821E95D434078C8F128E48A58C0E5962FADEA5D434063DFF7CEE38A58C0E193A838EC5D4340D5753F75E38A58C0773848C4ED5D43400279C71BE38A58C025390A50EF5D4340CDE88FC2E28A58C09FBBF0DBF05D434053C59869E28A58C00EC0FB67F25D43407F0EE210E28A58C0782029F4F35D43403FD76CB8E18A58C017DD7880F55D4340AB0C3860E18A58C0721BED0CF75D4340A6C14408E18A58C0B5DB8599F85D43406CD090B0E08A58C010F84026FA5D4340A0711F59E08A58C083701EB3FB5D4340A06CED01E08A58C0CF6A2040FD5D434034E7FCAADF8A58C033C144CDFE5D434075CE4C54DF8A58C0AE738B5A005E43404435DEFDDE8A58C04282F4E7015E4340BF08B0A7DE8A58C0A0128275035E4340C75BC351DE8A58C071D92F03055E4340841B17FCDD8A58C000220291065E4340C65AACA6DD8A58C0F2A0F41E085E4340BD068251DD8A58C0FD7B09AD095E4340403299FCDC8A58C0E0D8423B0B5E434051DDF1A7DC8A58C01B6C9CC90C5E434016F58A53DC8A58C06C5B18580E5E4340618C65FFDB8A58C00781B4E60F5E4340609080ABDB8A58C0C7027375115E4340EC13DD57DB8A58C09FE05304135E4340FF167B04DB8A58C08E1A5793145E4340CC8659B1DA8A58C0D48A7A22165E434001897A5EDA8A58C06231BEB1175E434008E5DA0BDA8A58C017342441195E43407DD37DB9D98A58C0E392ACD01A5E434079416267D98A58C0350253601C5E4340291C8715D98A58C0AECD1BF01D5E43406676EDC3D88A58C03EF506801F5E434037509572D88A58C0552D1010215E434096A97E21D88A58C093C13BA0225E43407B82A9D0D78A58C0268C8730245E4340F4DA1580D78A58C0028DF3C0255E43401AA0C22FD78A58C0809E7D51275E4340AFF7B1DFD68A58C0080C2AE2285E4340F0BBE18FD68A58C0F5AFF6722A5E4340A6125440D68A58C0388AE3032C5E434009D606F1D58A58C01075EE942D5E4340DA2BFCA1D58A58C0309619262F5E434057EE3153D58A58C0A6ED64B7305E43404343AA04D58A58C0817BD048325E4340C31764B6D48A58C0F1195ADA335E4340E9585E68D48A58C0A9EE036C355E4340842C9B1AD48A58C0B7F9CDFD365E4340AC7F19CDD38A58C06815B68F385E43404365DA7FD38A58C0AE41BC213A5E434086B7DB32D38A58C03DA4E2B33B5E43403E9C1FE6D28A58C0601727463D5E43409CEDA399D28A58C0269B89D83E5E43406FD16A4DD28A58C034550C6B405E4340B0477401D28A58C0D71FADFD415E43409E2ABEB5D18A58C01DFB6B90435E434001A04A6AD18A58C0EAE64823455E4340EB94181FD18A58C04BE343B6465E4340491C29D4D08A58C011165F49485E43404D107A89D08A58C09D3396DC495E4340A8A90E3FD08A58C0BD61EB6F4B5E4340AEAFE3F4CF8A58C080A05E034D5E43402A48FBAACF8A58C0C9EFEF964E5E43402D605461CF8A58C0E7299D2A505E4340A40AF017CF8A58C0689A6ABE515E4340A234CDCECE8A58C0AFF55352535E43401CF1EC85CE8A58C0C93B59E6545E43401C2D4E3DCE8A58C039B87E7A565E43408BFBF1F4CD8A58C0BCF9BD0E585E43408E49D7ACCD8A58C0D34B1BA3595E43401E17FE64CD8A58C08DAE96375B5E4340FE89681DCD8A58C00CFC2DCC5C5E4340836913D6CC8A58C0215AE3605E5E43405DEE018FCC8A58C0477DB2F55F5E4340CDF23148CC8A58C002B19F8A615E4340C976A301CC8A58C090CFA81F635E43402D8D57BBCB8A58C0B3FECFB4645E434006364E75CB8A58C0F6F2104A665E43404D71872FCB8A58C0F0D16DDF675E4340212C02EACA8A58C09BC1E874695E43406B79BFA4CA8A58C03C767D0A6B5E43401C59BF5FCA8A58C0803B30A06C5E434061B8001BCA8A58C0D6C5FC356E5E434014AA84D6C98A58C0FF3AE5CB6F5E4340362E4B92C98A58C03A75E761715E4340C544544EC98A58C009C007F8725E4340E2DA9E0AC98A58C0EBCF418E745E434074032CC7C88A58C0A0CA9724765E434055D1FC83C88A58C0678A07BB775E4340C41E0F41C88A58C0F3349351795E4340BFEB62FEC78A58C09FA438E87A5E43400A5EFABBC78A58C01EFFF97E7C5E4340CA62D479C78A58C0AF1ED5157E5E434010E7EF37C78A58C05203CAAC7F5E4340AC104FF6C68A58C0C9D2DA43815E4340D6B9EFB4C68A58C0436705DB825E43406EF5D273C68A58C0DDC04972845E434054D6F932C68A58C07BDFA709865E4340C83662F2C58A58C039C31FA1875E4340B1290DB2C58A58C0CA91B338895E4340E9C1FB71C58A58C0ACFF5ED08A5E4340AFD92B32C58A58C0913224688C5E4340C3969FF2C48A58C0962A03008E5E434065D354B3C48A58C09FE7FB978F5E43405CB54D74C48A58C0C9690E30915E4340DA168835C48A58C0F5B03AC8925E4340B51D06F7C38A58C081977E60945E4340F7B6C6B8C38A58C01E43DCF8955E4340A7E2C97AC38A58C0FD8D5191975E4340C6A00F3DC38A58C0FC9DE029995E4340330499FFC28A58C0007389C29A5E434035E763C2C28A58C053E7495B9C5E4340856F7285C28A58C005FB21F49D5E4340448AC348C28A58C0BBD3138D9F5E43407037570CC28A58C0CF4B1D26A15E4340EC892ED0C18A58C025633EBFA25E4340DD6E4894C18A58C0CC197758A45E43403CE6A458C18A58C09395C9F1A55E434002F0431DC18A58C09CB0338BA75E43401E9F26E2C08A58C0F66AB524A95E4340AFE04BA7C08A58C0DE9E4CBEAA5E4340A7B4B36CC08A58C0E697FD57AC5E4340151B5E32C08A58C03130C6F1AD5E4340CA264CF8BF8A58C00A42A48BAF5E4340D5D77DBEBF8A58C0F6189C25B15E43406E08F184BF8A58C07069A9BFB25E43403DF1A84BBF8A58C03A59CE59B45E43409359A212BF8A58C0A2C208F4B55E43403867DFD9BE8A58C04CCB5A8EB75E4340321A60A1BE8A58C04673C428B95E4340BA4C2269BE8A58C0CF9443C3BA5E434071372931BE8A58C0A855DA5DBC5E434097B472F9BD8A58C0119086F8BD5E434032C4FEC1BD8A58C0CA694A93BF5E43401479CE8ABD8A58C011BD232EC15E43406CC0E053BD8A58C0E88912C9C25E434013AD361DBD8A58C04DD01664C45E4340083FD0E6BC8A58C003B632FFC55E43406C63ACB0BC8A58C086EF619AC75E4340451ACB7ABC8A58C059C8A835C95E434066762D45BC8A58C0AE1A05D1CA5E4340DC77D30FBC8A58C09FE6766CCC5E4340A21EBDDABB8A58C05E06FC07CE5E4340D657E9A5BB8A58C06DC598A3CF5E434077235871BB8A58C00BFE4A3FD15E434050A70B3DBB8A58C0688A10DBD25E434096BD0109BB8A58C06290EB76D45E434044663AD5BA8A58C02AEAD912D65E434030C7B7A1BA8A58C042E3DFAED75E43407BBA776EBA8A58C01930F94AD95E434043407A3BBA8A58C0CCD025E7DA5E4340337EC108BA8A58C0FFEA6783DC5E4340984E4BD6B98A58C00E59BD1FDE5E43404DC418A4B98A58C0AC4028BCDF5E434050DF2972B98A58C0097CA658E15E4340A29F7E40B98A58C0F5303AF5E25E434062F2150FB98A58C0FC13DF91E45E434072EAF0DDB88A58C08270992EE65E4340D7870FADB88A58C0E52067CBE75E43408BCA717CB88A58C015254868E95E4340AD9F164CB88A58C0C5A23E05EB5E4340FE2C001CB88A58C0824E46A2EC5E4340BE4C2CECB78A58C01A4E613FEE5E4340D4119CBCB78A58C071A18FDCEF5E4340397C4F8DB78A58C09648D179F15E4340E58B465EB78A58C0C61D2417F35E4340EF40812FB78A58C0946C8CB4F45E4340409BFF00B78A58C05FE90552F65E4340E09AC1D2B68A58C0F8B992EFF75E4340F52CC6A4B68A58C09DB8308DF95E434033770F77B68A58C00F0BE22AFB5E4340E6539B49B68A58C05CB1A6C8FC5E4340C9E86B1CB68A58C0A8857C66FE5E43401A107FEFB58A58C0F1876304005F43409BEFD6C2B58A58C024DE5DA2015F434090617196B58A58C054626940035F4340B68B506AB58A58C0911486DE045F43404948723EB58A58C09A1AB67C065F43400CBDD812B58A58C0EF28F51A085F43401ED782E7B48A58C0108B47B9095F4340A5836FBCB48A58C0301BAB570B5F434055E8A091B48A58C06AD91FF60C5F43405BF21567B48A58C0BDC5A5940E5F4340AFA1CE3CB48A58C03FBA3A33105F434053F6CA12B48A58C09C02E3D1115F434045F00AE9B38A58C044539A70135F4340868F8EBFB38A58C0B9F7640F155F43401DD45596B38A58C06AA43EAE165F4340DDD0616DB38A58C07459274D185F4340FA72B144B38A58C08A3C21EC195F43407DA7431CB38A58C09D4D2C8B1B5F434031941AF4B28A58C0CB8C482A1D5F4340332635CCB28A58C082AE71C91E5F43406C7094A4B28A58C0F723AE68205F4340134D367DB28A58C0F67BF707225F4340EAE11C56B28A58C00F0252A7235F43400F1C472FB28A58C07290BB46255F434084FBB408B28A58C0D34C36E6265F43402F9367E2B18A58C0BDEBBD85285F434041BD5CBCB18A58C0C1B856252A5F43408A9F9696B18A58C0018EFEC42B5F434022271471B18A58C09A6BB5642D5F4340E966D64BB18A58C0AE2B79042F5F43401F39DB26B18A58C0CD194EA4305F434084C32402B18A58C045103244325F43402006B3DDB08A58C038E922E4335F43402ADB83B9B08A58C075CA2284355F43405C689995B08A58C0FDB33124375F4340EC9AF271B08A58C0DDA54FC4385F4340A485904EB08A58C0387A7A643A5F4340B215722BB08A58C0DE56B4043C5F4340084B9708B08A58C0CE3BFDA43D5F4340943801E6AF8A58C085DD50453F5F434070CBAEC3AF8A58C048ADB5E5405F43409A03A0A1AF8A58C0D3392586425F4340F4F3D57FAF8A58C0A8CEA326445F4340A4894F5EAF8A58C0C86B31C7455F434083D70D3DAF8A58C0AFC5C967475F4340ABCA0F1CAF8A58C0E0277108495F4340286355FBAE8A58C09A6C25A94A5F4340D5B3DFDAAE8A58C0DE93E6494C5F4340D8A9ADBAAE8A58C0AA9DB4EA4D5F43400358C09AAE8A58C0F1898F8B4F5F434084AB167BAE8A58C00D33752C515F43404DA4B05BAE8A58C066E469CD525F434054558F3CAE8A58C056786B6E545F434084BEB21DAE8A58C00EC9770F565F434002CD19FFAD8A58C040FC90B0575F4340D680C4E0AD8A58C00912B751595F4340D3ECB3C2AD8A58C05B0AEAF25A5F43400711E8A4AD8A58C067BF27945C5F434089DA5F87AD8A58C0483170355E5F43405A491B6AAD8A58C0A485C5D65F5F43405B701B4DAD8A58C096BC2778615F4340934F6030AD8A58C043B09419635F434012D4E813AD8A58C0B6600CBB645F4340E8FDB4F7AC8A58C000CE8E5C665F4340ECDFC5DBAC8A58C0C41D1EFE675F4340217A1BC0AC8A58C04F2AB89F695F4340ACB9B4A4AC8A58C0B0F35C416B5F43405FB19289AC8A58C0CA790CE36C5F43404861B56EAC8A58C06EE2C8846E5F434099A31A54AC8A58C017E28D26705F434002B1C539AC8A58C0889E5DC8715F4340C063B41FAC8A58C0CE17386A735F4340A7CEE705AC8A58C0CE4D1D0C755F4340E3DE5EECAB8A58C095400DAE765F434048A71AD3AB8A58C062CA0550785F4340E4271BBAAB8A58C0F61009F2795F4340CF4D5FA1AB8A58C0521417947B5F4340EA2BE888AB8A58C0B4AE2D367D5F43403BC2B570AB8A58C0DD054FD87E5F4340D4FDC658AB8A58C0FEF3787A805F4340C3DE1B41AB8A58C0F59EAD1C825F4340C28AB629AB8A58C0F1E0EABE835F434010DC9412AB8A58C0B5DF3261855F43408EE5B7FBAA8A58C080758303875F43405B941EE5AA8A58C04FA2DCA5885F43405EFBC9CEAA8A58C017663E488A5F43408A1ABAB8AA8A58C0B5E6AAEA8B5F4340ECF1EEA2AA8A58C088D81D8D8D5F43409E6E678DAA8A58C032879B2F8F5F43407FA32478AA8A58C011A71FD2905F4340B67D2563AA8A58C0C783AE74925F4340F6226C4EAA8A58C0B2D14317945F43408D6DF639AA8A58C0B2B6E1B9955F43406B5DC425AA8A58C079588A5C975F43406718D811AA8A58C0B54537FF985F4340AC782FFEA98A58C0B8EFEEA19A5F43402091CBEAA98A58C00E0BAD449C5F4340CA61ACD7A98A58C05CBD73E79D5F4340BDD7D0C4A98A58C0EEE0408A9F5F4340E6053AB2A98A58C0869B162DA15F43403FECE79FA98A58C063C7F2CFA25F4340C78ADA8DA98A58C09264D572A45F4340A6CE107CA98A58C0B998C015A65F4340ADCA8B6AA98A58C0E663B4B8A75F4340EA7E4B59A98A58C0967AAC5BA95F434058EB4F48A98A58C04C28ADFEAA5F4340F50F9937A98A58C04747B4A1AC5F4340E0D92527A98A58C086D7C144AE5F4340FC5BF716A98A58C009D9D5E7AF5F43404E960D07A98A58C00F26EE8AB15F4340E87567F7A88A58C00E0A0F2EB35F4340992007E8A88A58C05E5F36D1B45F43409970EAD8A88A58C0F4256474B65F4340C97812CAA88A58C00C389617B85F434029397FBBA88A58C068BBCEBAB95F4340BFB130ADA88A58C00AB00D5EBB5F4340A4CF259FA88A58C0E1155301BD5F434099B86091A88A58C04AC79CA4BE5F4340DD46DF83A88A58C0E9E9EC47C05F4340518DA276A88A58C0195841EBC15F4340F58BAA69A88A58C08D379C8EC35F4340E72FF65CA88A58C07762FB31C55F4340F19E8750A88A58C0E3D85ED5C65F43404AB35C44A88A58C0A2C0C878C85F4340D27F7638A88A58C014CE341CCA5F43408A04D52CA88A58C09B72A9BFCB5F434071417821A88A58C0D43C2063CD5F434090366016A88A58C091529B06CF5F4340DEE38C0BA88A58C092D91CAAD05F43407A36FD00A88A58C06386A04DD25F43404041B2F6A78A58C0A97E28F1D35F43403C04ACECA78A58C071C2B494D55F43404F92EBE2A78A58C07F774738D75F4340CAB26DD9A78A58C08C2CDADBD85F43405B9E35D0A78A58C0DD52737FDA5F43401D4242C7A78A58C0F09E0E23DC5F43402D8B92BEA78A58C08636AEC6DD5F43404E9F28B6A78A58C09F19526ADF5F4340BE5802AEA78A58C07A22F80DE15F43405DCA20A6A78A58C01651A0B1E25F434033F4839EA78A58C0E8F04E55E45F434039D62B97A78A58C0C990FDF8E55F43406E701890A78A58C02C7CB09CE75F4340D3C24989A78A58C0518D6540E95F434087BABE82A78A58C029C41CE4EA5F4340527D797CA78A58C09346D887EC5F434065E57776A78A58C0EEC8932BEE5F4340AE05BB70A78A58C0DB9653CFEF5F434028DE426BA78A58C0888A1573F15F4340D16E0F66A78A58C0EAA3D916F35F4340B0B72061A78A58C04BBD9DBAF45F4340B8B8765CA78A58C03D22665EF65F4340F7711158A78A58C0E3AC3002F85F43405FE3F053A78A58C09737FBA5F95F43401CFA1350A78A58C0FEE7C749FB5F4340EADB7C4CA78A58C027BE96EDFC5F43400D632949A78A58C04F946591FE5F43405AA21A46A78A58C04890363500604340BDAC5143A78A58C0328C07D901604340695CCC40A78A58C0DEADDA7C036043404BC48B3EA78A58C04BF5AF20056043405DE48F3CA78A58C0B83C85C406604340C4A9D73AA78A58C025845A6808604340353A6539A78A58C092CB2F0C0A604340DD823738A78A58C0C13807B00B604340CD704D37A78A58C0F0A5DE530D604340D429A936A78A58C01013B6F70E60434029884836A78A58C03F808D9B1060434097B12D36A78A58C06EED643F126043404C805636A78A58C05E803EE3136043403707C436A78A58C07EED1587156043404C467637A78A58C0AD5AED2A17604340973D6D38A78A58C0DCC7C4CE1860434011EDA839A78A58C03B0F9A721A604340BC54293BA78A58C06A7C71161C604340BC61ED3CA78A58C0C9C346BA1D604340C539F73EA78A58C0360B1C5E1F60434006CA4541A78A58C0D32CEF012160434095FFD743A78A58C0714EC2A52260434053EDAE46A78A58C05B4A93492460434022A6CB49A78A58C0374664ED2560434040042C4DA78A58C0601C339127604340951AD150A78A58C07BF201352960434012E9BA54A78A58C0D4A2CED82A604340C66FE958A78A58C06C2D997C2C604340A9AE5C5DA78A58C0429261202E604340DC921362A78A58C018F729C42F60434026421067A78A58C06B10EE673160434098A9516CA78A58C0BE29B20B3360434060B6D671A78A58C08FF771AF34604340587BA077A78A58C05FC5315336604340590BB07DA78A58C0AC47EDF637604340B8400384A78A58C0F9C9A89A396043403E2E9B8AA78A58C0B500603E3B604340F5D37791A78A58C0BE1115E23C604340011F9898A78A58C036D7C5853E6043401E35FE9FA78A58C0FA767429406043406A03A9A7A78A58C0FDF020CD41604340067797AFA78A58C06F1FC97043604340B1B5CBB7A78A58C02D286F1445604340B39943C0A78A58C069E510B846604340DD3500C9A78A58C0D47CB05B486043403E8A01D2A78A58C0BDC84BFF49604340CE9647DBA78A58C023C9E2A24B6043408E5BD2E4A78A58C0147E75464D6043407ED8A1EEA78A58C0360D06EA4E604340BCFAB4F8A78A58C0E250928D5060434012E80D03A88A58C0FE481A3152604340B77AAA0DA88A58C096F59DD4536043408BC58B18A88A58C0AB561D785560434090C8B123A88A58C03E6C981B57604340C3831C2FA88A58C08C100DBF5860434027F7CB3AA88A58C0198F7F625A604340E00FBF46A88A58C0619CEB055C604340AAF3F752A88A58C0E78355A95D604340C27C745FA88A58C068D4B64C5F60434003BE356CA88A58C027FF15F0606043407BB73B79A88A58C094B86E936260434029698686A88A58C08C26C3366460434000D31594A88A58C03F2311DA656043402DE2E8A1A88A58C0A0AE587D676043406BBC01B0A88A58C08BEE9B2069604340F73B5EBEA88A58C0F4E2DAC36A604340B373FFCCA88A58C0494011676C6043409E63E5DBA88A58C01B52430A6E604340C00B10EBA88A58C0B6F26EAD6F6043402A597EFAA88A58C0FF21945071604340CB5E310AA98A58C0D305B5F3726043409B1C291AA98A58C09352CD96746043409B92652AA98A58C00F2EDF3976604340D2C0E63AA98A58C007BEECDC7760434031A7AC4BA98A58C0FAB6F17F79604340DF32B65CA98A58C0B63EF0227B604340C376046EA98A58C0502FE6C57C604340D872977FA98A58C083D4D7687E6043401C276F91A98A58C095E2C00B80604340AF808AA3A98A58C07D7FA3AE816043407892EAB5A98A58C006AB7F51836043406A5C8FC8A98A58C0963F53F48460434093DE78DBA98A58C0203D1E9786604340EB18A7EEA98A58C066C9E2398860434092F81802AA8A58C098BE9EDC896043406990CF15AA8A58C0A242547F8B60434070E0CA29AA8A58C0892F01228D604340CCD5093EAA8A58C07985A5C48E60434032968E52AA8A58C0166A436790604340EEFB5667AA8A58C0EC91D60992604340F806637CAA8A58C08B4863AC9360434013DDB491AA8A58C02468E74E9560434084584AA7AA8A58C0E8CA60F1966043401E8C24BDAA8A58C067BCD393986043400D6542D3AA8A58C02DF13B369A6043400609A6E9AA8A58C0A1B49DD89B6043405B524D00AB8A58C04DBBF47A9D604340F2403817AB8A58C0F32A431D9F604340A7FA682EAB8A58C0930389BFA0604340A359DD45AB8A58C06B1FC461A2604340D770965DAB8A58C03EA4F603A4604340592D9375AB8A58C0496C1EA6A560434004A2D48DAB8A58C04E9D3D48A7604340E6CE5AA6AB8A58C08C1152EAA86043401DA124BFAB8A58C0C4EE5D8CAA6043407D2B33D8AB8A58C0350F5F2EAC604340146E86F1AB8A58C0CF7255D0AD604340F3551D0BAC8A58C0733F4372AF60434008F6F824AC8A58C0404F2614B16043404D4E193FAC8A58C054A2FEB5B2604340E04B7D59AC8A58C09338CC57B4604340AB012674AC8A58C018128FF9B5604340BD5C128FAC8A58C0D62E479BB7604340FF6F43AAAC8A58C0BE8EF43CB9604340783BB9C5AC8A58C0DF3197DEBA6043403FAC72E1AC8A58C047182F80BC60434036D570FDAC8A58C0D941BC21BE60434083A3B219AD8A58C0E2883CC3BF604340F9293936AD8A58C02313B264C16043409E680453AD8A58C09DE01C06C3604340994C1370AD8A58C09DCB7AA7C4604340E3D5658DAD8A58C0B8F9CD48C66043403D2AFEAAAD8A58C0674514EAC76043400611D9C8AD8A58C033D44F8BC960434005B0F8E6AD8A58C083807E2CCB6043402D075D05AE8A58C00C70A2CDCC604340AB030524AE8A58C00C7DB96ECE60434051B8F142AE8A58C075A7C30FD060434054122262AE8A58C064EFC0B0D160434080249781AE8A58C08B7AB351D3604340FBDB4FA1AE8A58C059FD96F2D4604340A54B4DC1AE8A58C06EC36F93D6604340A5608EE1AE8A58C038813934D8604340D52D1402AF8A58C02D82F8D4D960434054A0DD22AF8A58C0E67AA875DB60434022B8EA43AF8A58C0C9B64D16DD6043401F883C65AF8A58C062EAE3B6DE6043404C10D386AF8A58C0723B6D57E0604340CF3DADA8AF8A58C03784E7F7E1604340A110CBCAAF8A58C082EA5498E3604340C1882CEDAF8A58C0356EB538E56043400AB9D20FB08A58C0600F09D9E66043408AA1BD32B08A58C040A84D79E8604340602FEC55B08A58C0D6388319EA6043407E625E79B08A58C0E3E6ABB9EB604340F13A149DB08A58C0A58CC559ED60434094CB0EC1B08A58C01D2AD0F9EE60434067144EE5B08A58C0FEE4CD99F0604340A8EFCF09B18A58C0A397BC39F26043401983962EB18A58C0FD419CD9F3604340D8BBA053B18A58C0FFE36C79F5604340CEACEF78B18A58C0C47D2E19F76043401343829EB18A58C0F234E3B8F8604340A77E58C4B18A58C023BE8658FA6043408A5F72EAB18A58C0FB3E1BF8FB6043409CF8D010B28A58C097B7A097FD604340FE367337B28A58C0DA271737FF604340B51A595EB28A58C0116A7CD60061434094B68385B28A58C00CA4D27502614340CAF7F1ACB28A58C0A1D51915046143404FDEA3D4B28A58C007FF51B405614340226A99FCB28A58C053FA785307614340459BD224B38A58C055ED90F2086143409E84504DB38A58C04BB297910A6143403E131276B38A58C035498D300C6143403547179FB38A58C0D4D773CF0D6143407B2060C8B38A58C05A38496E0F614340109FECF1B38A58C0A3900F0D11614340D4D5BD1BB48A58C01F95C2AB12614340EEB1D245B48A58C04291664A146143406F202A70B48A58C0675FF9E8156143402747C69AB48A58C081FF7A87176143402E13A6C5B48A58C08171EB25196143405D97CAF0B48A58C082B54AC41A61434001AE311CB58A58C06ACB98621C614340FC69DC47B58A58C054B3D5001E6143401FDECB73B58A58C06247FF9E1F614340B0E4FD9FB58A58C026D3193D216143407FA374CCB58A58C01D0B21DB22614340AEF42DF9B58A58C0161517792461434013FE2B26B68A58C033CBF91626614340E7996C53B68A58C04553CBB427614340F2EDF180B68A58C04AAD8B522961434044E7BAAEB68A58C082B338F02A6143400B73C6DCB68A58C0ED65D28D2C61434002B7160BB78A58C03EEA5A2B2E61434048A0AA39B78A58C0CF1AD0C82F614340FC1B8168B78A58C093F7316631614340E04F9C97B78A58C03DA68203336143403216FAC6B78A58C02801C0A034614340BA949CF6B78A58C04608EA3D36614340B1A58126B88A58C087BB00DB37614340F75BAA56B88A58C00A1B0478396143408BB71687B88A58C0B126F4143B6143406EB8C6B7B88A58C08BDED0B13C614340A05EBAE8B88A58C0A5429A4E3E61434029AAF119B98A58C0232D4EEB3F61434018886B4BB98A58C094E9F087416143403E1E2A7DB98A58C0772C7E2443614340D2462BAFB98A58C09A1BF8C044614340B41470E1B98A58C020915C5D46614340E687F813BA8A58C09BD8AFF9476143408D8DC346BA8A58C0B780EB95496143405D4BD379BA8A58C013D513324B614340A19B25ADBA8A58C0A3D528CE4C6143402E91BBE0BA8A58C0A35C286A4E61434030199414BB8A58C0076A1206506143408046B048BB8A58C0AB23E9A151614340082C117DBB8A58C0C063AA3D536143401591B3B1BB8A58C0382A56D95461434059AE9AE6BB8A58C03077EC74566143400C5EC41BBC8A58C08A4A6D10586143400DB33151BC8A58C025CADAAB59614340769AE186BC8A58C062AA30475B6143403427D5BCBC8A58C0D13673E25C61434048590CF3BC8A58C0FE239E7D5E614340CB1D8629BD8A58C08F97B3186061434095874360BD8A58C09091B3B361614340B5964497BD8A58C041EC9B4E63614340433888CEBD8A58C024F370E964614340406C0E06BE8A58C0B75A2E84666143406C58D93DBE8A58C0FA22D41E6861434025C4E575BE8A58C06F9766B96961434016E836AEBE8A58C0D346DF536B614340938BC9E6BE8A58C0A77C42EE6C61434040E7A01FBF8A58C0DF3890886E6143407BC2B958BF8A58C0D455C62270614340DE551792BF8A58C079D3E4BC71614340DD68B6CBBF8A58C081D7ED56736143402A219905C08A58C08516DDF074614340BF7EBF3FC08A58C0ECDBB68A76614340CA6E287AC08A58C003027924786143403CF1D3B4C08A58C0D88823BE796143400319C3EFC08A58C04E70B6577B61434040D3F42AC18A58C035DE33F17C614340E41F6966C18A58C00A87978A7E614340D61121A2C18A58C0CE6AE123806143403E961BDEC18A58C003D515BD81614340F5BF591AC28A58C0E79F3256836143401A7CDA56C28A58C0B9A535EF84614340ADCA9D93C28A58C03B0C218886614340AEABA3D0C28A58C0ABADF220886143400532ED0DC38A58C0CBAFACB989614340E337784BC38A58C08D124F528B6143400FE34689C38A58C04AB0D7EA8C614340983359C7C38A58C0B7AE48838E614340A103AD05C48A58C043C29D1B9061434006794444C48A58C04E5CDDB391614340CC801E83C48A58C0770B014C936143400E1B3BC2C48A58C0511B0DE494614340BE479A01C58A58C01866FF7B96614340D5063C41C58A58C0DBEBD7139861434061582081C58A58C07FAC96AB996143403C4F48C1C58A58C0D2CD3D439B614340A5C5B101C68A58C05204C9DA9C61434063E15E42C68A58C0C0753A729E614340A87C4D83C68A58C01C229209A061434043BD7FC4C68A58C06609D0A0A16143404590F405C78A58C09F2BF437A3614340BCF5AB47C78A58C0C588FECEA4614340C0DAA489C78A58C019FBEC65A66143401B65E1CBC78A58C05AA8C1FCA7614340D581600EC88A58C0BA6A7A93A96143402B1E2151C88A58C00868192AAB614340D05F2594C88A58C052A09EC0AC61434002216BD7C88A58C0BBED0757AE6143409B74F31AC98A58C0207657EDAF614340A95ABE5EC98A58C0E2ED8883B16143402DD3CBA2C98A58C054C6A219B361434018DE1BE7C98A58C03F8E9EAFB4614340717BAE2BCA8A58C00A918045B66143403FAB8370CA8A58C0408344DBB7614340935A9AB5CA8A58C065B0EE70B96143405C9CF3FACA8A58C0B6F27C06BB6143409B708F40CB8A58C0344AEF9BBC61434060C46C86CB8A58C0DEB64531BE61434074BD8DCCCB8A58C0A73880C6BF6143401636F012CC8A58C0ABCF9E5BC16143402C419559CC8A58C0DB7BA1F0C2614340D0CB7BA0CC8A58C068178685C4614340E2E8A4E7CC8A58C0F2ED501AC66143406298102FCD8A58C0258EFBAEC761434070C7BD76CD8A58C038698C43C9614340EC88ADBECD8A58C0B733FFD7CA614340DDDCDF06CE8A58C07013566CCC6143405BB0534FCE8A58C086E28E00CE61434047160A98CE8A58C0C9C6AB94CF614340BAFB01E1CE8A58C0789AAA28D1614340A9733C2ACF8A58C0915D8BBCD2614340186BB873CF8A58C0D7355050D461434002F576BDCF8A58C088FDF6E3D561434073FE7607D08A58C0A4B47F77D7614340599AB951D08A58C02C5BEA0AD9614340CDB53D9CD08A58C01EF1369EDA614340AE6304E7D08A58C03E9C6731DC6143401D910C32D18A58C0F81078C4DD6143401A3E567DD18A58C0EE9A6C57DF614340847DE2C8D18A58C08DEE40EAE0614340833CB014D28A58C08A31F77CE2614340097BBF60D28A58C0F1638F0FE4614340034C11ADD28A58C0D28509A2E56143408B9CA4F9D28A58C010976534E7614340A06C7946D38A58C0F771A1C6E86143402BCF9093D38A58C0583CBF58EA6143403CB1E9E0D38A58C046D0BCEAEB614340E112842ED48A58C0BC539C7CED6143400DF45F7CD48A58C08EC65D0EEF614340AD677ECAD48A58C00B03FF9FF0614340FB47DD18D58A58C031098031F2614340B7BA7E67D58A58C0C2FEE2C2F361434000AD61B6D58A58C0EFBD2554F5614340DD1E8605D68A58C0D34648E5F66143404110EC54D68A58C061994A76F8614340398193A4D68A58C04DDB2E07FA614340B8717CF4D68A58C02EC1F097FB614340ABF4A744D78A58C06D969428FD61434053E41395D78A58C0553518B9FE6143408153C1E5D78A58C0F59D7B49006243401C55B136D88A58C070AABCD9016243406CC3E187D88A58C055A6DF690362434042B153D9D88A58C03046E0F904624340AC1E072BD98A58C09AAFC089066243409D0BFC7CD98A58C0C9E28019086243402A7832CFD98A58C0D2B91EA9096243403C64AA21DA8A58C0845A9C380B624340FBBC6274DA8A58C0D3C4F9C70C62434030A85DC7DA8A58C017D334570E6243401100991ADB8A58C006AB4FE60F62434078D7156EDB8A58C0DC26487511624340742ED4C1DB8A58C09B461E0413624340FD04D415DC8A58C0F52FD492146243403A48146ADC8A58C037BD672116624340F70A96BEDC8A58C03214DBAF176243406E3A5813DD8A58C044E9293E1962434053FC5C68DD8A58C0018858CC1A624340DD2AA2BDDD8A58C0B4CA645A1C6243401CC62713DE8A58C040B14EE81D624340E8E0EE68DE8A58C0B53B16761F624340417BF7BEDE8A58C05144B903216243402F954115DF8A58C097163C9122624340C21BCC6BDF8A58C0C48C9C1E24624340020F97C2DF8A58C01981D8AB25624340D681A319E08A58C05519F238276243405761F070E08A58C06C55E9C52862434066C07EC8E08A58C07835BE522A624340218C4D20E18A58C0AC936EDF2B62434070D75D78E18A58C0BA95FC6B2D624340658FAED0E18A58C0EE1566F82E624340EFC64029E28A58C0193AAD84306243401E6B1382E28A58C01D02D21032624340017C26DBE28A58C08722D09C3362434090F97934E38A58C0E8E6AB2835624340ADF60E8EE38A58C0224F65B4366243407760E4E7E38A58C0C10FF83F38624340D449FB41E48A58C0497468CB39624340F78C519CE48A58C0F856B4563B624340A84FE9F6E48A58C0CDB7DBE13C624340127FC151E58A58C0C896DE6C3E624340231BDAACE58A58C0DDF3BCF73F624340D9233308E68A58C034CF7682416243402BACCD63E68A58C096280C0D43624340418EA7BFE68A58C01F007D9744624340E5EFC21BE78A58C0DC55C921466243405CAB1D78E78A58C0F003EFAB4762434060E6B9D4E78A58C0FB55F23549624340118E9631E88A58C05D00CFBF4A6243408E8FB28EE88A58C0240385494C624340981010ECE88A58C0128416D34D6243404FFEAD49E98A58C03483835C4F624340D2458BA7E98A58C0AEDAC9E55062434008FAA805EA8A58C04EB0EB6E52624340CC2D0864EA8A58C054DEE6F7536243405CBBA6C2EA8A58C0BE64BB805562434091B58521EB8A58C050696B09576243407A1CA580EB8A58C038C6F491586243402FDD03E0EB8A58C0947B571A5A624340791DA43FEC8A58C009AF95A25B6243408EB7839FEC8A58C02F15AB2A5D62434049BEA3FFEC8A58C06EF99BB25E624340D71E0360ED8A58C05F10643A6062434011ECA2C0ED8A58C068A507C261624340F8258321EE8A58C0236D8249636243408CCCA382EE8A58C0F7B2D8D064624340F3CC03E4EE8A58C06F2B0658666243401E27A345EF8A58C04BFC0CDF67624340D70084A7EF8A58C08D25ED65696243408321A309F08A58C07381A4EC6A624340BBC1036CF08A58C07F5B37736C624340DFA8A2CEF08A58C06E429FF96D624340900F8331F18A58C083A7E27F6F6243402CBDA194F18A58C02E3FFD05716243407CD700F8F18A58C08A09EF8B72624340725EA05BF28A58C03E2CBA11746243403B3F7FBFF28A58C0A4815C9775624340CF799D23F38A58C09F09D61C776243401021FC87F38A58C00EEA28A2786243403C0F99ECF38A58C012FD52277A624340F67C7751F48A58C0BA4254AC7B6243409B3194B6F48A58C006BB2C317D624340F352F11BF58A58C0C48BDEB57E62434030BB8C81F58A58C05869653A80624340209068E7F58A58C0509FC5BE81624340BDD1844DF68A58C02AE2FA42836243403F5ADFB3F68A58C09B5707C7846243409A3C791AF78A58C07E25ED4A866243409A8B5381F78A58C04400A8CE8762434086216CE8F78A58C0AD0D3A52896243401F24C54FF88A58C0EB27A1D58A624340A96D5CB7F88A58C0DA74DF588C624340E123341FF98A58C05FF4F4DB8D624340E4334B87F98A58C088A6E15E8F624340D38AA0EFF98A58C0A165A3E1906243408D3B3558FA8A58C08E313A6492624340F4580AC1FA8A58C01F30A8E6936243404DBD1D2AFB8A58C0923BEB6895624340727B7093FB8A58C0A97905EB966243405C9302FDFB8A58C0A2C4F46C9862434038F2D266FC8A58C07E1CB9EE99624340C1BDE3D0FC8A58C0FDA654709B62434035D0323BFD8A58C09C18C3F19C6243409429C0A5FD8A58C0D2BC08739E624340A7EF8D10FE8A58C0F86D23F49F6243409EFC997BFE8A58C0F22B1375A16243406163E5E6FE8A58C0DCF6D7F5A262434016116F52FF8A58C0A8CE7176A4624340971838BEFF8A58C049B3E0F6A5624340E479402A008B58C00A7F2277A76243401C228796008B58C06F7D3BF7A86243403F110C03018B58C0F5622777AA624340355AD06F018B58C05D55E8F6AB624340F0FCD3DC018B58C0E62E7C76AD6243409DE6154A028B58C05F15E5F5AE624340361796B7028B58C09E082375B06243409AA15525038B58C00CE333F4B1624340EA725393038B58C05DCA1973B3624340059E9001048B58C0C098D2F1B46243402BFD0A70048B58C013746070B662434023B6C4DE048B58C08736C1EEB762434000B6BC4D058B58C00DE0F46CB9624340B00FF4BC058B58C07696FDEABA6243404BB0692C068B58C00E34D968BC624340F0841C9C068B58C0F79285E6BD62434062B30E0C078B58C084240964BF624340BE283F7C078B58C07D775DE1C0624340E6F7AEEC078B58C08AB1845EC262434020FB5B5D088B58C0A9D27EDBC36243403E4547CE088B58C006DB4B58C56243404ED6703F098B58C066CAEBD4C66243402AC1D9B0098B58C0F6A05E51C862434011E07F220A8B58C0E538A2CDC9624340E24564940A8B58C0A8DDBA49CB6243409FF286060B8B58C0D843A4C5CC62434047E6E7780B8B58C01B916041CE624340E12087EB0B8B58C0CB9FEDBCCF6243407F8F635E0C8B58C08E954D38D16243400E457ED10C8B58C0B14C7EB3D26243406A54D8440D8B58C002EB812ED4624340EF846EB80D8B58C0657058A9D5624340400F442C0E8B58C028B7FF23D76243409CCD56A00E8B58C04BBF779ED8624340EAD2A7140F8B58C0CC88C018DA6243401C1F37890F8B58C06E39DC92DB6243405F9F03FE0F8B58C070ABC80CDD62434087660E73108B58C0D1DE8586DE624340C06156E8108B58C083D31300E0624340E4A3DC5D118B58C063AF7479E1624340121AA0D3118B58C0D426A4F2E26243404BC4A049128B58C0A45FA46BE462434057C8E0BF128B58C0A27F77E4E562434086ED5C36138B58C0303B195DE7624340A65917AD138B58C01EB88BD5E8624340CBF90E24148B58C079F6CE4DEA624340E1E0449B148B58C025F6E2C5EB62434002FCB712158B58C06091C53DED6243402D4B688A158B58C018EE78B5EE6243406ACE5502168B58C0120CFD2CF06243408A98817A168B58C0B8C54FA4F1624340B596EAF2168B58C0BD40731BF362434011B68F6B178B58C060576592F4624340581C73E4178B58C0542F2809F66243408BC9945D188B58C0F5A2B97FF7624340DF97F2D6188B58C024B219F6F8624340469A8D50198B58C0C1824A6CFA624340BDD065CA198B58C0EEEE49E2FB624340393B7B441A8B58C07A1C1A58FD624340C5D9CDBE1A8B58C0E3BFB6CDFE62434055AC5D391B8B58C0AA24244300634340F7B22AB41B8B58C05CFF5DB801634340A2ED342F1C8B58C0519B682D03634340525C7CAA1C8B58C0F2D241A20463434039ECFF251D8B58C031A6E9160663434023B0C0A11D8B58C00D15608B0763434018A8BE1D1E8B58C0C6F9A2FF086343401ED4F9991E8B58C00F7AB4730A634340472171161F8B58C0B6BB96E70B63434081A225931F8B58C04873455B0D634340C6571710208B58C0A8A0C0CE0E6343402D2E458D208B58C0B5690A4210634340AD38B00A218B58C050CE22B51163434050645788218B58C08ACE092813634340FCC33B06228B58C0AE44BD9A14634340D3445C84228B58C0A0303D0D16634340BBF9B902238B58C022B88B7F17634340CDCF5381238B58C09CB5A6F11863434001C72900248B58C0984E90631A63434047F23C7F248B58C07E5D46D51B634340BE3E8CFE248B58C032E2C8461D63434030BF187E258B58C0D1DC17B81E634340DB60E1FD258B58C00E73352920634340C710E57D268B58C057591D9A21634340A60727FE268B58C03EDBD30A23634340C70CA47E278B58C00FD3567B2463434018335DFF278B58C0ED1AA4EB25634340748D5380288B58C069FEBF5B27634340F9088601298B58C0C157A8CB28634340C892F382298B58C034015B3B2A634340A0509E042A8B58C08320DAAA2B634340A32F85862A8B58C0AFB5251A2D634340F51CA7082B8B58C0B7C03D892E6343404B3E068B2B8B58C0D91B20F82F634340D180A10D2C8B58C0CAECCE6631634340A1D177902C8B58C0A5334AD5326343409A438A132D8B58C08DCA8F4334634340BDD6D8962D8B58C05FD7A1B135634340098B631A2E8B58C03E347E1F376343409E4D299E2E8B58C0F906278D3863434065312B222F8B58C0DD299AFA396343404D3669A62F8B58C0C09CD7673B634340675CE32A308B58C08D85E1D43C634340C99098AF308B58C0C198B3413E63434055E68934318B58C0C42152AE3F6343402A4AB6B9318B58C09520BD1A4163434022CF1E3F328B58C0CD49F086426343407062C2C4328B58C020C3EDF243634340E116A24A338B58C041B2B75E456343409CD9BCD0338B58C0CACB49CA46634340A6AA1257348B58C05F35A63548634340DA9CA4DD348B58C0D014CFA049634340569D7164358B58C0A91EC00B4B634340FDBE7AEB358B58C08F787B764C634340ECEEBE72368B58C0CEFCFEE04D634340242D3EFA368B58C0F7F64E4B4F634340A679F881378B58C05E1B67B55063434070D4ED09388B58C02C6A471F526343406A501F92388B58C0D62EF48853634340C6C78A1A398B58C018F866F254634340536032A3398B58C03637A65B566343402907152C3A8B58C0ADA0ADC45763434067A931B53A8B58C070347D2D59634340CE6C8A3E3B8B58C08CF214965A6343407F3E1EC83B8B58C0D10077FE5B6343409E0BEC513C8B58C0235FA3665D63434000E7F4DB3C8B58C01AC295CE5E6343408BE339663D8B58C01F755236606343408CDBB8F03D8B58C07C52D79D61634340E8CE717B3E8B58C0335A24056363434074E366063F8B58C0438C396C6463434069F395913F8B58C0ADE816D365634340A611001D408B58C0616FBC39676343402C3EA5A8408B58C07D202AA06863434022668434418B58C0F3FB5F066A634340599C9EC0418B58C0B3015E6C6B634340F9CDF24C428B58C01A0C22D26C634340E90D82D9428B58C09B66B0376E63434040494B66438B58C0A6C5049D6F634340E1924FF3438B58C00A4F210271634340EAD78D80448B58C006DD0367726343405B18060E458B58C05C95AECB736343401567B99B458B58C019782130756343403EB1A629468B58C0515F5A9476634340AA09CFB7468B58C0FF705BF877634340A34A3046478B58C02987225C79634340E699CCD4478B58C0F8A1AFBF7A63434089E4A263488B58C021E704237C6343409C2AB3F2488B58C0955622867D6343401E6CFD81498B58C0EDA403E97E634340E2BB82114A8B58C09F1DAD4B806343402EF440A14A8B58C019751AAE81634340E22739314B8B58C0ECF64F1083634340E5696CC14B8B58C027A34D72846343406994D8514C8B58C01C2E0FD4856343405DBA7EE24C8B58C0C5BD963587634340B1DB5E734D8B58C0F751E496886343407CF878044E8B58C0B3EAF7F789634340A710CD954E8B58C01688D1588B6343405B115A274F8B58C00F2A71B98C634340760D21B94F8B58C0E0AAD4198E634340FA04224B508B58C0FB55007A8F6343400CE55BDD508B58C0FBDFEFD99063434086C0CF6F518B58C0936EA5399263434069977D02528B58C0F3DB1E9993634340CB566495528B58C0EB4D5EF8946343409D118528538B58C07AC4635796634340F7B4DEBB538B58C0EE192DB697634340B953724F548B58C02B4EBA149963434009DB3EE3548B58C0FF860D739A634340DA4A4477558B58C09B9E24D19B63434012B6830B568B58C0DDBA012F9D634340DA09FC9F568B58C0F6B5A28C9E6343400259AE34578B58C0E58F07EA9F634340DF7D98C9578B58C06B6E3247A1634340179EBC5E588B58C0F9051FA4A2634340DCA619F4588B58C02CA2D100A46343402998AF89598B58C0281D485DA563434005727E1F5A8B58C0FA7682B9A6634340424787B55A8B58C0A2AF8015A863434026F2C74B5B8B58C02FC74271A9634340988541E25B8B58C084BDC8CCAA6343409101F4785C8B58C0ED6C1028AC6343400B66DF0F5D8B58C0E1201E83AD63434013B303A75D8B58C0F78DEDDDAE634340A3E8603E5E8B58C0E4D98038B0634340BA06F7D55E8B58C0A704D892B163434078FAC46D5F8B58C0400EF3ECB2634340C5D6CB05608B58C0E1D0CF46B4634340919B0B9E608B58C0657270A0B56343400C368336618B58C0F0CCD2F9B6634340E8CB34CF618B58C05206F952B863434090241D68628B58C0D6F8E0ABB9634340C0653E01638B58C023CA8C04BB634340788F989A638B58C08554FA5CBC634340D68E2A34648B58C0FB9729B5BD634340BC76F5CD648B58C03ABA1C0DBF6343404F34F867658B58C0AA95D164C063434063DA3302668B58C0202A48BCC16343403D43A69C668B58C05F9D8213C3634340A5945137678B58C0F1A37C6AC463434095CE35D2678B58C068893AC1C563434044CB506D688B58C0F327BA17C763434081B0A408698B58C0857FFB6DC8634340656B30A4698B58C06A6AFCC3C9634340EFFBF33F6A8B58C02634C119CB6343402762EFDB6A8B58C005B7476FCC634340FF9D22786B8B58C01BCD8DC4CD6343407EAF8D146C8B58C0619C9519CF634340AA9630B16C8B58C0A1245F6ED063434076530B4E6D8B58C00366EAC2D1634340F0E51DEB6D8B58C0B93A3517D3634340104E68886E8B58C045EE436BD4634340F778E9256F8B58C0550F10BFD5634340658CA3C36F8B58C04A0FA012D763434098629461708B58C0C27CED65D863434092FBBBFF708B58C01EC9FEB8D9634340137D1C9E718B58C0C0A8CF0BDB63434061C1B33C728B58C0B51B605EDC63434075C881DB728B58C0FD21B0B0DD6343400AB8887A738B58C05BE1C102DF6343408B57C519748B58C00B349354E0634340B2CC39B9748B58C0D13F26A6E16343408017E658758B58C0EADE78F7E26343401425C9F8758B58C086EB8848E46343406EF5E298768B58C046B15A99E56343406F9B3439778B58C0590AECE9E66343403604BDD9778B58C0B1F63C3AE8634340CA2F7C7A788B58C05C764D8AE96343401C1E721B798B58C02BAF1FDAEA6343401DE29FBC798B58C07D55AF29EC634340E368045E7A8B58C06169FC78ED6343408E9F9EFF7A8B58C05A360BC8EE634340E1AB70A17B8B58C0A696D916F0634340F97A79437C8B58C084646565F1634340D70CB9E57C8B58C0B6C5B0B3F26343409A4E2E887D8B58C03BBABB01F46343400B66DB2A7E8B58C0431C844FF56343403B40BFCD7E8B58C0AD110C9DF663434057CAD8707F8B58C05D9A53EAF763434033172914808B58C0AC905837F9634340DB26B0B7808B58C07FF41A84FA63434068E66C5B818B58C0B3EB9CD0FB6343409C7B61FF818B58C02D76DE1CFD634340D5AD8AA3828B58C06948DB68FE634340B4B5EB47838B58C0D6D399B4FF6343407F6D82EC838B58C0F7A613000164434029D54E91848B58C07A0D4D4B0264434098FF5136858B58C0CDBB419603644340D5EC8BDB858B58C03523F8E0046443400F77FA80868B58C06DD2692B0664434016C49F26878B58C029EF987507644340E3D37BCC878B58C0857985BF08644340B4808C72888B58C0279731090A6443404CF0D318898B58C098FC98520B644340A92252BF898B58C0AACFBD9B0C6443400BF204668A8B58C03F10A0E40D6443405971ED0C8B8B58C066BE3F2D0F6443406DB30CB48B8B58C01FDA9C75106443407E92605B8C8B58C05C63B7BD116443405C34EB028D8B58C077348D05136443403873AAAA8D8B58C02573204D1464434000629F528E8B58C0641F7194156443408E13CBFA8E8B58C073137DDB1664434021622BA38F8B58C00675462218644340B84DC04B908B58C02B44CD68196443401BFC8BF4908B58C02F5B0FAF1A6443407D478C9D918B58C0F4B90CF51B644340C342C246928B58C04C86C73A1D644340EFED2DF0928B58C0749A3D801E6443402636CE99938B58C02E1C71C51F644340432EA443948B58C0B8E55F0A2164434064C3AEED948B58C013F7094F226443406A08EF97958B58C03E506F932364434075EA6342968B58C0FB1692D724644340647C0EED968B58C07A25701B266443407898EC97978B58C01656075F2764434051770143988B58C036F45BA2286443404FE049EE988B58C026DA6BE52964434038F9C799998B58C0F50737282B64434026AF7A459A8B58C0867DBD6A2C644340110262F19A8B58C0E73AFFAC2D64434008F27D9D9B8B58C01940FCEE2E644340047FCE499C8B58C01B8DB4303064434003A953F69C8B58C02CFC25723164434001700DA39D8B58C00DB352B332644340F1E6FC4F9E8B58C0BFB13AF433644340FEE71FFD9E8B58C033F8DD3435644340108677AA9F8B58C0C4603A753664434045AE0258A08B58C0181152B5376443406786C305A18B58C03B0925F538644340A5E8B7B3A18B58C07C23B1343A644340EFE7E061A28B58C0BD5FF6733B6443405D713D10A38B58C0CFE3F6B23C644340AFAACFBEA38B58C0B1AFB2F13D644340455B946DA48B58C0E17725303F644340C0BB8E1CA58B58C0A3AD556E406443407E93BBCBA58B58C0B1DF3CAC4164434040081D7BA68B58C09159DFE9426443400E1AB32AA78B58C07FF53A2744644340F9B57CDAA78B58C06EB34F64456443400EDC798AA88B58C06B931DA146644340219FAB3AA98B58C048BBA6DD4764434057EC10EBA98B58C063DFE61949644340D8B0A89BAA8B58C04F4BE2554A6443403D25764CAB8B58C04AD996914B644340E61076FDAB8B58C0926302CD4C644340B286A9AEAC8B58C0B93529084E644340A9861060AD8B58C0110407434F6443409E23AC11AE8B58C086F49D7D50644340D5377AC3AE8B58C0CB2CF0B75164434031D67B75AF8B58C09C3BF7F152644340B7FEB027B08B58C03092B92B5464434059B119DAB08B58C01FE532655564434046DBB48CB18B58C00E5A659E56644340568F833FB28B58C00DF150D75764434084CD85F2B28B58C05984F30F59644340DB95BBA5B38B58C0C2394F485A6443407DD52359B48B58C02C1164805B6443403C9FBF0CB58B58C021BF2DB85C6443403DE08DC0B58B58C0E8B4B2EF5D64434063AB8F74B68B58C03A81EC265F644340CBEDC328B78B58C08C6FDF5D606443407DA72ADDB78B58C0FC7F8B946164434053EBC491B88B58C0B98CEECA6264434065A69146B98B58C0F46F060164644340A2EB91FBB98B58C00E9BD936656443403A95C3B0BA8B58C0A59C616C66644340FCC82866BB8B58C04BC0A2A1676443400274C01BBC8B58C07DBA98D66864434051968AD1BC8B58C0CCD6470B6A644340DD2F8787BD8B58C04CEFAD3F6B644340AB40B63DBE8B58C02804CB736C644340BDC817F4BE8B58C090EF9CA76D64434018C8ABAABF8B58C006FD27DB6E644340CF2B7161C08B58C009E1670E70644340AA196A18C18B58C00CE7604171644340ED6B94CFC18B58C09BC30E74726443407435F186C28B58C0869C73A6736443403E76803EC38B58C0B0718FD874644340691B41F6C38B58C0731D600A76644340D83734AEC48B58C038EBE93B776443408ACB5966C58B58C0C769266D786443409EC3B01EC68B58C0570A1C9E79644340142039D7C68B58C08F81C6CE7A644340D5F3F38FC78B58C045CF25FF7B644340D13EE148C88B58C03A193C2F7D64434056DBFE01C98B58C08B5F095F7E6443401EEF4EBBC98B58C0597C8B8E7F644340217AD174CA8B58C0C26FC2BD80644340AD56842ECB8B58C0A839AEEC816443407DAA69E8CB8B58C0EAFF501B83644340CD4F7FA2CC8B58C06BC2AA4984644340616CC75CCD8B58C0B635B7778564434057ED4017CE8B58C04FA57AA586644340AFD2EBD1CE8B58C0B3C5F0D2876443408909C78CCF8B58C063E21D0089644340ACB7D447D08B58C0A0D5FF2C8A6443404AB71203D18B58C0699F96598B644340322E83BED18B58C0AF3FE2858C64434095F6237AD28B58C051DCE4B18D6443408010F535D38B58C0AF299ADD8E644340AEA1F8F1D38B58C0994D0409906443405E842CAED48B58C05C2221349164434088B8906AD58B58C05DF3F45E926443401B512627D68B58C0EB9A7D8993644340174EEDE3D68B58C043F3B8B3946443408E9CE4A0D78B58C02822A9DD95644340674F0D5ED88B58C098274E0797644340E840651BD98B58C0D2DDA53098644340A5A9EFD8D98B58C08A6AB259996443400351A996DA8B58C0DDCD73829A644340CA5C9454DB8B58C0F9E1E7AA9B64434032A7AE12DC8B58C0D2A60ED39C644340FC55FAD0DC8B58C00768ECFA9D6443404056768FDD8B58C036B47A229F6443400DA8224EDE8B58C0F1D6BD49A06443405B4BFF0CDF8B58C039D0B570A16443402B400CCCDF8B58C0587A6097A26443407C86498BE08B58C026D5BDBDA36443404F1EB74AE18B58C0CDE0CDE3A4644340AB07550AE28B58C0FFC29209A6644340A02F22CAE28B58C02C30082FA76443401DA91F8AE38B58C0F3733254A864434015744D4AE48B58C0478E1179A9644340B57DAA0AE58B58C09433A19DAA644340CFD837CBE58B58C0BB89E3C1AB6443409872F48BE68B58C09E90D8E5AC644340D55DE14CE78B58C00C6E8209AE6443409A9AFE0DE88B58C084D6DC2CAF64434000164BCFE88B58C0C6EFE94FB064434006D0C690E98B58C094DFAB72B1644340B5C87152EA8B58C0A9341C95B2644340DD124D14EB8B58C04B6041B7B3644340A79B57D6EB8B58C0A83C19D9B464434011639198EC8B58C01DA4A1FAB56443402369FA5AED8B58C04EBCDC1BB7644340CFAD921DEE8B58C05785CA3CB864434003445BE0EE8B58C01DFF6A5DB9644340F70552A3EF8B58C0FA03BC7DBA64434085067866F08B58C0D293BD9DBB644340C245CD29F18B58C074D471BDBC64434092C351EDF18B58C0E0C5D8DCBD644340108005B1F28B58C04842F0FBBE644340217BE874F38B58C0966FBA1AC0644340F9A1F938F48B58C0D1273539C164434078073AFDF48B58C0226B6057C2644340B198A8C1F58B58C0305F3E75C364434092684686F68B58C055DECC92C46443400C77134BF78B58C083E80BB0C564434046B10E10F88B58C06EA3FDCCC6644340471738D5F88B58C061E99FE9C7644340E2BB909AF98B58C05DBAF205C96443404B8C1760FA8B58C06316F621CA6443404E9BCD25FB8B58C071FDA93DCB64434029C3B0EBFB8B58C0886F0E59CC644340AC29C3B1FC8B58C0A86C2374CD644340EEBB0378FD8B58C0841AEB8ECE644340F179723EFE8B58C0B62D61A9CF644340B4630F05FF8B58C0F1CB87C3D06443403E79DACBFF8B58C026F55EDDD164434080BAD392008C58C073A9E6F6D26443408A27FB59018C58C0BAE81E10D46443404DC05021028C58C00BB30729D5644340D784D4E8028C58C0A2E29E41D6644340396285B0038C58C0439DE659D7644340626B6478048C58C0EDE2DE71D86443404BA07140058C58C0DE8D8589D964434013EEAB08068C58C0D8C3DCA0DA6443409B6714D1068C58C0CD84E4B7DB644340E30CAB99078C58C018AB9ACEDC6443400BCB6E62088C58C05D5C01E5DD64434012A25F2B098C58C0B99818FBDE644340D8A47EF4098C58C08D14DC10E06443407FC0CABD0A8C58C03A415226E16443400BF543870B8C58C05FAD743BE26443405055EB500C8C58C08CA44750E36443409BBBBE1A0D8C58C00101C964E46443409F4DC0E40D8C58C07FE8FA78E564434089F8EEAE0E8C58C04435DB8CE664434052BC4A790F8C58C043E769A0E7644340F498D343108C58C097FEA6B3E86443407C8E890E118C58C0F4A094C6E9644340E39C6CD9118C58C08BA830D9EA64434029C47CA4128C58C0A7EF78EBEB6443406EF1B86F138C58C0CDC171FDEC6443409237223B148C58C047F9180FEE6443409696B806158C58C0FC956E20EF6443407F0E7CD2158C58C0F7977231F0644340608C6B9E168C58C079D92242F16443402123886A178C58C004A68352F2644340E7BFD036188C58C0D6D79262F364434085754603198C58C02E494E72F46443402931E8CF198C58C0BF1FB881F5644340CBF2B59C1A8C58C0985BD090F664434045CDB0691B8C58C0C6FC969FF7644340CCADD7361C8C58C02E030CAEF864434025A72B041D8C58C01B492DBCF9644340A293AAD11D8C58C051F4FCC9FA644340FE98569F1E8C58C01ADF78D7FB64434078912D6D1F8C58C00E2FA3E4FC644340D1A2313B208C58C0A5BE79F1FD64434048A76009218C58C028D900FEFE6443409FC4BCD7218C58C07E0D320A006543401AD543A6228C58C01BA711160165434093EBF674238C58C0F2A59F21026543400508D643248C58C09BBED72C036543407B2AE112258C58C03F62C03704654340E95218E2258C58C0A71F5342056543407C6E7AB1268C58C06542944C06654340267D0781278C58C09BA4815607654340D591C050288C58C049461B600865434083ACA520298C58C05A4D6369096543404FBAB5F0298C58C0E49357720A65434038BBF0C02A8C58C023F4F57A0B65434020C257912B8C58C0B8B942830C65434025BCE9612C8C58C0D4BE3B8B0D6543404FA9A6322D8C58C06703E1920E65434091898E032E8C58C08E87329A0F654340D06FA2D42E8C58C0EE7032A1106543404D36E0A52F8C58C01374DCA711654340CF024A77308C58C0FC9030AE1265434068C2DE48318C58C02D1333B41365434045629D1A328C58C0E4D4E1B9146543403FF586EC328C58C05FB03ABF15654340328E9CBE338C58C021F141C4166543406807DC90348C58C0A94BF3C817654340DB604563358C58C0B6E550CD186543404DC0DA35368C58C0799958D119654340FCFF9908378C58C0D18C0CD51A654340E11F83DB378C58C0A0BF6CD81B654340F13297AE388C58C0340C77DB1C6543401939D681398C58C05C982DDE1D6543407D1F3F553A8C58C0FB6390E01E6543401EE6D1283B8C58C05F499DE21F654340DE9F8FFC3B8C58C0884854E420654340E13977D03C8C58C02987B7E5216543401AB488A43D8C58C05D05C7E6226543407821C5783E8C58C0569D80E7236543402B5C2A4D3F8C58C0064FE4E724654340038ABA21408C58C0881AF2E725654340388573F6408C58C09025ACE7266543408A7357CB418C58C04E4A10E727654340382F64A0428C58C0D1881EE628654340FEDD9B75438C58C0D906D9E429654340265AFC4A448C58C0E5783BE32A6543408BB68620458C58C0772A4AE12B6543404DE039F6458C58C0CDF502DF2C6543402DFD17CC468C58C0E7DA65DC2D65434070E71EA2478C58C0B8D972D92E654340089F4E78488C58C05CF229D62F654340DD36A84E498C58C0C4248BD230654340EFAE2B254A8C58C0B29698CE3165434084E1D6FB4A8C58C095FC4DCA326543402F07ADD24B8C58C07A56ABC5336543405DE7AAA94C8C58C0E6EFB4C034654340C1A7D2804D8C58C016A368BB35654340883523584E8C58C04A4AC4B536654340A5909C2F4F8C58C0410BCAAF3765434025B93E07508C58C0FEE579A938654340E2C10ADF508C58C07EDAD3A2396543401A85FEB6518C58C0C3E8D79B3A654340AF151B8F528C58C0FDEA83943B654340A0736067538C58C03AE1D78C3C654340ED9ECE3F548C58C00B17D8843D65434096976518558C58C0D140807C3E654340BB4A24F1558C58C09A5ED0733F6543401EDE0CCA568C58C02796CA6A406543401A191CA3578C58C0B8C16C61416543405B34557C588C58C01A07B95742654340110AB655598C58C02666AF4D43654340499A3E2F5A8C58C080934B4344654340D6F7EF085B8C58C06100943845654340E60FC9E25B8C58C0753B822D466543404BF5CABC5C8C58C05C901A22476543403395F4965D8C58C037D95A164865434096EF45715E8C58C02416430A496543406D04BF4B5F8C58C0C76CD5FD49654340C8D35F26608C58C0AB910DF14A6543407E702901618C58C054D0EFE34B654340CFB419DC618C58C000037AD64C6543409CB331B7628C58C0714FAEC84D654340C57F7292638C58C0236A88BA4E65434089F3D96D648C58C0D7780AAC4F654340C9216949658C58C0817B349D50654340AAF71E25668C58C0FD97088E51654340D99AFD00678C58C0AD82827E52654340B2E502DD678C58C06E61A46E536543401ED82EB9688C58C024346E5E546543400D858295698C58C0DCFADF4D5565434070ECFD716A8C58C098B5F93C5665434075FB9F4E6B8C58C05764BB2B57654340EEC4692B6C8C58C057E1221A58654340292359086D8C58C05A52320859654340D83B70E56D8C58C060B7E9F559654340090FAFC26E8C58C05B1049E35A654340F57613A06F8C58C0A5374ED05B6543405C999F7D708C58C0E552FBBC5C6543407750515B718C58C0356250A95D6543401AC22A39728C58C0B93F4B955E65434052DB2A17738C58C04011EE805F654340448950F5738C58C008B1366C60654340B1F19DD3748C58C0D344275761654340D8EE10B2758C58C0E0A6BD41626543409A93AA90768C58C0F0FCFB2B6365434016CD696F778C58C04121E015646543400EC1504E788C58C096396CFF64654340E6365C2D798C58C01D209EE86565434032678F0C7A8C58C0F5D475D166654340402CE8EB7A8C58C0C17DF5B967654340008666CB7B8C58C0CEF41AA26865434062870BAB7C8C58C02B3AE68969654340781DD68A7D8C58C0BC4D57716A6543404E48C66A7E8C58C0505570586B654340D807DC4A7F8C58C0252B2F3F6C654340036F182B808C58C02DCF93256D654340E86A7A0B818C58C085419E0B6E65434081FB01EC818C58C01F824EF16E654340000EAECC828C58C0FA90A4D66F6543400DC880AD838C58C0086EA0BB70654340DA16798E848C58C0283F44A07165434081E7956F858C58C0B9B88B8472654340C35FD950868C58C09A00796873654340DD594132878C58C0AF160C4C74654340D9D5CD13888C58C0F6FA442F7565434068F980F5888C58C09CAD231276654340D09E58D7898C58C0752EA8F47665434012C654B98A8C58C08F7DD2D6776543401482769B8B8C58C01B75A0B878654340E9BFBC7D8C8C58C0F73A149A79654340789228608D8C58C007CF2D7B7A654340E8E6B8428E8C58C06531ED5B7B65434029BD6D258F8C58C0363C503C7C6543404B154708908C58C05615591C7D654340200246EB908C58C0AABC07FC7D654340F55D68CE918C58C07E0C5ADB7E654340834EB0B1928C58C0932A52BA7F6543400AAE1B95938C58C028F1ED988065434044A2AC78948C58C0FF852F77816543407E05615C958C58C048C314558265434072FD3A40968C58C0E0CE9F32836543405E643824978C58C0EA82CE0F84654340433A5908988C58C04405A3EC8465434001929EEC988C58C00F301BC985654340996B08D1998C58C02B2939A5866543400AC796B59A8C58C0F6A4F880876543407391489A9B8C58C0C514605C88654340DCCA1D7F9C8C58C05207693789654340178617649D8C58C020C817128A6543404BB034499E8C58C06F316AEC8A6543407749752E9F8C58C0304360C68B6543408464DA13A08C58C07EFDF99F8C65434082EE62F9A08C58C04D6037798D6543409FD40DDFA18C58C05D911A528E6543408F3CDDC4A28C58C0DF6AA12A8F6543407713D0AAA38C58C0E1ECCB02906543405E59E690A48C58C0A1F197DA906543403E0E2077A58C58C0A3C409B2916543402F1F7C5DA68C58C025401F89926543401F9FFB43A78C58C03664D85F93654340088E9E2AA88C58C0AA30353694654340E3EB6411A98C58C0ACA5350C95654340E3A54DF8A98C58C06C9DD7E195654340CECE59DFAA8C58C060631FB796654340D85388C6AB8C58C021AC088C97654340DA47DAADAC8C58C015C3976098654340F4974E95AD8C58C0C75CC834996543400757E67CAE8C58C046799A089A6543403172A064AF8C58C0F96312DC9A65434073E97C4CB08C58C069D12BAF9B654340CDBC7B34B18C58C05AE7E8819C6543403FEC9C1CB28C58C0CBA549549D654340C977E004B38C58C0FBE64B269E654340527247EDB38C58C0AAD0F1F79E6543400CB6CFD5B48C58C00A3D39C99F654340E4557ABEB58C58C0F851249AA0654340CD5147A7B68C58C0580FB36AA1654340CEA93690B78C58C0774FE33AA2654340E65D4879B88C58C01538B70AA36543403D5B7B62B98C58C080A32CDAA3654340CBA1CF4BBA8C58C05DB745A9A46543404A574735BB8C58C0F94D0078A56543400756E01EBC8C58C053675C46A6654340F59D9A08BD8C58C02D295C14A7654340014277F2BD8C58C0B76DFDE1A7654340442F75DCBE8C58C00E3540AFA8654340B86594C6BF8C58C0E5A4267CA965434069E5D4B0C08C58C06D97AE48AA65434033C1379BC18C58C0B20CD814AB65434033E6BB85C28C58C0862AA5E0AB6543406A546170C38C58C00BCB13ACAC654340D90B285BC48C58C04EEE2377AD65434097F90E46C58C58C04F94D541AE65434073431831C68C58C00FBD280CAF654340A6C3411CC78C58C08E681DD6AF654340F19F8D07C88C58C0CB96B39FB065434099B2F9F2C88C58C0886DED68B165434091FB85DEC98C58C034A1C631B2654340A0A034CACA8C58C0607D43FAB2654340256902B6CB8C58C097B65FC2B3654340C88DF2A1CC8C58C040981F8AB4654340D3D5018ECD8C58C0E6D67E51B56543402467327ACE8C58C04B987F18B6654340A4418466CF8C58C03D0224DFB66543407B52F652D08C58C011C967A5B7654340CE86873FD18C58C0EFEC4A6BB865434039173B2CD28C58C04EB9D130B965434013CB0D19D38C58C06B08FAF5B96543404AB50006D48C58C077B4C1BABA654340D0D513F3D48C58C042E32A7FBB654340B42C47E0D58C58C0D9943543BC654340E7B99ACDD68C58C05FA3DF06BD654340777D0EBBD78C58C0B2342BCABD6543407664A1A8D88C58C0B548188DBE654340B3945596D98C58C077DFA64FBF65434066E82884DA8C58C027D3D411C0654340875F1B72DB8C58C0F123A2D3C0654340050D2E60DC8C58C06BF71095C1654340DAF0604EDD8C58C0964D2156C265434044E5B13CDE8C58C0CB00D116C3654340E422242BDF8C58C0B23622D7C36543401371B419E08C58C095C91297C4654340A6F56408E18C58C045DFA456C5654340A79D34F7E18C58C0E351D615C66543401E6923E6E28C58C04147A9D4C6654340045831D5E38C58C0D9731993C76543404E7D5FC4E48C58C0F2482D51C865434025B3ABB3E58C58C04755DE0EC9654340730C17A3E68C58C059E430CCC96543403689A192E78C58C069D02289CA65434075294B82E88C58C02A3FB645CB6543403CDA1272E98C58C033E5E601CC65434086AEF961EA8C58C0EE0DB9BDCC6543403EA6FF51EB8C58C0A5932A79CD6543408BAE2342EC8C58C0299C3D34CE65434055DA6632ED8C58C0DBDBEDEECE654340AD16C822EE8C58C04B9E3FA9CF6543407A764813EF8C58C0F6972E63D0654340DDE6E603F08C58C06014BF1CD1654340DB67A3F4F08C58C0C7EDEED5D16543404E0C7FE5F18C58C01D24BE8ED26543406FAE77D6F28C58C07EB72C47D36543400C748FC7F38C58C0CEA73AFFD3654340374AC5B8F48C58C068CFE5B6D4654340171E18AAF58C58C0B279326ED565434072158A9BF68C58C007811E25D6654340631D1A8DF78C58C04BE5A9DBD66543400823C77EF88C58C0CB80D291D76543403A399270F98C58C0099F9C47D865434009607B62FA8C58C082F403FDD86543408B848154FB8C58C0F9A60AB2D96543409CB9A546FC8C58C06DB6B066DA65434048FFE738FD8C58C0CF22F61ADB654340A842472BFE8C58C06EC6D8CEDB654340BD83C31DFF8C58C017C75A82DC65434066D55D10008D58C0AF247C35DD654340BC241503018D58C053DF3CE8DD654340AE84EAF5018D58C023D19A9ADE65434074CFDBE8028D58C0F11F984CDF654340D52AEBDB038D58C0FBA532FEDF654340FC7016CF048D58C0C3AE6EAFE0654340BEC75FC2058D58C005C94560E1654340351CC6B5068D58C00566BE10E2654340865B48A9078D58C0333AD4C0E26543408498E79C088D58C0AA458770E365434010E6A490098D58C011AED91FE4654340950B7D840A8D58C0C14DC9CEE4654340B64173780B8D58C0604A587DE5654340A462856C0C8D58C03B7E842BE6654340656EB3600D8D58C0120F50D9E6654340C28AFF540E8D58C025D7B886E76543400B7F66490F8D58C036FCC033E86543400771EA3D108D58C0815866E0E8654340D74D8A32118D58C008ECA88CE965434081154627128D58C0BDB68838EA654340D9DA1E1C138D58C07DDE07E4EA654340038B1311148D58C06A3D248FEB65434028132306158D58C063F9DF39EC654340F9984FFB158D58C0C7C636E4EC6543409E0998F0168D58C028F12C8EED6543401D65FCE5178D58C0C552C037EE65434088987BDB188D58C09EEBF0E0EE654340CDB616D1198D58C0B1BBBE89EF654340DEBFCDC61A8D58C0D1E82B32F0654340CAB3A0BC1B8D58C04D2734DAF0654340A17F8EB21C8D58C0D6C2DB81F1654340533698A81D8D58C08B952029F2654340F7C4BC9E1E8D58C07C9F02D0F2654340683EFD941F8D58C0B7E08176F3654340CB8F588B208D58C06B339C1CF465434028B9CE81218D58C00FE355C2F465434058CD6078228D58C0EEC9AC67F56543407BB90D6F238D58C009E8A00CF66543408A7DD565248D58C05F3D32B1F66543409219B85C258D58C030A45E55F76543408C8DB553268D58C0FD672AF9F765434073D9CD4A278D58C0363D919CF865434072EAFF41288D58C0B949953FF965434044E64D39298D58C039B338E2F965434002BAB6302A8D58C063087584FA654340D95239282B8D58C099BA5026FB654340A3C3D61F2C8D58C0FCA3C9C7FB6543407EF98D172D8D58C0D99EDD68FC6543404C07600F2E8D58C0F2D08E09FD65434025DA4B072F8D58C0463ADDA9FD654340FE8452FF2F8D58C014B5C649FE654340C30774F7308D58C01E674DE9FE654340BA3CAEEF318D58C055507188FF654340A24903E8328D58C0144B302700664340961B72E0338D58C0C2A28EC500664340A3B2FAD8348D58C037E6856301664340C10E9DD1358D58C0D9601A0102664340F12F59CA368D58C0B7124C9E0266434033162FC3378D58C0DFFB1A3B0366434087C11EBC388D58C072F684D703664340F43128B5398D58C080028A73046643406C674BAE3A8D58C0C9452C0F05664340154F87A73B8D58C08C9A69AA05664340C8FBDCA03C8D58C07C26444506664340956D4C9A3D8D58C0F5C3B9DF066643409991D4933E8D58C0A998CC7907664340C867758D3F8D58C0C97E7A130866434009033087408D58C0259CC5AC086643405B630481418D58C009CBAB45096643400563F07A428D58C0580B2DDE09664340BA27F674438D58C0E4824B760A664340A09E146F448D58C028E6020E0B664340B6C74B69458D58C068A659A50B664340FFA29B63468D58C06252493C0C6643407F30045E478D58C08935D6D20C6643400A838658488D58C0382AFE680D66434004621F53498D58C06130C1FE0D6643401106D24D4A8D58C0F6471F940E664340565C9D484B8D58C0D5961A290F664340E45180434C8D58C05ED1AEBD0F664340A3F97B3E4D8D58C02343E05110664340B9408F394E8D58C061C6ACE510664340FA39BB344F8D58C01A5B1479116643406CE5FF2F508D58C00E27190C126643402E305C2B518D58C0BBDEB69E12664340471AD026528D58C0E2A7EF3013664340B1A35B22538D58C045A8C5C21366434045DFFF1D548D58C0529434541466434049A7BA19558D58C09AB740E5146643407D218E15568D58C0A9C6E57515664340093B7911578D58C024E7250616664340DFF37B0D588D58C0E93E039616664340054C9609598D58C04A827925176643408243C8055A8D58C033D78AB4176643406FC710025B8D58C0A53D374318664340A5EA70FE5B8D58C036DB80D1186643402BADE8FA5C8D58C0CB3E615F19664340090F78F75D8D58C09DD9DEEC1966434050FD1DF45E8D58C0DA85F7791A6643400D78DAF05F8D58C0DE1DA9061B6643401B92AEED608D58C04EC7F5921B664340913899EA618D58C04682DD1E1C6643405F7E9BE7628D58C0AB4E60AA1C6643409550B4E4638D58C0892C7E351D6643403BAFE3E1648D58C01FF634C01D664340579A29DF658D58C030D1864A1E664340E31186DC668D58C0BBBD73D41E664340D815F9D9678D58C0FE95F95D1F66434024B983D7688D58C0BC7F1AE71F664340F8D523D5698D58C0E57AD66F20664340427FDAD26A8D58C0D5612BF8206643401CA2A6D06B8D58C0315A1B80216643403F648ACE6C8D58C01564A60722664340F89F83CC6D8D58C0A459CA8E226643403F5592CA6E8D58C0AC60891523664340D0A9B8C86F8D58C06E53E19B236643401665F3C6708D58C0A957D42124664340C5AC44C5718D58C05E6D62A724664340036EABC3728D58C0CC6E892C25664340B7BB28C2738D58C0F25B49B125664340FA82BBC0748D58C0855AA43526664340C5C363BF758D58C0DE4498B926664340267E21BE768D58C0B140273D2766434016B2F4BC778D58C02E284FC027664340955FDDBB788D58C026211243286643409B86DBBA798D58C0D6056EC5286643403827EFB97A8D58C04DD6624729664340634118B97B8D58C022B8F2C82966434035C255B87C8D58C0BD851B4A2A66434097BCA8B77D8D58C0D264DFCA2A6643408E3011B77E8D58C0A02F3C4B2B664340330B8EB67F8D58C027E631CB2B664340685F20B6808D58C05888C04A2C664340431AC7B5818D58C0113CEAC92C664340B44E83B5828D58C074DBAC482D664340F3D652B5838D58C0916608C72D6643409AEB38B5848D58C03503FF442E664340165432B5858D58C0C2658CC22E664340402340B5868D58C0C9D9B43F2F664340F26B63B5878D58C0893976BC2F66434078089AB5888D58C00285D03830664340AC0BE5B5898D58C0E6E1C5B430664340688845B68A8D58C0D004523031664340F958B9B68B8D58C0333979AB31664340379041B78C8D58C041593926326643403D1BDDB78D8D58C0166592A032664340F70C8DB88E8D58C0955C841A336643405F6551B98F8D58C0DB3F0F9433664340951129BA908D58C0BD0E330D34664340722415BB918D58C074C9EF8534664340238B14BC928D58C0D66F45FE34664340A24527BD938D58C0F001347635664340C8664EBE948D58C0C27FBBED35664340C2DB88BF958D58C03FE9DB643666434089A4D6C0968D58C0446497DB3666434017C137C2978D58C032A5E951376643407A31ACC3988D58C0D9D1D4C737664340AAF533C5998D58C046EA583D38664340A70DCFC69A8D58C09DC873B2386643406A797DC89B8D58C07BB82927396643401B263ECA9C8D58C00494789B39664340A62612CC9D8D58C084355E0F3A664340F17AF9CD9E8D58C07EE8DE823A6643400A23F4CF9F8D58C06161F6F53A664340160C01D2A08D58C00BC6A6683B6643400F3620D4A18D58C06D16F0DA3B664340D5B352D6A28D58C0B82CD04C3C664340887297D8A38D58C08C544BBE3C6643400185EFDAA48D58C056425D2F3D6643406DD859DDA58D58C0BD1B08A03D664340C06CD6DFA68D58C0F9E04B103E664340064265E2A78D58C01D6C26803E664340325806E5A88D58C0FAE299EF3E66434051AFB9E7A98D58C09045A65E3F66434076347EEAAA8D58C0DE934BCD3F664340750D56EDAB8D58C024A8873B40664340542740F0AC8D58C013A85CA940664340456F3BF3AD8D58C0086EC816416643401CF848F6AE8D58C07745CF834166434006AF67F9AF8D58C00EBD6AF041664340D5A698FCB08D58C02C46A15C4266434098DFDBFFB18D58C026956EC84266434067463003B38D58C0F4CFD433436643403BDB9506B48D58C0ABD0D19E4366434003B10D0AB58D58C01BBD670944664340EFA1950DB68D58C0826F947344664340CED32F11B78D58C0A10D5ADD44664340B333DB14B88D58C0AA71B646456643408BD49818B98D58C079C1ABAF456643408790661CBA8D58C0F2FC391846664340967A4520BB8D58C071FE5E8046664340C97F3424BC8D58C0D9C51AE846664340F0C53528BD8D58C007796F4F476643403B27472CBE8D58C01EF25AB64766434079C96A30BF8D58C0EE56DF1C48664340FC739D34C08D58C0B581FA8248664340914CE138C18D58C03598AEE8486643402A53363DC28D58C0AB74F94D49664340F0749B41C38D58C00B17DBB249664340C8C41146C48D58C031A555174A664340E31C974AC58D58C04EF9667B4A66434011A32D4FC68D58C054130FDF4A6643404B57D553C78D58C0211950424B664340C9138C58C88D58C0D7E427A54B66434072EB525DC98D58C0469C98074C66434046DE2962CA8D58C0AB19A0694C6643402DFF1167CB8D58C0085D3ECB4C6643405728096CCC8D58C05B66732C4D664340B36C1071CD8D58C0685B418D4D66434053B92676CE8D58C06B16A6ED4D66434006344E7BCF8D58C06597A14D4E6643401BA48380D08D58C057DE33AD4E6643403D42CA85D18D58C0F3105F0C4F664340A8E81F8BD28D58C08609216B4F66434066978490D38D58C01EC879C94F6643404761F995D48D58C09F4C69275066434073337D9BD58D58C01797EF8450664340E90D10A1D68D58C056CD0EE2506643408A03B3A6D78D58C0AEA3C23E516643409CEE63ACD88D58C0CD650F9B51664340D2F424B2D98D58C0E3EDF2F65166434072F0F3B7DA8D58C0B2616F52526643403D07D3BDDB8D58C0A87580AD526643407213C0C3DC8D58C0A34F280853664340F827BCC9DD8D58C04815696253664340C244C7CFDE8D58C0327B3EBC53664340D669E1D5DF8D58C0C6CCAC1554664340538409DCE08D58C08FBEAF6E546643401BA740E2E18D58C01F9C4BC7546643404DBF85E8E28D58C0983F7E1F55664340EFCCD8EEE38D58C008A9477755664340D5E23AF5E48D58C0AEB2A5CE556643400501ACFBE58D58C00CA89C2556664340BE012A02E78D58C053632A7C56664340C20AB708E88D58C0A0E44ED2566643402F09520FE98D58C0D52B0A285766434006FDFA15EA8D58C040135A7D5766434066D3B01CEB8D58C072E642D25766434009B27523EC8D58C08C7FC226586643401D86482AED8D58C0DCB8D67A58664340BA3C2831EE8D58C0E5DD83CE58664340C8E81538EF8D58C031A3C52159664340318A113FF08D58C01A54A074596643400B211B46F18D58C047A50FC7596643406D9A314DF28D58C06ABC15195A66434059F65454F38D58C08599B26A5A664340AF47865BF48D58C0963CE6BB5A6643408D7BC462F58D58C091A5B00C5B664340D5A4106AF68D58C0C1AE0F5D5B664340BE9D6871F78D58C0AAA307AD5B664340188CCE78F88D58C0D73894FC5B664340FB5C4180F98D58C0EC93B74B5C6643405F10C187FA8D58C0F8B4719A5C66434054A64D8FFB8D58C03B76C0E85C664340D21EE796FC8D58C03523A8365D664340D1798D9EFD8D58C0657024845D66434061B740A6FE8D58C07F8337D15D66434098C4FFADFF8D58C09D5CE11D5E66434052B4CBB5008E58C0E3D51F6A5E664340BB73A3BD018E58C0F03AF7B55E6643408D2889C5028E58C0244063015F664340209A79CD038E58C09BE5634C5F66434043EE76D5048E58C0BD76FD965F664340071280DD058E58C015A82BE15F664340541896E5068E58C0649FF02A6066434050EEB7ED078E58C0E8364A7460664340ED93E5F5088E58C025BA3CBD6066434039091FFE098E58C08ADDC305616643402E4E64060B8E58C032A1DF4D61664340C462B50E0C8E58C0D12A929561664340024712170D8E58C0597ADBDC61664340E8FA7A1F0E8E58C0E78FBB2362664340777EEF270F8E58C09C45306A62664340D3BE6E30108E58C048C13BB062664340D1CEF938118E58C029DDDBF56266434078AE9041128E58C002BF123B63664340EC4A324A138E58C0DF66E07F6366434021A4DE52148E58C0E5AE42C463664340FFCC965B158E58C0D3BC3B086466434084C55A64168E58C0056BC94B64664340F767286D178E58C020DFED8E646643400CDA0176188E58C07EF3A6D164664340E708E67E198E58C0D4CDF613656643408BF4D4871A8E58C0126EDD5565664340F59CCE901B8E58C086AE5897656643402702D3991C8E58C000B56AD8656643402124E2A21D8E58C0A15B111966664340E202FCAB1E8E58C077A24C5966664340898B1FB51F8E58C006D5209966664340D9E34EBE208E58C0098287D8666643402FD386C7218E58C0F5F48417676643402D92CAD0228E58C0E62D19566766434012FB17DA238E58C0FF06429467664340D60D6FE3248E58C01DA601D26766434069DDD0EC258E58C070E5550F68664340E3563CF6268E58C0EBC43E4C68664340437AB1FF278E58C05D6ABE8868664340635A3109298E58C005B0D2C46866434072E4BA122A8E58C0B2BB7D006966434067184E1C2B8E58C08667BD3B696643405BE3E9252C8E58C043D99376696643401D6B902F2D8E58C044EBFEB069664340C79C40392E8E58C07B9DFEEA696643406F65F9422F8E58C0A81595246A66434004D8BB4C308E58C00B2EC05D6A66434081F48756318E58C0580C82966A664340DDBA5D60328E58C0D98AD8CE6A6643403F183C6A338E58C09FA9C3066B664340AE0C2374348E58C04D8E453E6B664340FDAA137E358E58C031135C756B66434052E00C88368E58C04B3807AC6B66434094BF0F92378E58C05B2349E26B664340D6351B9C388E58C0A1AE1F186C66434024432FA6398E58C01DDA8A4D6C66434071E74BB03A8E58C090CB8C826C664340A53572BA3B8E58C02A5D23B76C6643400608A0C43C8E58C0088F4EEB6C6643406571D6CE3D8E58C0CF86101F6D664340CA7115D93E8E58C0DA1E67526D66434035095DE33F8E58C00C5752856D664340C524ACED408E58C0742FD2B76D6643403CEA04F8418E58C0D3CDE8E96D664340D8336502438E58C0670C941B6E6643409A01CD0C448E58C03FEBD34C6E66434061663D17458E58C0F28FAA7D6E6643404E4FB521468E58C0E9D415AE6E66434040CF352C478E58C015BA15DE6E66434058D3BD36488E58C0693FAA0D6F664340955B4D41498E58C00065D33C6F664340F767E44B4A8E58C08150936B6F664340580B84564B8E58C045DCE7996F66434004202A614C8E58C03008D1C76F664340B7CBD86B4D8E58C013FA50F56F664340A7E88D764E8E58C07866632270664340C3894A814F8E58C0B7980C4F7066434004AF0E8C508E58C03B6B4A7B706643406B58DA96518E58C0F4DD1CA7706643400F73ACA1528E58C0A41686D270664340D81186AC538E58C0C8C981FD70664340CE3467B7548E58C0E34214287166434001C94EC2558E58C0265C3B52716643407FCE3CCD568E58C0AC15F77B71664340235832D8578E58C05A6F47A57166434004532EE3588E58C0FF8E2ECE7166434029BF30EE598E58C01829A8F671664340939C39F95A8E58C03689B81E7266434049EB48045C8E58C07C895D46726643401CBE5F0F5D8E58C0F729976D7266434054EF7B1A5E8E58C09A6A659472664340D0919E255F8E58C0804BC8BA7266434090A5C730608E58C05EF2C1E072664340952AF73B618E58C0AF134E0673664340E5202D47628E58C0EAFA702B7366434092756852638E58C06882285073664340A328A95D648E58C00EAA747473664340D85FF168658E58C0284C53987366434091E23D74668E58C047B4C8BB7366434088D6907F678E58C04FE2D4DE73664340C93BEA8A688E58C0CB8A7301746643408EEC4796698E58C06FD3A62374664340970EACA16A8E58C025E2704574664340FD8E15AD6B8E58C0346BCD6674664340CE6D84B86C8E58C048BAC0877466434002ABF8C36D8E58C0D08346A874664340934672CF6E8E58C0411363C874664340AE2DF0DA6F8E58C0261D12E8746643400E8674E6708E58C010ED570775664340E929FDF1718E58C0225D322675664340302C8BFD728E58C0696DA14475664340D38C1E09748E58C0E61DA562756643400039B614758E58C0996E3D807566434089435320768E58C0815F6A9D756643409699F42B778E58C09EF02BBA756643402C3B9A37788E58C0F22182D675664340203B4543798E58C07AF36CF275664340B573F34E7A8E58C03965EC0D766643408F1DA85A7B8E58C01F770029766643400C0060667C8E58C0FC4EAB4376664340122E1C727D8E58C05BA1E85D766643408DA7DC7D7E8E58C0E293BA7776664340926CA1897F8E58C09E262191766643401A7D6A95808E58C090591CAA7666434025D937A1818E58C08752AEC276664340DA6D08AD828E58C0D5C5D2DA76664340034EDDB8838E58C068D98BF276664340B679B6C4848E58C0308DD909776643400CDE92D0858E58C0EF06BE2077664340E48D73DC868E58C015FB343777664340587657E8878E58C07D8F404D7766434075973EF4888E58C00EC4E0627766434015042A008A8E58C0E2981578776643407096170C8B8E58C0DE0DDF8C77664340547409188C8E58C0D0483FA177664340D48AFE238D8E58C037FE31B577664340FCD9F62F8E8E58C0D353B9C877664340C161F23B8F8E58C0A549D5DB776643402722F147908E58C0ADDF85EE77664340361BF353918E58C0EA15CB0078664340E14CF85F928E58C05CECA412786643404DA4FF6B938E58C0353D1124786643407B210978948E58C013541435786643402CEA1684958E58C0180BAC45786643409ED82690968E58C06162D85578664340D9EC389C978E58C0D159996578664340A8394EA8988E58C0B6CBEC7478664340669964B4998E58C09203D783786643409F447FC09A8E58C0E1B5539278664340B3029BCC9B8E58C0362E67A0786643408FE6B8D89C8E58C0E3200DAE786643400D03DAE49D8E58C095D949BB786643404C45FDF09E8E58C0BB0C19C8786643406D9A21FD9F8E58C017E07CD4786643404E154809A18E58C09A5375E078664340EBB57015A28E58C0228D04EC78664340497C9B21A38E58C0114126F7786643406F68C82DA48E58C03495DC01796643406F67F639A58E58C08E89270C7966434057792546A68E58C06AF8041679664340DAC35752A78E58C02E2D791F796643405D0E8A5EA88E58C02802822879664340A87EBE6AA98E58C058771F3179664340D501F476AA8E58C0FC664F3979664340DA972A83AB8E58C0891C1641796643409B53638FAC8E58C0984C6F48796643404A229D9BAD8E58C0DD1C5D4F79664340F2F0D6A7AE8E58C00AB3E155796643405CE512B4AF8E58C0ACC3F85B79664340C6D94EC0B08E58C08474A46179664340F1F38CCCB18E58C09FC5E46679664340150ECBD8B28E58C0E1B6B96B79664340472809E5B38E58C059482370796643402D6849F1B48E58C0077A2174796643401AA889FDB58E58C02826B2777966434006E8C909B78E58C04198D97A79664340CD3A0B16B88E58C0CE84937D796643407BA04D22B98E58C04437E47F7966434041F38E2EBA8E58C03C64C78179664340EF58D13ABB8E58C02B574183796643407ED11447BC8E58C081C44D847966434025375753BD8E58C019D2EE8479664340CD9C995FBE8E58C0DA7F248579664340949A4F91BE8E58C0A8592285796643404200929DBF8E58C0DE53D98479664340CA78D5A9C08E58C07BC822847966434071DE17B6C18E58C00E0303837966434018445AC2C28E58C016B8758179664340DE969BCEC38E58C015337F7F7966434085FCDDDAC48E58C07A281B7D796643406B3C1EE7C58E58C023BE4B7A79664340318F5FF3C68E58C001F410777966434017CF9FFFC78E58C006CA6A73796643401CFCDE0BC98E58C05040596F7966434021291E18CA8E58C0CE56DC6A796643403E435C24CB8E58C0750DF46579664340814A9930CC8E58C08F3E9E6079664340DD3ED53CCD8E58C0A135DF5A7966434040331149CE8E58C0E8CCB45479664340E1014B55CF8E58C0A3DE1C4E796643409ABD8361D08E58C094901947796643405479BC6DD18E58C07C08AD3F79664340530FF379D28E58C0D8FAD237796643406A922886D38E58C05B8D8D2F79664340C6EF5B92D48E58C022C0DC26796643401C4D8F9ED58E58C01F93C01D79664340B084C0AAD68E58C043063914796643408396EFB6D78E58C0AB19460A7966434075951DC3D88E58C03ACDE7FF78664340A56E49CFD98E58C03EFB1BF578664340142273DBDA8E58C038EFE6E978664340A3C29BE7DB8E58C0688346DE786643406F3DC2F3DC8E58C00D9238D2786643407492E6FFDD8E58C0A866C1C578664340BDC1080CDF8E58C0B7B5DCB8786643401FDE2918E08E58C0EEA48CAB78664340E6C14724E18E58C02A5AD39D78664340EB7F6330E28E58C0DA89AC8F7866434047057C3CE38E58C0B2591A8178664340CA779348E48E58C0BFC91C7278664340A3B1A754E58E58C010DAB36278664340C1C5B960E68E58C0888ADF527866434037A1C86CE78E58C036DB9F4278664340EB56D578E88E58C01ACCF43178664340FCD3DE84E98E58C0335DDE20786643404C2BE690EA8E58C0828E5C0F78664340014AEA9CEB8E58C006606FFD776643400630EBA8EC8E58C0C0D116EB7766434057F0E9B4ED8E58C0EEBD50D8776643401765E4C0EE8E58C0057021C5776643401DB4DCCCEF8E58C05FC286B177664340A0B7D0D8F08E58C0208F7E9D776643408082C1E4F18E58C0D8210D89776643409827B0F0F28E58C0C55430747766434034819AFCF38E58C03502E65E77664340468F8008F58E58C08D753249776643409E776414F68E58C05A631133776643406B144420F78E58C01D17871C77664340B6651F2CF88E58C055458F05776643405E7EF737F98E58C084392EEE766643406B5ECC43FA8E58C018A85FD6766643400EE09B4FFB8E58C0B2DC27BE766643400E29685BFC8E58C0C08B82A5766643406C393167FD8E58C0B700748C7666434066EBF472FE8E58C031F0F77276664340DD51B47EFF8E58C093A5125976664340B27F708A008F58C077D5BF3E76664340234F2796018F58C045CB032476664340F3E5DAA1028F58C03961DC0876664340571E89AD038F58C0BF7147ED756643403F0B33B9048F58C02D4849D175664340BD99D7C4058F58C0D0BEDFB475664340BEDC77D0068F58C0DAAF08987566434036D413DC078F58C0E966C87A75664340516DAAE7088F58C02DBE1C5D75664340E2BA3CF3098F58C0D88F033F7566434016AAC9FE0A8F58C08727812075664340B94D520A0C8F58C05F5F9301756643402680D4150D8F58C079373AE274664340096752210E8F58C0BCAF75C27466434088EFCA2C0F8F58C034C845A274664340A3193E38108F58C0E180AA81746643405BE5AB43118F58C085FFA56074664340AF52144F128F58C09EF8333F746643409861775A138F58C0EC91561D746643402512D565148F58C032F10FFB736643406D512C71158F58C0EBCA5BD8736643404A327E7C168F58C08D6A3EB573664340CAB4CA87178F58C073AAB59173664340FFC51093188F58C0BF64BF6D73664340F765509E198F58C010E55F497366434065BA8BA91A8F58C08905952473664340B48ABFB41B8F58C0F9EB60FF7266434099FCEDBF1C8F58C0EB4CBFD97266434039FD15CB1D8F58C0044EB2B372664340958C37D61E8F58C015153C8D72664340ACAA52E11F8F58C099565866726643407F5767EC208F58C0155E0B3F72664340E7A576F7218F58C0B80553177266434038707E02238F58C09F4D2FEF7166434036C97F0D248F58C0BB35A0C671664340169E7918258F58C0C1E3A79D7166434093146E23268F58C0480C427471664340E3065B2E278F58C0B9FA724A71664340EF874139288F58C05F89382071664340DD842044298F58C049B892F5706643407F10F94E2A8F58C05A8781CA706643400318CA592B8F58C0A1F6049F706643405A9B93642C8F58C0DF2B1F73706643406EAD566F2D8F58C091DBCB46706643405C3B127A2E8F58C03A510F1A706643402C45C6842F8F58C0DB8CE9EC6F664340C8CA728F308F58C0E14256BF6F66434027DF189A318F58C02B9957916F664340805CB6A4328F58C06CB5EF626F664340B4554CAF338F58C0D4711C346F664340DBB7D9B9348F58C042F4DF046F664340C5A860C4358F58C015F135D56E664340A902DFCE368F58C0E0B322A56E66434060D855D9378F58C0EE16A4746E664340F229C5E3388F58C0241ABA436E66434085E42BEE398F58C051E366126E6643400C088AF83A8F58C0F226A6E06D6643406DA7E0023C8F58C08A307CAE6D664340C8AF2E0D3D8F58C00B00E97B6D664340FE3375173E8F58C00F4AE8486D664340540EB2213F8F58C0095A7E156D6643407764E72B408F58C02B0AA9E16C6643409B231436418F58C052806AAD6C664340B94B3840428F58C0AE96C0786C664340F0C9524A438F58C0324DAB436C664340FBC36554448F58C0ECA32A0E6C66434027146F5E458F58C09DC040D86B66434045CD6F68468F58C0837DEBA16B66434065EF6772478F58C0ADDA2A6B6B6643407E7A577C488F58C0B2FD00346B664340AA5B3D86498F58C009C16BFC6A664340EF9219904A8F58C03A4A6DC46A6643402E33ED994B8F58C0AF73038C6A6643408729B7A34C8F58C05A3D2E536A664340DA8878AD4D8F58C0FCCCEF196A664340652B2FB74E8F58C0C5FC45E069664340EA36DDC04F8F58C0D2CC30A66966434069AB82CA508F58C0C862B26B696643401A631DD4518F58C0F498C83069664340EB70AEDD528F58C0179575F568664340D5D435E7538F58C07D31B7B968664340D28EB3F0548F58C00B6E8D7D68664340078C26FA558F58C09070FA40686643403DF29003578F58C00C39FE0368664340A59BF00C588F58C0FC7B94C66766434045884516598F58C0A4AAC38867664340E0DD911F5A8F58C0B353854A67664340D963D2285B8F58C088E8DF0B67664340E53F09325C8F58C0C3F7CCCC666643400972363B5D8F58C0C5F2528D666643407FD457445E8F58C02D686B4D66664340158D6F4D5F8F58C09AA31A0D66664340E3887C56608F58C0F0A460CC65664340CBDA7F5F618F58C07C463B8B65664340045D7768628F58C0FFADAC49656643407C226471638F58C0C5B5B20765664340262B467A648F58C075834FC56466434008771D83658F58C00D178382646643402A06EA8B668F58C02825493F646643409CC5AA94678F58C0FB1EA8FB6366434048C8609D688F58C003B99BB7636643402B0E0CA6698F58C0F5182673636643406784ABAE6A8F58C02B19452E63664340DB3D40B76B8F58C057DFFAE862664340A027C9BF6C8F58C0AB4545A362664340C44146C86D8F58C0F671265D62664340209FB8D06E8F58C038649E1662664340F3191ED96F8F58C0BEF6AACF61664340F8D778E1708F58C02C4F4E886166434036D9C8E9718F58C0926D884061664340F1F70BF2728F58C02E2C57F860664340FE4643FA738F58C0C0B0BCAF6066434062C66E02758F58C03BFBB866606643403D638D0A768F58C0FBE5491D606643405143A112778F58C0B19671D35F664340F0F28C9A778F58C0F67F37AD5F664340480C8D9A778F58C0545A2A3C7E664340283D8D9A778F58C03CA8EF1CB96643400F6E8D9A778F58C025F6B4FDF3664340EE9E8D9A778F58C05B1E78DE2E6743406685052C528F58C0C17ED0B7306743403C337ABD2C8F58C0243CC890326743408895EA4E078F58C085565F693467434051AC56E0E18E58C0A3F3974136674340718ABF71BC8E58C0BFED6F1938674340F62F2503978E58C0D844E7F03967434010778594718E58C0AF1E00C83B6743406F98E3254C8E58C07655B89E3D6743405C5B3CB7268E58C047E90F753F674340A8E59148018E58C0D7FF084B416743405837E4D9DB8D58C05673A120436743409D2A316BB68D58C0D143D9F54467434021F87BFC908D58C00C97B2CA466743403A67C18D6B8D58C043472B9F4867434099B0041F468D58C0785443734A6743408D9B42B0208D58C06BE4FC464C674340DF4D7D41FB8C58C04CD1551A4E67434087C7B4D2D58C58C0391B4EED4F674340B3F5E763B08C58C015C2E5BF5167434056D816F58A8C58C0B0EB1E925367434056824286658C58C05572F76355674340CCE06917408C58C0AB7B713557674340A7068EA81A8C58C0F0E18A0659674340F8E0AD39F58B58C04EA543D75A674340A782CACACF8B58C04FEB9DA75C674340CCD8E25BAA8B58C0996895775E67434075E3F6EC848B58C0558E30476067434074B5077E5F8B58C05BEB681662674340D14E150F3A8B58C011CB42E563674340AC9C1EA0148B58C0C407BCB365674340039F2331EF8A58C035C7D68167674340AA6825C2C98A58C0E2BD8E4F69674340B6F92353A48A58C0105DEA1C6B6743403F3F1EE47E8A58C07833E3E96C67434045391475598A58C0918C7DB66E674340A2FA0606348A58C0B542B782706743405C83F6960E8A58C0C955904E72674340B3ADE027E98958C09AEB0A1A7467434041B2C8B8C38958C077DE24E575674340536BAC499E8958C0432EDEAF77674340DA4086677A8958C08E28B4486667434079728285568958C0EB1632E1546743401013A2A3328958C03CF95779436743409922E5C10E8958C0CFA9231132674340418E4AE0EA8858C0357499A820674340E168D3FEC68858C0C00CB53F0F674340929F7E1DA38858C05C9978D6FD66434062324C3C7F8858C0BC3FE66CEC66434004473E5B5B8858C050B4F902DB664340E4A4517A378858C0D91CB598C966434097848999138858C07279182EB866434080ADE2B8EF8758C00FCA23C3A6664340435860D8CB8758C0DFE8D457956643401E5F00F8A78758C0742130EC8366434010C2C217848758C00B4E338072664340FB93A837608758C0E448DC1361664340FEC1B0573C8758C0825D2FA74F664340D471DD77188758C05340283A3E664340E76A2B98F48658C02717C9CC2C664340F3D29CB8D08658C0FEE1115F1B664340F7A931D9AC8658C099C604F1096643400CDDE8F9888658C068799D82F86543401A7FC31A658658C03A20DE13E7654340467DC03B418658C04D95C4A4D565434065EAE05C1D8658C025245535C46543407BC6247EF98558C0FFA68DC5B2654340B1FE8A9FD58558C0DD1D6E55A1654340F79213C1B18558C0EE62F4E48F65434017A9C0E28D8558C0C4C124747E6543406D088F046A8558C09C14FD026D6543409DE98126468558C0A8357B915B654340FD139648228558C0C54AA11F4A6543403DC0CE6AFE8458C0997971AD386543408FC8298DDA8458C0AE76E73A27654340FE2CA7AFB68458C0C56705C815654340600048D2928458C0E04CCB5404654340C1420CF56E8458C0B14B3BE1F264434033E1F2174B8458C0C418516DE1644340A4EEFC3A278458C0E8D90EF9CF644340076B2A5E038458C0F38E7484BE64434082437A81DF8358C00E38820FAD6443401578ECA4BB8358C01FD5379A9B644340A01B82C8978358C0714093248A644340232E3BEC738358C095C598AE78644340BF9C1610508358C0A13E463867644340537A15342C8358C0BDAB9BC155644340E0C63758088358C00DE7964A446443407D6F7C7CE48258C0303C3CD3326443403974E3A0C08258C03985895B21644340CFFA6EC59C8258C0929C7CE30F64434094CA1BEA788258C0AFCD196BFE6343403A1CED0E558258C000CD5CF2EC634340F1C9E033318258C015E64979DB634340C0D3F6580D8258C06BCDDCFFC9634340675F317EE98158C0C5A81786B863434046348DA3C58158C0E39DFC0BA7634340FE8A0DC9A18158C03561879195634340CE3DB0EE7D8158C04B3EBC1684634340B64C75145A8158C0A2E9969B7263434077DD5E3A368158C0FD8819206163434050CA6A60128158C00D4246A44F6343403A139986EE8058C060C918283E63434023CBEAACCA8058C0C34493AB2C63434005F25FD3A68058C00DB4B52E1B634340F874F7F9828058C0691780B109634340E366B2205F8058C08894F433F8624340EDB48F473B8058C0DBDF0EB6E6624340E971906E178058C0321FD137D5624340DD9DB495F37F58C08B523BB9C3624340F025FBBCCF7F58C0E7794D3AB2624340F41C65E4AB7F58C0F9BA09BBA0624340F182F20B887F58C05BCA6B3B8F6243400645A233647F58C0A4CD75BB7D6243401476755B407F58C0FEC4273B6C62434032036B831C7F58C05BB081BA5A62434050FF83ABF87E58C0AD8F833949624340666AC0D3D47E58C0D1882FB83762434094311FFCB07E58C02950813626624340B467A1248D7E58C0830B7BB414624340D30C474D697E58C0D3BA1C3203624340030E0F76457E58C0265E66AFF16143402C7EFA9E217E58C089F5572CE06143404D5D09C8FD7D58C0A3A6F3A8CE61434086983AF1D97D58C0FF253525BD614340DE2F8E1AB67D58C04F991EA1AB61434008490644927D58C0B100B01C9A6143404ABEA06D6E7D58C0C981EB978861434084A25E974A7D58C022D1CC1277614340D7E23EC1267D58C07014568D656143401A9242EB027D58C0D04B8707546143405EB06915DF7C58C0E59C628142614340B92AB33FBB7C58C03DBCE3FA306143400614206A977C58C066F50E741F6143407159AF94737C58C0B5FCDFEC0D614340AF2063BF4F7C58C015F85865FC604340054439EA2B7C58C02C0D7CDDEA6043407AC33115087C58C084F04455D9604340E0B14D40E47B58C0A1EDB7CCC76043403E0F8D6BC07B58C0C0DED243B6604340D6DE8C6BC07B58C03012077B7B60434075AE8C6BC07B58C0A0453BB2406043400D7E8C6BC07B58C00F796FE905604340AC4D8C6BC07B58C0B086A120CB5F43404C1D8C6BC07B58C05094D357905F4340EBEC8B6BC07B58C03D7C038F555F434091BC8B6BC07B58C05A3E31C61A5F4340378C8B6BC07B58C077005FFDDF5E4340DD5B8B6BC07B58C0D39C8A34A55E4340832B8B6BC07B58C02F39B66B6A5E434030FB8A6BC07B58C0BBAFDFA22F5E4340D7CA8A6BC07B58C0552609DAF45D4340849A8A6BC07B58C020773011BA5D4340316A8A6BC07B58C0F9C757487F5D4340E5398A6BC07B58C0F4F27C7F445D434092098A6BC07B58C03BF89FB6095D434047D9896BC07B58C083FDC2EDCE5C4340FBA8896BC07B58C009DDE324945C4340AF78896BC07B58C090BC045C595C43406A48896BC07B58C0387623931E5C43402518896BC07B58C0FD2F42CAE35B4340E1E7886BC07B58C0F2C35E01A95B43409CB7886BC07B58C0E7577B386E5B43405787886BC07B58C01BC6956F335B43401957886BC07B58C08D0EAEA6F85A4340DC26886BC07B58C0F256C6DDBD5A43409EF6876BC07B58C0649FDE14835A434060C6876BC07B58C0459CF24B485A43402A96876BC07B58C0E8BE08830D5A4340F365876BC07B58C007961ABAD2594340BC35876BC07B58C0E8922EF1975943408605876BC07B58C047443E285D5943404FD5866BC07B58C0A5F54D5F225943401FA5866BC07B58C0F5A65D96E7584340F074866BC07B58C084326BCDAC584340C044866BC07B58C05F987604725843409714866BC07B58C02CFE813B3758434068E4856BC07B58C0383E8B72FC5743403FB4856BC07B58C0437E94A9C15743401784856BC07B58C07F989BE086574340EE53856BC07B58C0C9B2A2174C574340CC23856BC07B58C044A7A74E11574340ABF3846BC07B58C0CD9BAC85D656434089C3846BC07B58C0866AAFBC9B5643406893846BC07B58C07E13B0F3605643404663846BC07B58C075BCB02A265643402C33846BC07B58C0AB3FAF61EB5543401103846BC07B58C0D3C2AD98B0554340F7D2836BC07B58C04820AACF75554340DCA2836BC07B58C0AF7DA6063B554340C872836BC07B58C062B5A03D00554340B542836BC07B58C0F9EC9A74C5544340A212836BC07B58C0DCFE92AB8A5443408EE2826BC07B58C0FEEA88E24F5443407BB2826BC07B58C021D77E19155443406E82826BC07B58C035C37450DA5343406252826BC07B58C0D46366879F5343405522826BC07B58C0262A5ABE6453434050F2816BC07B58C0F6A449F52953434043C2816BC07B58C087453B2CEF5243403E92816BC07B58C0959A2863B45243403862816BC07B58C095EF159A795243403332816BC07B58C0A34403D13E5243403502816BC07B58C0F073EE070452434036D2806BC07B58C06D7DD73EC951434038A2806BC07B58C0EA86C0758E5143403972806BC07B58C0A56AA7AC535143404242806BC07B58C0614E8EE3185143404412806BC07B58C05B0C731ADE5043404CE27F6BC07B58C055CA5751A350434055B27F6BC07B58C07F623A88685043405E827F6BC07B58C0B8FA1CBF2D5043406D527F6BC07B58C0216DFDF5F24F43407D227F6BC07B58C0C9B9DB2CB84F43408DF27E6BC07B58C07006BA637D4F43409CC27E6BC07B58C0562D969A424F4340B3927E6BC07B58C03C5472D1074F4340C3627E6BC07B58C053554C08CD4E4340DA327E6BC07B58C06956263F924E4340F0027E6BC07B58C0CC31FE75574E43400ED37D6BC07B58C0210DD6AC1C4E434025A37D6BC07B58C0B5C2ABE3E14D434043737D6BC07B58C087527F1AA74D434067437D6BC07B58C059E252516C4D434085137D6BC07B58C01C722688314D4340A3E37C6BC07B58C06CB6F5BEF64C4340C8B37C6BC07B58C06E20C7F5BB4C4340ED837C6BC07B58C0ED3E942C814C434011547C6BC07B58C02E836363464C43403D247C6BC07B58C0EC7B2E9A0B4C434062F47B6BC07B58C0AA74F9D0D04B43408EC47B6BC07B58C0686DC407964B4340BA947B6BC07B58C057408D3E5B4B4340ED647B6BC07B58C084ED5375204B434018357B6BC07B58C0BF9A1AACE54A43404B057B6BC07B58C02A22DFE2AA4A4340805CF82E9B7B58C0C46CDFE2AA4A4340BCB375F2757B58C06CB7DFE2AA4A434010F8F1B5507B58C00602E0E2AA4A43403D4F6F792B7B58C0A04CE0E2AA4A434072A6EC3C067B58C03B97E0E2AA4A4340C6EA6800E17A58C0D5E1E0E2AA4A4340F441E6C3BB7A58C06F2CE1E2AA4A434021996387967A58C01777E1E2AA4A43404FF0E04A717A58C0A3C1E1E2AA4A434095345D0E4C7A58C03D0CE2E2AA4A4340C38BDAD1267A58C0D756E2E2AA4A4340F0E25795017A58C071A1E2E2AA4A4340173AD558DC7958C00BECE2E2AA4A4340567E511CB77958C09736E3E2AA4A43407DD5CEDF917958C03181E3E2AA4A4340A32C4CA36C7958C0CBCBE3E2AA4A4340E970C866477958C05716E4E2AA4A434009C8452A227958C0F160E4E2AA4A4340281FC3EDFC7858C07DABE4E2AA4A4340487640B1D77858C017F6E4E2AA4A434087BABC74B27858C0A340E5E2AA4A43409F113A388D7858C03E8BE5E2AA4A4340B868B7FB677858C0CAD5E5E2AA4A4340D1BF34BF427858C05620E6E2AA4A43400F04B1821D7858C0E26AE6E2AA4A4340285B2E46F87758C07CB5E6E2AA4A43403AB2AB09D37758C00800E7E2AA4A434071F627CDAD7758C0944AE7E2AA4A4340834DA590887758C02095E7E2AA4A434094A42254637758C0ACDFE7E2AA4A4340A6FB9F173E7758C0382AE8E2AA4A4340D73F1CDB187758C0B674E8E2AA4A4340E196999EF37658C042BFE8E2AA4A4340F3ED1662CE7658C0CE09E9E2AA4A4340FD449425A97658C05A54E9E2AA4A4340278910E9837658C0D89EE9E2AA4A434032E08DAC5E7658C064E9E9E2AA4A434035370B70397658C0F033EAE2AA4A43405F7B8733147658C06D7EEAE2AA4A434069D204F7EE7558C0F9C8EAE2AA4A4340662982BAC97558C07713EBE2AA4A43406980FF7DA47558C0F55DEBE2AA4A43408CC47B417F7558C081A8EBE2AA4A43408F1BF9045A7558C0FFF2EBE2AA4A4340404BF9045A7558C0FA69579CE54A4340F17AF9045A7558C0E7E0C255204B4340A2AAF9045A7558C013322C0F5B4B434053DAF9045A7558C08B5D93C8954B43400B0AFA045A7558C0F588FA81D04B4340BC39FA045A7558C09E8E5F3B0B4C43407B69FA045A7558C0776EC2F4454C43403399FA045A7558C0207427AE804C4340EBC8FA045A7558C0452E8867BB4C4340AAF8FA045A7558C05DE8E820F64C43406928FB045A7558C074A249DA304D43402858FB045A7558C00911A6936B4D4340E887FB045A7558C05FA5044DA64D4340AEB7FB045A7558C0F4136106E14D434074E7FB045A7558C0C75CBBBF1B4E43403A17FC045A7558C09AA51579564E43400047FC045A7558C08FC86D32914E4340CD76FC045A7558C0E0C5C3EBCB4E43409AA6FC045A7558C022C319A5064F434067D6FC045A7558C064C06F5E414F43403406FD045A7558C0E497C3177C4F43400236FD045A7558C0A34915D1B64F4340D665FD045A7558C054FB668AF14F4340AA95FD045A7558C05287B6432C5043407EC5FD045A7558C0411306FD6650434052F5FD045A7558C06F7953B6A15043402D25FE045A7558C09EDFA06FDC5043400955FE045A7558C01820EC2817514340E484FE045A7558C0B53A35E251514340BFB4FE045A7558C060557E9B8C5143409AE4FE045A7558C0FD6FC754C75143403893F417347558C013BCC754C7514340DC41EA2A0E7558C02908C854C75143405A03E13DE87458C03154C854C7514340F8B1D650C27458C047A0C854C75143409560CC639C7458C05DECC854C75143402B0FC276767458C06538C954C7514340C9BDB789507458C07B84C954C7514340407FAE9C2A7458C083D0C954C7514340D62DA4AF047458C08B1CCA54C75143406DDC99C2DE7358C0A268CA54C7514340038B8FD5B87358C0AAB4CA54C7514340923985E8927358C0B200CB54C75143400AFB7BFB6C7358C0BA4CCB54C751434099A9710E477358C0D098CB54C751434028586721217358C0D8E4CB54C7514340B8065D34FB7258C0E030CC54C751434040B55247D57258C0E87CCC54C7514340C863485AAF7258C0F0C8CC54C7514340F1B7AA9A987258C042F19251F25143405549D6DA817258C0BC97344E1D524340EB17CB1A6B7258C01EE2B34A48524340A3368A5A547258C0E5840C47735243408E92129A3D7258C094CB42439E524340B32B64D9267258C07890543FC9524340F3148018107258C036F9433BF4524340663B6557F97158C059BA0C371F534340FBB11496E27158C0641FB3324A534340C2658DD4CB7158C09702352E75534340CB56CF12B57158C0EF639229A05343400785DA509E7158C03E69CD24CB5343405703B08E877158C0A6ECE31FF6534340EEBE4ECC707158C081C8D31A2154434093CAB7095A7158C0F86DA3154C5443407813EA46437158C0D36B4C10775443409199E5832C7158C0D6E7D00AA2544340EA5CAAC0157158C0CF073305CD544340A10A1DF51E7158C047E2BF0A94544340C9A77129287158C08A4B46105B5443403747A95D317158C08743C61522544340F7E8C3913A7158C07FA43D1BE95343402A7AC0C5437158C0E6B9B020B05343408220A1F94C7158C055381B267753434046B6632D567158C0BE1F7D2B3E534340554E09615F7158C096BBDA3005534340B1E89194687158C076C02F36CC5243405F85FDC7717158C0C579803B9352434059244CFB7A7158C00E9CC8405A524340B7B27C2E847158C05F27084621524340495691618D7158C01167434BE851434046E98794967158C0D90F7650AF514340967E61C79F7158C04F47A255765143402B161EFAA87158C0800DC85A3D5143400CB0BD2CB27158C06D62E75F04514340394C405FBB7158C007460065CB504340B8EAA591C47158C0AA92106A92504340848BEEC3CD7158C0076E1A6F59504340B41B19F6D67158C013D81D742050434036AE2628E07158C0E8D01A79E74F4340E555185AE97158C0A9320F7EAE4F4340F9ECEB8BF27158C03323FD82754F43406686A2BDFB7158C06BA2E4873C4F434019223CEF047258C05FB0C58C034F434017C0B8200E7258C01C4DA091CA4E4340804D1752177258C0B7527296914E43401DF05983207258C029E73D9B584E4340FF947FB4297258C04A0A03A01F4E4340532987E5327258C025BCC1A4E64D4340D4D272163C7258C0AEFC79A9AD4D4340C06B4047457258C040A629AE744D4340F806F1774E7258C08DDED2B23B4D43407BA484A8577258C087A575B7024D43404B44FBD8607258C04BFB11BCC94C434067E654096A7258C009BAA5C0904C4340D58A9139737258C0362D35C5574C43408831B1697C7258C05D09BCC91E4C434088DAB399857258C04D743CCEE54B4340DA8599C98E7258C02A48B4D2AC4B4340783362F9977258C083D027D7734B434062E30D29A17258C0E5C192DB3A4B4340B7829B58AA7258C0E641F7DF014B434039370D88B37258C0BF5055E4C84A434007EE61B7BC7258C037EEACE88F4A4340409498E6C57258C0B7F4FBEC564A4340AC4FB315CF7258C0B4AF46F11D4A43407DFAAF44D87258C0ABD388F5E449434081BA9073E17258C05E86C4F9AB494340EA6953A2EA7258C0FDA1F7FD72494340AC1BF9D0F37258C0277226023A4943408EE282FFFC7258C03DAB4C0601494340E198EE2D067358C00E736C0AC848434061643E5C0F7358C0A9C9850E8F4843404C1F708A187358C0F2AE98125648434083DC84B8217358C042FDA2161D484340EEAE7DE62A7358C040DAA61AE4474340BC705814347358C0FA45A41EAB474340DE3416423D7358C061409B22724743402D0EB86F467358C092C98B2639474340DFD63B9D4F7358C07EE1752A00474340C5B4A3CA587358C06462572EC74643401782EDF7617358C0067232328E464340B4511A256B7358C063100736554643407E362B52747358C0AD17D3391C464340B30A1E7F7D7358C081D39A3DE34543401CF4F4AB867358C041F85941AA454340F0CCADD88F7358C0CBAB124571454340EABA4A05997358C003EEC448384543405598C931A27358C0F6BE704CFF444340EE8A2C5EAB7358C0F1F81350C6444340D27F728AB47358C05BE7B2538D44434022649AB6BD7358C0BF3E4957544443409E5DA6E2C67358C0DF24D95A1B4443406659950ED07358C0BA99625EE24343407A57673AD97358C08F77E361A9434340DA571C66E27358C020E45D6570434340AC47B391EB7358C02005D46837434340A44C2EBDF47358C0278F416CFE424340CF668DE8FD7358C01B82A66FC54243406670CE13077458C09A2907738C424340487CF23E107458C0053A5F7653424340768AF969197458C039D9B0791A424340D1ADE494227458C02907FC7CE141434098C0B1BF2B7458C0C7C34080A8414340AAD561EA347458C0200F7F836F414340E8FFF5143E7458C073C3B486364143407A2C6D3F477458C0432CE689FD404340585BC769507458C00DFE0E8DC440434099790394597458C0D1382F908B4043400FAD23BE627458C012284B9352404340D0E226E86B7458C00FA6609619404340BE2D0E12757458C0F88C6D99E03F43401768D73B7E7458C0AA02749CA73F4340BCA48365877458C01807749F6E3F43408EF6138F907458C0339A6DA2353F4340D23786B8997458C057965EA5FC3E43403B8EDCE1A27458C0E9464BA8C33E4340F8E6150BAC7458C083602FAB8A3E4340F9413234B57458C0CB080DAE513E43404D9F315DBE7458C00D1AE2B0183E4340EDFE1386C77458C0CCDFB2B3DF3D4340DA60D9AED07458C0850E7BB6A63D4340F2D782D7D97458C0CAF13EB96D3D4340763E0E00E37458C0FA3DFABB343D43402EBA7D28EC7458C0D718AFBEFB3C43402A38D050F57458C0BD5C5BC1C23C434073B80579FE7458C0205503C4893C43400E3B1EA1077558C07CB6A2C6503C4340D6D21AC9107558C087A63BC9173C4340025AF9F0197558C05B25CECBDE3B434062F6BB18237558C0DC325ACEA53B43400D9561402C7558C065A9DDD06C3B43400536EA67357558C05ED45CD3333B434048D9558F3E7558C05068D3D5FA3A4340DF7EA4B6477558C00C8B43D8C13A4340BA26D6DD507558C0763CADDA883A4340C9E3EB045A7558C09B7C10DD4F3A4340A99AAE747F7558C01D3210DD4F3A4340696472E4A47558C09FE70FDD4F3A4340491B3554CA7558C0219D0FDD4F3A434028D2F7C3EF7558C0A3520FDD4F3A43400889BA33157658C025080FDD4F3A4340C1527EA33A7658C0A7BD0EDD4F3A43409A094113607658C029730EDD4F3A43407AC00383857658C0AB280EDD4F3A43405277C6F2AA7658C02DDE0DDD4F3A4340242E8962D07658C0AF930DDD4F3A4340DDF74CD2F57658C023490DDD4F3A4340B6AE0F421B7758C0A5FE0CDD4F3A43408065D2B1407758C028B40CDD4F3A4340521C9521667758C09C690CDD4F3A434004E658918B7758C01E1F0CDD4F3A4340D69C1B01B17758C092D40BDD4F3A4340A753DE70D67758C0148A0BDD4F3A43406B0AA1E0FB7758C0883F0BDD4F3A43401DD46450217858C00AF50ADD4F3A4340E18A27C0467858C07EAA0ADD4F3A4340B241EA2F6C7858C0F25F0ADD4F3A434076F8AC9F917858C066150ADD4F3A43401AC2700FB77858C0E8CA09DD4F3A4340E478337FDC7858C05C8009DD4F3A4340A82FF6EE017958C0D03509DD4F3A434064E6B85E277958C044EB08DD4F3A4340289D7BCE4C7958C0B8A008DD4F3A4340C5663F3E727958C02C5608DD4F3A4340891D02AE977958C0920B08DD4F3A434045D4C41DBD7958C006C107DD4F3A4340018B878DE27958C07A7607DD4F3A434098544BFD077A58C0EE2B07DD4F3A4340540B0E6D2D7A58C054E106DD4F3A434010C2D0DC527A58C0C89606DD4F3A4340C678934C787A58C03C4C06DD4F3A43405C4257BC9D7A58C0A20106DD4F3A434011F9192CC37A58C016B705DD4F3A4340C0AFDC9BE87A58C07B6C05DD4F3A434075669F0B0E7B58C0E12105DD4F3A43400430637B337B58C055D704DD4F3A4340B3E625EB587B58C0BB8C04DD4F3A4340619DE85A7E7B58C0214204DD4F3A43401054ABCAA37B58C095F703DD4F3A4340981D6F3AC97B58C0FBAC03DD4F3A434046D431AAEE7B58C0616203DD4F3A4340ED8AF419147C58C0C71703DD4F3A43409541B789397C58C02DCD02DD4F3A43403CF879F95E7C58C0938202DD4F3A4340C4C13D69847C58C0F93702DD4F3A4340647800D9A97C58C05FED01DD4F3A4340052FC348CF7C58C0C5A201DD4F3A4340A5E585B8F47C58C01C5801DD4F3A434026AF49281A7D58C0820D01DD4F3A4340C6650C983F7D58C0E8C200DD4F3A4340671CCF07657D58C0407800DD4F3A434000D391778A7D58C0A62D00DD4F3A43407A9C55E7AF7D58C0FEE2FFDC4F3A434013531857D57D58C06498FFDC4F3A4340A609DBC6FA7D58C0BC4DFFDC4F3A43403FC09D36207E58C02203FFDC4F3A4340B98961A6457E58C079B8FEDC4F3A43404B4024166B7E58C0D16DFEDC4F3A4340DDF6E685907E58C03723FEDC4F3A434070ADA9F5B57E58C08FD8FDDC4F3A4340FB636C65DB7E58C0E78DFDDC4F3A43406E2D30D5007F58C03F43FDDC4F3A4340F9E3F244267F58C097F8FCDC4F3A43408B9AB5B44B7F58C0EEADFCDC4F3A434016517824717F58C04663FCDC4F3A4340821A3C94967F58C09E18FCDC4F3A434006D1FE03BC7F58C0F6CDFBDC4F3A43409287C173E17F58C04E83FBDC4F3A4340163E84E3068058C09838FBDC4F3A43407B0748532C8058C0EFEDFADC4F3A4340FFBD0AC3518058C047A3FADC4F3A43408374CD32778058C09158FADC4F3A4340002B90A29C8058C0E90DFADC4F3A434065F45312C28058C041C3F9DC4F3A4340E2AA1682E78058C08B78F9DC4F3A43405F61D9F10C8158C0D42DF9DC4F3A4340D5179C61328158C02CE3F8DC4F3A434033E15FD1578158C07698F8DC4F3A4340A99722417D8158C0CE4DF8DC4F3A4340264EE5B0A28158C01803F8DC4F3A43409D04A820C88158C061B8F7DC4F3A434013BB6A90ED8158C0AB6DF7DC4F3A434062842E00138258C0F522F7DC4F3A4340D83AF16F388258C03FD8F6DC4F3A434048F1B3DF5D8258C0888DF6DC4F3A4340B7A7764F838258C0D242F6DC4F3A434006713ABFA88258C01CF8F5DC4F3A43407527FD2ECE8258C066ADF5DC4F3A4340E4DDBF9EF38258C0B062F5DC4F3A4340AF0289DA168358C090857C373D3A4340A0A52D163A8358C0F7E7AF912A3A434099D9AE515D8358C0E3898FEB173A4340D1780A8D808358C086451945053A434017A942C8A38358C0BD404F9EF23943407C575603C78358C0B9552FF7DF3943400984453EEA8358C07884B94FCD3943408F4111790D8458C08018F2A7BA394340686AB7B3308458C07CA0D2FFA739434043243AEE538458C00C685F57953943403D5C9828778458C0146F98AE823943405D12D2629A8458C0EF8F7B05703943408559E89CBD8458C080CA085C5D394340EC0BD9D6E08458C0A54442B24A394340624FA610048558C08FD8250838394340F7104F4A278558C0F0ABB55D25394340AB50D3834A8558C0D8BEF1B2123943406F2134BD6D8558C083EBD70700394340527070F6908558C00232685CED3843407A2A872FB48558C0F8B7A4B0DA384340A4757A68D78558C0747D8D04C8384340DB514AA1FA8558C0C35C2058B53843404B99F4D91D8658C0C8555DABA2384340C9717B12418658C0538E46FE8F38434086B5DC4A648658C06406DC507D384340448A1A83878658C03A981BA36A38434016F034BBAA8658C0D44305F55738434021C129F3CD8658C0F42E9B46453843403423FB2AF18658C09A59DD97323843408CF0A662148758C0049EC9E81F384340E44E2F9A378758C033FC5F390D384340642B93D15A8758C0E899A289FA374340EA98D3087E8758C0237791D9E7374340B771EE3FA18758C0226E2A29D537434084DBE576C48758C0D77E6D78C237434097B0B7ADE78758C0E3F45EC7AF374340B21666E40A8858C0F15EF8159D374340CD0DF11A2E8858C077083E648A3743402E705651518858C091F12FB277374340B5509787748858C06FF4CBFF643743403DC2B4BD978858C0D436144D52374340ECB1ADF3BA8858C0EE92069A3F374340C11F8229DE8858C08F2EA5E62C374340BD0B325F018958C0C409F0321A374340BA88BE94248958C0AFFEE47E07374340FC7025CA478958C05F0D84CAF436434046EA68FF6A8958C0A35BCF15E2364340AFE187348E8958C05EE9C660CF36434040578269B18958C0DE9068ABBC364340F74A589ED48958C03152B4F5A9364340CDBC09D3F78958C0FB52AC3F97364340B2BF97071B8A58C04C93508984364340D62D003C3E8A58C060ED9ED271364340FB2C4570618A58C00987991B5F36434046AA65A4848A58C05B3A3E644C364340B8A561D8A78A58C04E2D8FAC3936434031323A0CCB8A58C0B95F8CF426364340E929ED3FEE8A58C0E9AB333C14364340A8B27C73118B58C0DD118583013643408FB9E7A6348B58C057B782CAEE354340B42B2DDA578B58C0579C2C11DC354340E82E4F0D7B8B58C00E9B8057C93543401CC34D409E8B58C066D9809DB63543408FC22673C18B58C067312BE3A33543402F40DBA5E48B58C0FCC8812891354340CA4E6CD8078C58C017A0846D7E35434091DBD80A2B8C58C0F69031B26B35434079E6203D4E8C58C08C9B88F658354340876F446F718C58C0770B8E3A46354340BC7643A1948C58C0656F3B7E3335434018FC1DD3B78C58C08D3897C1203543407412D504DB8C58C0B7F59A040E35434015946636FE8C58C037184D47FB344340B8A6D467218D58C07C54A989E834434088371E99448D58C038D0B1CBD5344340784643CA678D58C0B965640DC334434087D343FB8A8D58C0CE3AC34EB0344340A5F1202CAE8D58C09929CC8F9D344340027BD85CD18D58C0EA5781D08A3443405F956C8DF48D58C00EA0E01078344340091BDBBD178E58C0AA27EC5065344340B43126EE3A8E58C0CBEEA3905234434085C64C1E5E8E58C0C0CF05D03F3443407DD94E4E818E58C01EF0130F2D344340956A2C7EA48E58C01E50CE4D1A344340D379E5ADC78E58C0D4C9328C07344340121A7BDDEA8E58C0028343CAF43343409E25EB0C0E8F58C01156FE07E23343402AC2373C318F58C098686545CF334340DDDC5F6B548F58C0E3947682BC334340AF75639A778F58C0A70034BFA93343402FA5639A778F58C02D7401A1E4334340A8D4639A778F58C000C2CC821F3443402E04649A778F58C003EA95645A344340AE33649A778F58C006125F46953443402E63649A778F58C0FB392828D0344340B592649A778F58C03D3CEF090B35434034C2649A778F58C0AF18B4EB45354340C2F1649A778F58C021F578CD803543404921659A778F58C0D2AB3BAFBB354340D050659A778F58C08262FE90F63543405D80659A778F58C072F3BE7231364340EBAF659A778F58C061847F546C36434079DF659A778F58C08EEF3D36A73643400E0F669A778F58C0ED34FA17E23643409C3E669A778F58C04B7AB6F91C374340306E669A778F58C0E79970DB57374340C59D669A778F58C092B92ABD9237434061CD669A778F58C05FB3E29ECD374340F6FC669A778F58C03AAD9A8008384340922C679A778F58C054815062433843402E5C679A778F58C0605506447E384340CA8B679A778F58C0AA03BA25B93843406CBB679A778F58C0408C6B07F438434008EB679A778F58C0C9141DE92E394340AB1A689A778F58C0529DCECA693943404E4A689A778F58C019007EACA4394340F879689A778F58C0103D2B8EDF3943409BA9689A778F58C0167AD86F1A3A434045D9689A778F58C05A918351553A4340EF08699A778F58C090A82E33903A43409938699A778F58C0059AD714CB3A43404A68699A778F58C0B8657EF6053B4340FB97699A778F58C06B3125D8403B4340ACC7699A778F58C01EFDCBB97B3B43405DF7699A778F58C0407D6E9BB63B43400E276A9A778F58C03223137DF13B4340C6566A9A778F58C0927DB35E2C3C43407E866A9A778F58C0B4FD5540673C434036B66A9A778F58C05332F421A23C4340EEE56A9A778F58C0F2669203DD3C4340AD156B9A778F58C0919B30E5173D43406C456B9A778F58C061AACCC6523D43402B756B9A778F58C07D9366A88D3D4340EAA46B9A778F58C08B7C008AC83D4340A9D46B9A778F58C0A7659A6B033E43406F046C9A778F58C03203304D3E3E434035346C9A778F58C07FC6C72E793E4340FB636C9A778F58C0483E5B10B43E4340C8936C9A778F58C0C5DBF0F1EE3E43408EC36C9A778F58C0CD2D82D3293F43405CF36C9A778F58C0C77F13B5643F434029236D9A778F58C0CFD1A4969F3F4340F6526D9A778F58C008FE3378DA3F4340CA826D9A778F58C07F04C159154043409EB26D9A778F58C0F60A4E3B5040434072E26D9A778F58C0ABEBD81C8B40434046126E9A778F58C053CC63FEC54043401B426E9A778F58C04787ECDF00414340F6716E9A778F58C06B1C73C13B414340D1A16E9A778F58C051D7FBA276414340ACD16E9A778F58C0B4468084B141434087016F9A778F58C017B60466EC4143406A316F9A778F58C0B9FF8647274243404C616F9A778F58C05A490929624243402E916F9A778F58C02C6D890A9D42434010C16F9A778F58C00C9109ECD7424340F3F06F9A778F58C01D8F87CD12434340DC20709A778F58C02D8D05AF4D434340C550709A778F58C07C65819088434340AE80709A778F58C0CB3DFD71C34343409FB0709A778F58C058F07653FE43434088E0709A778F58C0247DEE34394443407810719A778F58C0E2096616744443406940719A778F58C0DF70DBF7AE4443405970719A778F58C0DBD750D9E944434050A0719A778F58C02419C4BA2445434048D0719A778F58C05F5A379C5F4543403F00729A778F58C0CA75A87D9A4543403630729A778F58C0826B175FD54543402E60729A778F58C03A618640104643402C90729A778F58C0E456F5214B4643402AC0729A778F58C0CD2662038646434029F0729A778F58C0F3D0CCE4C04643402E20739A778F58C0287B37C6FB4643402D50739A778F58C080FF9FA7364743403280739A778F58C0E58308897147434037B0739A778F58C07BE26E6AAC4743403DE0739A778F58C05D1BD34BE74743404910749A778F58C0F379392D224843405640749A778F58C0068D9B0E5D4843405B70749A778F58C019A0FDEF974843406FA0749A778F58C0798D5DD1D24843407BD0749A778F58C0BC7ABDB20D4943408F00759A778F58C04C421B9448494340A230759A778F58C0CE09797583494340B660759A778F58C09CABD456BE494340C990759A778F58C05C4D3038F9494340E4C0759A778F58C05BC98919344A4340FEF0759A778F58C0991FE1FA6E4A43401221769A778F58C0D67538DCA94A43403351769A778F58C005CC8FBDE44A43404E81769A778F58C0C0D6E29E1F4B43406FB1769A778F58C03B0738805A4B434091E1769A778F58C026EC8861954B4340B211779A778F58C0D3F6DB42D04B4340D441779A778F58C0FCB52A240B4C4340FD71779A778F58C025757905464C434025A2779A778F58C04F34C8E6804C43404ED2779A778F58C0A8CD14C8BB4C43407602789A778F58C04F415FA9F64C4340A632789A778F58C0E7B4A98A314D4340D662789A778F58C0CC02F26B6C4D43400593789A778F58C095503A4DA74D434035C3789A778F58C0B878802EE24D434065F3789A778F58C0BFA0C60F1D4E43409B23799A778F58C013A30AF1574E4340D253799A778F58C0977F4CD2924E43400984799A778F58C02A5C8EB3CD4E434046B4799A778F58C0AE38D094084F43407DE4799A778F58C071EF0F76434F4340BB147A9A778F58C072804D577E4F4340F9447A9A778F58C073118B38B94F434036757A9A778F58C0B37CC619F44F43407BA57A9A778F58C0E5E701FB2E504340C0D57A9A778F58C0632D3BDC6950434004067B9A778F58C0124D72BDA450434049367B9A778F58C0C06CA99EDF5043408E667B9A778F58C06F8CE07F1A514340DA967B9A778F58C05C8615615551434026C77B9A778F58C0885A48429051434071F77B9A778F58C0B42E7B23CB514340BD277C9A778F58C010DDAB040652434010587C9A778F58C07A8BDCE5405243405C887C9A778F58C015140BC77B524340B6B87C9A778F58C0EE7637A8B652434008E97C9A778F58C0C8D96389F15243405B197D9A778F58C0A13C906A2C534340B5497D9A778F58C0B979BA4B675343400F7A7D9A778F58C00191E22CA253434069AA7D9A778F58C049A80A0EDD534340CADA7D9A778F58C0DE9930EF17544340240B7E9A778F58C0648B56D052544340853B7E9A778F58C02A577AB18D544340E56B7E9A778F58C02DFD9B92C85443404D9C7E9A778F58C023A3BD7303554340AECC7E9A778F58C02749DF543E55434016FD7E9A778F58C05BC9FE35795543407E2D7F9A778F58C0DC231C17B4554340E65D7F9A778F58C04E7E39F8EE554340558E7F9A778F58C00DB354D929564340C4BE7F9A778F58C0B1E76FBA645643402CEF7F9A778F58C0A0F6889B9F564340A21F809A778F58C08205A27CDA5643401150809A778F58C0B0EEB85D155743408780809A778F58C01DB2CD3E50574340FDB0809A778F58C07B75E21F8B57434073E1809A778F58C0DA38F700C6574340E911819A778F58C0B6B007E2005843405F42819A778F58C0534E1AC33B584340DC72819A778F58C05FA028A47658434059A3819A778F58C03A183985B1584340DDD3819A778F58C085444566EC5843405A04829A778F58C0DE70514727594340DE34829A778F58C0289D5D28625943406265829A778F58C0B1A367099D594340F884829A778F58C0B4AFAA5FC3594340', 30312, 'SMOKY IFR RACETRACK');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000008000000FB928D075B9858C0A46DFC89CA2E45404277499C157158C0BBD6DEA7AA2A45404277499C157158C0213D450E11F14440BBD39D279E9958C09A99999999B94440B2D826158DB858C087A3AB7477B74440B2D826158DB858C0AC8F87BEBB1B4540EA758BC058B658C07EC9C6832D204540FB928D075B9858C0A46DFC89CA2E4540', 24859, 'ONEILL MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000F0000003B55BE67241C5DC0000000000040414052B81E85EB1D5DC0CDCCCCCCCC4C4140691B7FA2B21F5DC066666666665641403B55BE67241C5DC0AC8F87BEBB5B41408EE6C8CA2F125DC0AC8F87BEBB5B414049BDA772DA045DC00000000000584140AF230ED940035DC087A3AB747757414052B81E85EBFD5CC0AC8F87BEBB4B414060200890A1FA5CC0952C27A1F449414052B81E85EBFD5CC0795C548B884841402A38BC2022FE5CC00ADAE4F0493F4140B2D826158D045DC0BBD6DEA7AA3A41404450357A350D5DC09F03CB11323C4140BCAFCA85CA125DC054707841444441403B55BE67241C5DC00000000000404140', 5825, '2501N');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000090000004450357A350D5DC09F03CB11323C4140B2D826158D045DC0BBD6DEA7AA3A4140D7A3703D0AFF5CC073F56393FC2A414049BDA772DAFC5CC0EE0912DBDD1D41408EE6C8CA2F125DC0EE0912DBDD1D4140B58D3F51D9155DC09A999999992941408C31B08EE3105DC09A9999999929414074CE4F711C135DC085EB51B81E3541404450357A350D5DC09F03CB11323C4140', 5830, '2501S');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000070000003B55BE67241C5DC00000000000404140BCAFCA85CA125DC054707841444441404450357A350D5DC09F03CB11323C414074CE4F711C135DC085EB51B81E3541408C31B08EE3105DC09A99999999294140B58D3F51D9155DC09A999999992941403B55BE67241C5DC00000000000404140', 11470, '2501W');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000400000014AE47E17AE050C006F4C29D0B794540E17A14AE478550C0855E7F129FE945400FBA84436FB34FC08BDF14562A764640CF84268925074EC0E4326E6AA0134740', 23974, 'AR20(NE)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000005000000D6C743DFDD1D51C0BBD6DEA7AA8A47407061DD78776751C000000000000047402A38BC2022A251C0213D450E119146407061DD78770752C0BBD6DEA7AA4A4640F70489EDEE5E52C0AC8F87BEBBFB4540', 23997, 'AR212(SW)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000040000006666666666B651C04529215855554B40C4D155BABB2B51C00000000000804B40D6C743DFDD6D50C0213D450E11B14B40CDCCCCCCCC6C4EC0BBD6DEA7AAEA4B40', 25080, 'AR62(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000500000066666666665651C0DFC2BAF1EEDE45405D6BEF5355E550C054707841442446403C2EAA4544D450C0BBD6DEA7AAEA454066666666664651C04529215855A5454066666666665651C0DFC2BAF1EEDE4540', 24107, 'AR616A');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000060000002BFBAE08FE0F59C0D7A3703D0A23484043908312668A58C0BE874B8E3B1148409A5FCD01825F58C0D8B628B341024740C8CD70033EC158C0D8B628B341024740D7C05609167F59C0309E4143FFAC47402BFBAE08FE0F59C0D7A3703D0A234840', 31172, 'DICKINSON');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000005000000B5E0455F41345AC046425BCEA5784040FFE7305F5E265AC0A1BE654E97694040C68A1A4CC32A5AC05C1B2AC6F92B4040C139234A7B455AC086032159C0484040B5E0455F41345AC046425BCEA5784040', 25404, 'ABQ-4');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000050000002EE7525C55CC59C0598B4F01308248405648F949B5E558C0598B4F01308248404CA60A4625C158C009168733BFFE46409E077767EDCA59C09B20EA3E003D47402EE7525C55CC59C0598B4F0130824840', 31295, 'A3 ORBIT');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000A0000005648F949B5E558C0598B4F0130824840FDBCA948850758C0598B4F0130824840E44EE960FDE957C0A4C7EF6DFA37484051F701486DF257C034D769A4A5CE4740F41ABB44F5E257C0AEB6627FD95D4740E44EE960FD4358C0BBB88D06F03E47400CB08F4E5D6B58C0EC12D55B03F34640B875374F758058C07B319413EDF646404CA60A4625C158C009168733BFFE46405648F949B5E558C0598B4F0130824840', 31296, 'A4 ORBIT');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000008000000FDBCA948850758C0598B4F01308248404DD6A887686457C0598B4F01308248404DD6A887686457C0382D78D1575047404BCD1E6805C457C0382D78D157504740F41ABB44F5E257C0AEB6627FD95D474051F701486DF257C034D769A4A5CE4740E44EE960FDE957C0A4C7EF6DFA374840FDBCA948850758C0598B4F0130824840', 31297, 'A5 ORBIT');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000008000000CF66D5E76AEB51C0A1F31ABB44C9434013F241CF66C350C0B6D617096DA54340AA9A20EA3EA050C0B6D617096DA54340AA9A20EA3EA050C0EFE192E34E5D4340520FD1E80ED050C0EFE192E34E5D4340728A8EE4F2CD50C0B0C91AF5107D4340EE258DD13AEE51C03E22A64412A14340CF66D5E76AEB51C0A1F31ABB44C94340', 25721, 'AR777H');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000008000000CF66D5E76AEB51C0A1F31ABB44C9434013F241CF66C350C0B6D617096DA54340AA9A20EA3EA050C0B6D617096DA54340AA9A20EA3EA050C0EFE192E34E5D4340520FD1E80ED050C0EFE192E34E5D4340728A8EE4F2CD50C0B0C91AF5107D4340EE258DD13AEE51C03E22A64412A14340CF66D5E76AEB51C0A1F31ABB44C94340', 25720, 'AR777L');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000004000000F70489EDEE6E55C0DFC2BAF1EEEE45405D6BEF53554555C087A3AB74777746402A38BC20223255C03333333333B3464033333333336355C02FDD240681554640', 23925, 'AR107');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000040000007061DD78775757C04529215855354740C4D155BABBCB56C06666666666E646409A99999999E955C00000000000E0464000000000005055C00000000000E04640', 23928, 'AR109H(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000040000007061DD78775757C04529215855354740C4D155BABBCB56C06666666666E646409A99999999E955C00000000000E0464000000000005055C00000000000E04640', 23930, 'AR109L(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000090000000AD7A3703DDA52C07DCC07043A9D45409A999999996953C000000000008045401F85EB51B8FE53C0A69BC420B0524540022B8716D95A54C0EE0912DBDD4D454070E01F00825A54C0DD9156218A3F4540EEE82400A4FC53C0775FDF98AF43454002A5FCFF936753C0331070AD9B6F4540FDB50600D8D852C0C4904193698C45400AD7A3703DDA52C07DCC07043A9D4540', 23988, 'AR206L');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000090000000AD7A3703DDA52C07DCC07043A9D45409A999999996953C000000000008045401F85EB51B8FE53C0A69BC420B0524540022B8716D95A54C0EE0912DBDD4D454070E01F00825A54C0DD9156218A3F4540EEE82400A4FC53C0775FDF98AF43454002A5FCFF936753C0331070AD9B6F4540FDB50600D8D852C0C4904193698C45400AD7A3703DDA52C07DCC07043A9D4540', 23987, 'AR206H');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000800000001DC2C5E2C215AC048E17A14AEF74240F0B61CF9CD265AC0D20AC2CBC2ED4240FA111A1C809359C07872970EE7284240F4A62215462859C08D24E6FE8FCF41403C2EAA45442459C035EB8CEF8BDD41408E739B70AF6D59C09A99999999194240909E2287889059C0EE0912DBDD35424001DC2C5E2C215AC048E17A14AEF74240', 31606, 'AR312L(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000800000001DC2C5E2C215AC048E17A14AEF74240F0B61CF9CD265AC0D20AC2CBC2ED4240FA111A1C809359C07872970EE7284240F4A62215462859C08D24E6FE8FCF41403C2EAA45442459C035EB8CEF8BDD41408E739B70AF6D59C09A99999999194240909E2287889059C0EE0912DBDD35424001DC2C5E2C215AC048E17A14AEF74240', 31607, 'AR312L(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000800000001DC2C5E2C215AC048E17A14AEF74240F0B61CF9CD265AC0D20AC2CBC2ED4240FA111A1C809359C07872970EE7284240F4A62215462859C08D24E6FE8FCF41403C2EAA45442459C035EB8CEF8BDD41408E739B70AF6D59C09A99999999194240909E2287889059C0EE0912DBDD35424001DC2C5E2C215AC048E17A14AEF74240', 31604, 'AR312H(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000800000001DC2C5E2C215AC048E17A14AEF74240F0B61CF9CD265AC0D20AC2CBC2ED4240FA111A1C809359C07872970EE7284240F4A62215462859C08D24E6FE8FCF41403C2EAA45442459C035EB8CEF8BDD41408E739B70AF6D59C09A99999999194240909E2287889059C0EE0912DBDD35424001DC2C5E2C215AC048E17A14AEF74240', 31605, 'AR312H(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000800000000000000006051C04529215855B544405D6BEF53551D51C0CDCCCCCCCCAC44400000000000C050C0DFC2BAF1EEEE44400000000000C050C0213D450E1151454000000000001051C0BBD6DEA7AA2A454000000000002051C0213D450E1111454000000000006051C06666666666E6444000000000006051C04529215855B54440', 24098, 'AR608');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000005000000D09B8A54186756C0C9E53FA4DF5E3D402D78D157901C56C05FB532E197823C40D95F764F1E3456C0ABE7A4F78D1F3C40AC8BDB68007F56C016139B8F6BFB3C40D09B8A54186756C0C9E53FA4DF5E3D40', 25412, 'AW-004');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000005000000A9A44E40132D5BC0CF49EF1B5F174040DE1FEF552B155BC0EA78CC40651440408D9C853DED165BC03997E2AAB2D73F40A8C64B37892F5BC08655BC9179DC3F40A9A44E40132D5BC0CF49EF1B5F174040', 31162, 'PLAYAS TEMPORARY MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000B000000E1EEACDD762955C0A1D634EF38914640664E97C5C40855C072E1404816A046407F30F0DC7B0655C05648F949B557464088635DDC46FF54C0EF384547724946403AE97DE36B2555C0693524EEB148464070CE88D2DE2A55C0F41ABB44F556464058CA32C4B12A55C05CACA8C1345C46407845F0BF952855C071C971A7745C464071AC8BDB682855C0465F419AB1644640E88711C2A32955C05B7C0A80F1644640E1EEACDD762955C0A1D634EF38914640', 31309, 'GRAYLING TEMPORARY MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000C0000005704FF5BC96C54C0E8A4F78DAF814040B9533A58FF6354C073A25D8594874040DB8AFD65F75C54C0CA6C904946824040C58F31772D2754C0D044D8F0F4224040CD069964E42454C0202922C32A164040FD304278B42754C0C0EC9E3C2C084040FB743C66A02C54C02046088F36024040BAA0BE654E3354C0B0AC342905014040412B3064753954C0CC7F48BF7D0540406891ED7C3F6F54C0CF66D5E76A674040F870C971A77054C09D8026C2867340405704FF5BC96C54C0E8A4F78DAF814040', 25650, 'STEWART ORBIT');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000002000000E0675C3810E853C0228E75711BA9444040FB9122328A53C0A8A9656B7D0D4440', 12060, 'RANDOM AIR REFUELING FKL-THS');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000B0000005C2041F1631254C065C746205E274140BD6F7CED990954C051BD35B0552E4140CD3B4ED1910254C05A0D897B2C2D4140401878EE3DFC53C0390B7BDAE12341409FCDAACFD5FA53C0300DC347C41441405B423EE8D91454C07D5C1B2AC6A9404058A835CD3B1C54C0252367614FA34040F758FAD0052554C0A306D3307CA4404046425BCEA52A54C03815A930B6AC4040E78C28ED0D2C54C0567DAEB662BB40405C2041F1631254C065C746205E274140', 24090, 'AR600');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000060000007061DD7877B756C03333333333B33F40D49CBCC8048B56C048E17A14AE073E40C4D155BABB6B56C06666666666263D40D6C743DFDD2D56C00000000000803B407061DD7877E755C0A8E0F082888839405D6BEF5355C555C075ADBD4F55553840', 23915, 'AR103');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000070000002A38BC2022A25AC012F6ED24222241409A99999999A15AC0795C548B88084140F70489EDEE9E5AC012F6ED2422C24040909E228788885AC05470784144C44040A39410ACAA8A5AC0BBD6DEA7AA0A41409A99999999A15AC0795C548B880841402A38BC2022A25AC012F6ED2422224140', 24820, 'AR121(N)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000007000000909E228788885AC09A99999999B94040909E228788885AC05470784144C44040A39410ACAA8A5AC0BBD6DEA7AA0A41409A99999999A15AC0795C548B88084140F70489EDEE9E5AC012F6ED2422C24040909E228788885AC05470784144C44040909E228788885AC09A99999999B94040', 24821, 'AR121(S)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000003000000CDCCCCCCCC1C5CC054707841446440407061DD7877175CC0D5EB1681B15C4040CDCCCCCCCCDC5BC00AD7A3703D1A4040', 31451, 'AR135V(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000003000000CDCCCCCCCCDC5BC00AD7A3703D1A404061C1FD8007E35BC0B0E595EB6D214040CDCCCCCCCC1C5CC05470784144644040', 31452, 'AR135V(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000A000000B64AB0389C9753C07DD0B359F5D1404067614F3BFC9153C0098A1F63EECA4040683F5244868F53C014E8137992BC40400CB08F4E5DA953C012312592E8514040739D465A2AAF53C095D409682248404031EBC5504EB853C02F698CD65149404099D87C5C1BBE53C012312592E851404047551344DDBF53C07B319413ED5E40401327F73B14A753C0153AAFB14BC84040757632384A9E53C0087767EDB6D34040', 24091, 'AR601');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000A0000005DDC4603785158C0D1E80E6267D24340A6272CF1804858C027C286A757CE4340A8E33103954358C03D9B559FABC54340573ECBF3E04258C04CC3F01131B943406E861BF0F94758C0CE88D2DEE0AB4340BC0512143F8A58C06ADE718A8E8C43405AD8D30E7F9558C0FE43FAEDEB9043407120240B989A58C09A94826E2F9D4340207BBDFBE39958C057B2632310AB4340D1915CFE439458C0D36A48DC63B54340', 24154, 'AR653');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000800000009FB761211B159C0213D450E11D145400E51E0F8B5B759C037E4FAD236C64540553A0E724D3A59C08A54BDA195F54440EC432800901A59C03C7CE3B55C9F4340E256410C740E59C0F8C610001CA14340BC749318042E59C0FE47A643A7FD444000000000005059C0452921585535454009FB761211B159C0213D450E11D14540', 23968, 'AR17(S)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000800000009FB761211B159C0213D450E11D145400E51E0F8B5B759C037E4FAD236C64540553A0E724D3A59C08A54BDA195F54440EC432800901A59C03C7CE3B55C9F4340E256410C740E59C0F8C610001CA14340BC749318042E59C0FE47A643A7FD444000000000005059C0452921585535454009FB761211B159C0213D450E11D14540', 23967, 'AR17(N)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000008000000909E228788E858C087A3AB7477B743405D6BEF5355FD58C0DFC2BAF1EE8E4440C4D155BABB0B59C09A999999991945407061DD78778759C0CDCCCCCCCCEC4540E30632F17D9159C014EB54F99EDD454030B88BD50B1759C079ECC26A870B45408A0BF615DAF658C04FC0C0BD7CB34340909E228788E858C087A3AB7477B74340', 24013, 'AR24(N)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000008000000909E228788E858C087A3AB7477B743405D6BEF5355FD58C0DFC2BAF1EE8E4440C4D155BABB0B59C09A999999991945407061DD78778759C0CDCCCCCCCCEC4540E30632F17D9159C014EB54F99EDD454030B88BD50B1759C079ECC26A870B45408A0BF615DAF658C04FC0C0BD7CB34340909E228788E858C087A3AB7477B74340', 24014, 'AR24(S)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000500000098DD938785C859C02E1C08C9023A43404E452A8C2DA859C02FC03E3A75CD4240D8F50B76C3C659C0C993A46B26B742407233DC80CFE759C06AC18BBE8224434098DD938785C859C02E1C08C9023A4340', 25441, 'DEN-2');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000B0000008DB454DE8E5455C0B18A37328FDC3F409E5E29CB104B55C068D0D03FC1DD3F4030D80DDB164555C03CF71E2E39CE3F40894160E5D01255C01D5A643BDF473E4038BEF6CC921455C026AAB706B62A3E40486DE2E47E1955C0BF823463D1143E40E71DA7E8482255C0BF823463D1143E40E4839ECDAA2955C088BA0F406A233E404CE0D6DD3C5B55C0F9A067B3EAB33F406C5B94D9205955C0F33CB83B6BCF3F408DB454DE8E5455C0B18A37328FDC3F40', 25637, 'JSTARS 3 ORBIT');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000B00000004FF5BC98E9D57C0309E4143FF8C3E40520FD1E80E0057C0309E4143FF8C3E40825660C8EAF656C0118DEE20767E3E40833463D174F456C02046088F36663E40825660C8EAF656C04DA1F31ABB4C3E40520FD1E80E0057C08C84B69C4B393E4004FF5BC98E9D57C08C84B69C4B393E406397A8DE1AA857C04DA1F31ABB4C3E40D3D9C9E028A957C02046088F36663E406397A8DE1AA857C0118DEE20767E3E4004FF5BC98E9D57C0309E4143FF8C3E40', 25645, 'POLK 1 ORBIT');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000005000000917EFB3A70C456C01CD3139678C03F40A228D027F2BA56C097900F7A365B3F407DCB9C2E8B0357C0D6AD9E93DE173F40CBD6FA22A10B57C02FA3586E697D3F40917EFB3A70C456C01CD3139678C03F40', 12105, 'AW102');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000090000000395F1EF33E058C044DD0720B5514340ADA3AA09A2AE58C01D03B2D7BB2B43402E90A0F831A658C0BD8C62B9A51543400C59DDEA39AD58C0AD6EF59CF4FE4240D97745F0BFBD58C053793BC269F942409279E40F06F058C067EDB60BCD214340704221020EF758C002F1BA7EC13643402237C30DF8EE58C012143FC6DC4D43400395F1EF33E058C044DD0720B5514340', 25463, 'ZKC-1');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000040000009A99999999D154C040C23060C9DF444055320054714A54C01904560E2DC24440F70489EDEEF653C0213D450E11B14440684293C492B753C085EB51B81EA54440', 24001, 'AR9217');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000500000099F04BFDBC0F55C030F0DC7BB89844401BF5108DEEF454C03B8DB454DE96444012C2A38D23FC54C0E36BCF2C0968444000000000001855C0C80C54C6BF6F444099F04BFDBC0F55C030F0DC7BB8984440', 31463, 'STINGER TEMPORARY MOA');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000003000000B2463D44A3295FC04A5E9D63402A48403DD52137C3DD5DC00ABABDA4317647405F0CE544BB225DC08B89CDC7B5814740', 24055, 'AR356');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000003000000CF2C095053035AC0331B649291574140B6DB2E34D77F59C061A6ED5F595D4140F33CB83B6B8358C0518369183E224140', 23957, 'AR13(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000003000000F33CB83B6B8358C0518369183E224140B6DB2E34D77F59C061A6ED5F595D4140CF2C095053035AC0331B649291574140', 23958, 'AR13(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000040000004A99D4D006F24CC04CAAB69BE0714740CF84268925074EC0E4326E6AA01347400FBA84436FB34FC08BDF14562A764640E17A14AE478550C0855E7F129FE94540', 23975, 'AR20(SW)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000200000071E65773804A5BC0164D6727834F4140FD304278B4535AC0164D6727834F4140', 224031, 'AR310(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000200000071E65773804A5BC0164D6727834F4140FD304278B4535AC0164D6727834F4140', 224032, 'AR310(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000B0000008F705AF0A2D354C044696FF085193A404A07EBFF1C9654C044696FF085193A401C9947FE608E54C00B98C0ADBB093A405BB1BFEC9E8C54C02B1895D409F839403B3602F1BA8E54C0A7AE7C96E7E139408A1F63EE5A9454C0FBAE08FEB7D23940A774B0FECFD354C060E5D022DBC93940B745990D32DB54C064CC5D4BC8D73940B6679604A8DD54C0E370E65773F03940EFE6A90EB9DB54C0705F07CE19093A408F705AF0A2D354C044696FF085193A40', 24110, 'AR618');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000301000051BFBFDF9F0857C0B49924E55C2D4840B2DE3AB9940557C02273D9994B2D4840D098E0F18F0457C0C334B96DE52D48404C434C09B50357C011D9A043AA2D4840E8D10FA6580357C050D93FFB0F2B4840B07108ABFA0157C0F290D46480294840F4F2E304CC0057C03AA873756B2948409866C02E740057C0BE97094CE9284840693A885E0A0157C0503E7B196F25484041FEB245730057C0E4513677032248400C10E19E8BFF56C0BC7025CE5D214840536871C1D3FE56C066B23781471F4840726A2FFE24FE56C08284FCC23A1F4840F693EAB9E0FD56C0F630DA4A0A20484036743CC36BFD56C04ED96D89F31F4840AFCBC6A102FD56C07D07416A481F48402EA7C98A03FD56C05A293A7CA51E4840521E592272FD56C0AF3023EFA01E4840A84E1F734BFD56C060914B9C9C1D4840A7A3862FC0FC56C0C7FBDC3D4F1D48400E390DC72EFB56C0358AE7DF271E4840180CC8D8F8F956C05C1F3DDF6E1E48405C484D6623F956C0405CB9F31C1E48403443419E65F856C07D5C891B9A1C484003E5555B93F756C0D385AB5EFF1B4840AE10F4A049F756C05BA93FC86F1A484022DAE1BABFF656C07953D8EF591A48401C31F37C8FF456C0EAE37DB91C1B48407180B7E1F0F256C0AB15D1E3EA1948408DA775F85CF256C02093BF860F194840A229AA7CFCF156C085C59671A819484085D192DD9AF056C0FCFBC58BB1194840AE20CBE2CFEF56C04A201B6F571948408889E1BB9EEF56C0B1E809E7F41948402D15D356AAEE56C0F96AAD2CAB194840059E988BE2ED56C00B9692B1031948406995F3408AED56C0F8A89D676418484033BD6B71D9ED56C061867B4F86174840D1B1A26286EE56C05FB9DEBA8E164840DBFE049E65EE56C03D2D09688A154840BAD0BF7F06EE56C0A520BC057A1548403B96871CAAED56C097B8A6E0E01548409F77EAA353ED56C0FF6024DE8F15484031A6238845ED56C03E179492EB1248402C97FED7D2EC56C016F093BD721148409F72AA66DCEC56C00789D6E0731048403CFF86605BED56C0DD2E0EE6A80F48403F1CB6894AED56C0F6AA33AAA30E4840E4C04886ADEC56C0AFE423BAD50E4840F635523C0EEC56C0A85A8BAE8C0F48404B48B59DD2EB56C0C51606C33A0F4840DAA8A3D3E9EB56C0418CA46BBA0E4840C8A6433541EC56C015872069690E48400EA420131FEC56C0A6AE2FBC000E4840DF1001300CEB56C0357F806ADB0D4840435B7F7985EA56C07F7B92764A0E48400D22F98D33EA56C0DBCC5A09AA0E4840882BC45FA2E956C032153D42380E4840A2888A8A96E956C0542645A72C0D484082C6B82535E956C053801F0EB90C48406F43AB4E91E856C0E1E6FEC5B10C4840A911063462E756C06449D8FC140D4840445490B4D1E556C0D6BC0C001F0D4840AC0DC4B464E456C0191A3E1FCA0D484027C3B6B7DBE356C092F2374DC80D48404C2CFBB999E356C01BB32C2A5A0D4840DBD83752C1E356C061154A21F50C484059E362886BE456C0ADE2FF8B440C48404D6400EAC2E456C08EB9D480210A4840F6EEBC1CD0E456C0802885FDCD084840A58FE45CBEE456C033FC5639D30548404864022E74E456C0461C0005C1054840C9B1217B1DE356C0748018629C064840BEBB78BB9EDF56C0CE075A748C08484097259A3D13DE56C0D7EF20B67F08484001FD1B9672DD56C046A33A94F008484007BCBB27F3DC56C006068A42CB08484093429EBB31DC56C084765AFD3A064840AF36FDFBB2DA56C0E10DF58C90064840BB01A2180DD956C0BEF9D314600748400888C1CD21D856C0BA9DC6919F0848404C32C97125D656C05384202E1D0948406EEE704757D556C0C3137F97FA084840F7BB57B5B0D456C08D2B968C6A09484055CE62002FD256C09BF6720F98094840C0D873504FD056C0E69901008C0A48406F124FFB8CCD56C05250AE40A00D48401AE5CAF399CC56C0E2EA0D9B970F48401D8D8DD765CB56C08E25C05428104840A7655B1B84CA56C07E34D2306E11484074D26CD30FC956C097F2C561E3124840FD2BFD28F8C856C00430696071134840ADD2FDDC2DC956C015C64D9EA1134840ED4C596CF0C856C07E732EA706144840768FFDCAD0C756C093479ED0881448407AA4268C54C556C04513FA5D20174840654A85E876C456C02C8940EE2E1748406F8397FE29C456C0C4DB6787A21748401958526E1BC456C0E4C0DCCEF01748402E3CC3B0C7C356C0C00B9209171848404777FEA841C256C0BEF5F60F2B184840BA58A70CC4C156C0A43452E173184840B74679690CC056C0485D68C25B1A484012E58F7204BF56C09397F266851B48404D53E2ED3EBE56C08FE7A0EB4A1C4840CFC65B20B9BB56C02288B276241D4840DA3CC85DC3BA56C04AB4352DAB1D4840F4CF87CA3DB956C0602469052E1F48402AF08F0EEFB856C0588CF90E4C1F4840279C9B3BA1B856C051C715B57A1E48403BE532DF7EB756C0935344CF831E4840F8D303E6B8B656C052CA67332C1F484039DF3F623FB656C0CE077AD72F1F48408444B876EDB556C0713480A48F1E484018A3BD6ED4B556C06551034E5B1C48409CFBE0EBA6B556C0993791451C194840F91F85B794B556C0287E43221B164840B0C5BEBCC9B456C0FF006786C316484018E09B323CB456C08AD6A9E10617484038D0843DCCB356C093B98DCECA164840E75DD5FA8CB356C00DF728BE7215484013ACAC154FB356C0075CDC8B8B1448408F6AD3509BB256C0C370D4B989144840ADB2FA3F1DB256C0FC954A4DA214484038688D7E06B256C0BC4315102B1448402B62EC841AB256C0982E04B8F1134840554571E21BB256C0EF2E8B6B01134840B832DD4D24B356C006A1699FED1148404CF26F8C0DB356C0E05554AA7D1148401F782A9493B256C06A5BBECE5D114840259BB2980FB256C08E883F48001048405D28C70973B156C0678DC0290E0F4840E6217B0213B156C0EE79577C7F0D4840BCFC51742FB456C01DF64F7C7F0D48405E9F54742FB456C0E1D89E1B740F48402A65B0C984B556C05D9F9B1B740F484081940EBE84B556C06A9060D72F134840EADE7DE0F0B656C0B71E5DD72F1348404524DDD4F0B656C0CC0C2293EB16484053B0947F9BB956C051951B93EB164840D5E4388B9BB956C020B6CCF3F614484058C5095868BA56C05EC5CAF3F6144840E75C075868BA56C0DAB754D72F134840967C368B9BB956C072A856D72F134840180B358B9BB956C049E243C61E124840CD9C6C742FB856C0975447C61E1248408AF25E742FB856C0B3205BBBFC074840295B89C3DFAD56C0D94C26A4FC07484056052FCFDFAD56C0EA2FEA1519074840AB61338462A356C0606603161907484066F5318462A356C0299BF0040806484096C241F023A256C01A97F3040806484026643FF023A256C0E87F7DE840044840642E3FA0DF9D56C0B3B787E84004484078D13CA0DF9D56C0069F11CC790248406FB083F5349B56C0A27E68C61E024840069F7CF5349B56C07E2F0671C9FC47408312450CA19C56C038CA0271C9FC4740534BE217A19C56C02987517C7FF54740935DA0D43AA656C0EA4D88937FF547407B96FEC83AA656C02509EA4385F847404D33204146AC56C0610B2C3E2AF847406786615846AC56C0B82F8FB5A1EF4740336AECE0CEAC56C0ACE88DB5A1EF4740B76391ECCEAC56C0E473C99E35EE4740D892923C13B156C09239BF9E35EE474040FC8F3C13B156C0894B70FF40EC4740ACF910FE29B556C07731B41641EC4740419113FE29B556C0901E03B635EE4740A762A42B02B856C04048FCB535EE47401CBFA62B02B856C03A3B70D2FCEF4740B3D595BF40B956C0A53C6DD2FCEF4740952335CB40B956C011715B774CEA4740C6D25E1B85C556C0DE988B8E4CEA4740693E601B85C556C04E649E9F5DEB4740BCA12832F1C656C0C0F49A9F5DEB4740B547CA3DF1C656C0A146FF6074E74740EE6DF97024C656C00635016174E747404A8B997C24C656C023B8B11C30E3474033AB2477C9D156C0F449E33330E347400281836BC9D156C0C39A307874E7474086003C1674D456C065232A7874E74740D44BDF2174D456C0C8167ACDC9E447405A5E038E35D756C0511DC1E4C9E44740D9C1008E35D756C0B7357245D5E247400351CD8824E256C0B357A55CD5E24740F744CE8824E256C0B87B06688BE34740A4942D3FCFE456C0F0FBFF678BE34740AD7F8B33CFE456C004699E8919E74740D5301C61A7E756C04E2DE5A019E7474040D57D55A7E756C00978D2619CEC47404EB913F5E5E856C0D06CCF619CEC47404FE971E9E5E856C0B1A4460658F0474016CE71392AED56C0A5303C0658F04740F999D02D2AED56C0A6764FBCB8F347402601D42002E056C0FD3E355B19F7474059E7FFBFF6D956C07900445B19F74740030460B4F6D956C0D9A27F1641FC4740EA3A7E7B68DA56C00F8D7E1641FC4740C68ADC6F68DA56C02531E0C646FF47405290961BF1E656C09A3A5EBB90FE4740ED8C3927F1E656C0A46CD58DB8FB47402D16664913E956C0F130D08DB8FB47404E020B5513E956C0AB7F598E4CFA4740733C6A5B02F056C0D577488E4CFA4740F6C5C64F02F056C07BEAD19EC9FC4740BABD0C9446F056C07A42D19EC9FC47400E8400C72FF056C0849033F41E0248406A85496CC9F156C08641E1F979024840344BA760C9F156C0B57BF4AFDA054840D7F0DE495DF056C092FDF7AFDA0548403D99E2495DF056C044F2A75A850848401E85D27D24FA56C0D1342B8985084840C57AD47D24FA56C07995EF9FF109484064227617BEFB56C0109FEB9FF109484022D57817BEFB56C02B713A3FE60B4840CB3F422E2AFD56C0A3EA363FE60B48408DF3442E2AFD56C0FF9583DEDA0D4840384B0D4596FE56C0B10E80DEDA0D4840B310E9C7C3FE56C0539DF5FAA10F4840E7C8FED8D4FF56C041F7F2FAA10F4840E72DA3E4D4FF56C0D0F77CDEDA0D484016EE3412AD0257C0EF9CC3F5DA0D4840A1643712AD0257C0BCE5EBFAA10F484039139367020457C0D64A3612A20F48409E8A9567020457C0DF925E176911484085A7A967020857C02353A22E691148402C9FAC67020857C0FEEFC9508B134840A44C08BD570957C0F89CC6508B1348409FC60ABD570957C0B3723A6D521548403E8B45F70D1657C09160688452154840F1044DF70D1657C02547CAD9A71A4840798EBA08691A57C01E58BFD9A71A4840790EBD08691A57C0AA4D35F66E1C4840E492BF69BE1B57C09BF331F66E1C48405CC9295EBE1B57C0F3D5B7B7852848400880ED25E91A57C036F12F17442648401C44137DD61A57C09FFB6F057A25484033A51E1BEC1757C0C5BAA8C00F1C4840D64F00A0441757C0C75F7E5A3C1C4840EA91DEEFD11657C0DA72D175241D4840F246354CF41357C0A8800365A61E48406CBA9308691157C03B0988322C1F48408057F5C2B21157C0E97A29019120484085572B33CA1257C06CF92C0BD52148405C3AEBE4411357C03EC16827092548407DEC8049101357C076B5FEA2D6264840D3E79D019C1357C0E304DAE37D2848401DC97D0FA31257C06A6DDCF0382B484068ED6D9BC81157C03763AF0E722C4840071C017C8A1057C0FE9BA56F102D48409D3D8EC9590E57C046980F43842C4840E21C10BA4D0D57C0624B1EB2BC2C484069F569C5030C57C0F9E843468E2C484015E0D7B6430B57C010C21864C72D484098812E67490A57C05BBAB690532E4840F7AE5093AF0957C065E5BA79542E48409C2220283A0957C02251A433782D484051BFBFDF9F0857C0B49924E55C2D4840', 13556, 'P204');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000001A0000009E930CCE680A57C0DFCF9D123606484063DF215C4C0357C08EC561FB350648405A10255C4C0357C0571260A08508484079F14534CF0057C0B73F66A085084840F44D4034CF0057C068F0F1DE6E044840EA302C34CFFC56C00023AEC76E044840E0D02634CFFC56C0D19F128985004840624C808924FE56C068B0BD06ECFE47402B94DF3FCF0057C0D716B706ECFE474063FE7F4BCF0057C0FD4769DF02FB4740611570DF0D0257C0A33366DF02FB4740E4F76ADF0D0257C0650EEF3A47F7474019FB59734C0357C060FAEB3A47F74740D928FE7E4C0357C098239D9B52F54740080ABBAD021857C0022705CA52F547400B847F96021857C07DD1046E7A024840A832B2BDEB1357C050060F6E7A02484087E8B4BDEB1357C092D45D0D6F0448409A300D62A70F57C04CC21AF66E0448408BDB1262A70F57C0BE098FB785084840FAB2AE56F10E57C09FCF90B785084840F26F5F62F10E57C0F5C16829A20F48404D9B5F12AD0A57C02CB12512A20F484033BD5512AD0A57C0A3709BB7850848407BC60FCE680A57C0B2644EA0850848409E930CCE680A57C0DFCF9D1236064840', 13557, 'P205');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000002900000039B04F6DAE8856C0EF9AC8F0590E48403411C4E4258856C025663F68D10D4840832EF6D1EA8756C06D876E657F0D48402D2993DDEA8756C04172E4ED070648406F135D05688656C050E086E25105484058AB5B05688656C038EB71D1400448406DF68455AC9256C09476A2E840044840019C8255AC9256C07C5B2CCC79024840F828E8B0A69756C0FC7C20CC790248408484EAB0A69756C0FB9696E840044840FF12283F8A9856C0A87794E8400448403AC8283F8A9856C006F11E71C9044840E70CF205B29556C01402C30A6306484010C6F605B29556C03334AF43F10948407B867ED9B7A056C0E4D29443F10948404278DBCDB7A056C06EB31D71C90C4840F4E0BE5926A056C04ED49D22AE0C4840ACC9FF7C279F56C09437A022AE0C484050CF40A0289E56C0A392DCB0910D4840815A7C26F39C56C0513C5E62760D48406AB43D980F9C56C024D67B08A50C4840ECC0C47B489A56C0829F6462760D4840CB0FAD6A379956C0E81D85A5DB0C4840DB4EB9BDCE9856C094D457EE9B0C4840E28188068F9856C0B74EA44B0A0C484035D57FCC219856C00C1F497AC10B4840FFCC7A2FEB9756C03FA9F6E2E50B4840A7CDFCF9F99656C08C53299A250C484027DA2790F69556C0953081CE370C48408A58E664DC9456C0856215912D0D484042B911FBD89356C0C6A89D7C7F0D484040ECCECFBE9256C002E8BD22AE0C4840B4333770929156C0480849AB360D4840B38AF9E1AE9056C041B6F576240D4840B7785385F98E56C00EE8AD19B60D484037B6FBCCDA8D56C09A225BE5A30D48409348745D7C8C56C048DE6082DA0D4840659BC6704B8B56C0EE2DEE0A630E48405AA4F9BCA88956C0CFA8C153230E4840B3EE83C1248956C0D24CF30A630E484039B04F6DAE8856C0EF9AC8F0590E4840', 13558, 'P206');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000003000000909E228788D85BC0BBD6DEA7AA0A43400000000000605BC0BBD6DEA7AAEA42403333333333C35AC0AC8F87BEBBBB4240', 23977, 'AR201(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000030000003333333333C35AC0AC8F87BEBBBB4240A39410ACAA3A5BC00000000000E04240909E228788D85BC0BBD6DEA7AA0A4340', 23978, 'AR201(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000005000000D6C743DFDD1D51C0BBD6DEA7AA8A47407061DD78776751C000000000000047402A38BC2022A251C0213D450E119146407061DD78770752C0BBD6DEA7AA4A4640CDCCCCCCCC6C52C0DFC2BAF1EEEE4540', 23985, 'AR204(SW)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000070000001EA9BEF38BE15DC01AA20A7F860547400BB3D0CE695F5DC0E9263108AC0447401EA9BEF38B715CC0B6F3FDD478F14640840F255AF2675BC0D73043E389E24640736891ED7C675BC0FC1C1F2DCE864740D0D38041D26C5CC0A4FD0FB0568F4740D9CEF753E36D5DC02F505260019A4740', 30545, 'AR337');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000009000000A5315A47550D5BC007D3307C44C43F40A5315A47550D5BC00000000000803F40022B8716D9225BC0D578E92631683F40A5315A47556D5BC06666666666663F400000000000805BC09A99999999793F400000000000805BC0C6F99B5088C83F408E01D9EBDD6D5BC0F92CCF83BBDB3F405BCEA5B8AA225BC00000000000E03F40A5315A47550D5BC007D3307C44C43F40', 24134, 'AR639A');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000005000000E275FD82DD8463C025E99AC9371B364005EFF5FF7B7F63C06AC6FDA25FE4354088E6F0FFD9B862C0B691A1197A923940BE874B8E3BBE62C0A7B393C151CA3940E275FD82DD8463C025E99AC9371B3640', 24202, 'AR901(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000005000000E275FD82DD8463C025E99AC9371B364005EFF5FF7B7F63C06AC6FDA25FE4354088E6F0FFD9B862C0B691A1197A923940BE874B8E3BBE62C0A7B393C151CA3940E275FD82DD8463C025E99AC9371B3640', 24203, 'AR901(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000007000000A6F27684D3D864C0DBC4C9FD0E3D35400ADEEBFFB7D864C08367E7D951FF3440BBE70A00DF2A64C0894B44AE8ADA34408B30EAFF41F563C07DD5253ED20935408D5DA27A6BF663C0B5A679C7294A3540641EF983812B64C0AAD4EC8156183540A6F27684D3D864C0DBC4C9FD0E3D3540', 24206, 'AR903(E)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E61000000100000007000000A6F27684D3D864C0DBC4C9FD0E3D35400ADEEBFFB7D864C08367E7D951FF3440BBE70A00DF2A64C0894B44AE8ADA34408B30EAFF41F563C07DD5253ED20935408D5DA27A6BF663C0B5A679C7294A3540641EF983812B64C0AAD4EC8156183540A6F27684D3D864C0DBC4C9FD0E3D3540', 24207, 'AR903(W)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000090000005E4BC8073DCC64C0904946CEC2063840B9420E004BCD64C0111148D3EAE737404029FFFFE47E64C0709C6F9FB02B3740849CF7FFB15764C093077D44A7B03640732A1900EA2E64C084A8B173898B3540F27B9BFEEC2B64C0A52C431CEBAA35406B82A8FB005464C0919BE1067CCE3640A4703D0AD77D64C0DA5548F9494D37405E4BC8073DCC64C0904946CEC2063840', 24208, 'AR904(NW)');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E610000001000000050000005E4BC8073D3159C08CDB68006FED4340E388B5F8140E59C02497FF907EE743408E588B4F011659C0F819170E847443409352D0ED253959C0B48EAA26887A43405E4BC8073D3159C08CDB68006FED4340', 25440, 'DEN-1');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000B000000C5C9FD0E45B153C061C3D32B65493D40253B3602F1AA53C0C6A70018CF403D4027F73B1405A653C072BF4351A02F3D4027F73B1405A653C02E1C08C902363B40253B3602F1AA53C040D9942BBC1B3B40C5C9FD0E45B153C0261E5036E5123B4013D55B035BB953C040D9942BBC1B3B4082397AFCDEBC53C02E1C08C902363B4082397AFCDEBC53C072BF4351A02F3D4013D55B035BB953C0C6A70018CF403D40C5C9FD0E45B153C061C3D32B65493D40', 25643, 'JSTARS 8A ORBIT');
INSERT INTO postgis.sua_airspace VALUES ('0103000020E6100000010000000B0000004A29E8F692EA53C0D21DC4CE14323D406B60AB048BE353C00EF8FC3042283D40AC5626FC52DF53C0D6390664AF0F3D40AC5626FC52DF53C0E700C11C3D1E3B406B60AB048BE353C0AD2F12DA72063B404A29E8F692EA53C0E5B33C0FEEFE3A4019E25817B7F353C0AD2F12DA72063B4069A9BC1DE1F653C0E700C11C3D1E3B4069A9BC1DE1F653C0D6390664AF0F3D4019E25817B7F353C00EF8FC3042283D404A29E8F692EA53C0D21DC4CE14323D40', 25644, 'JSTARS 8B ORBIT');


--
-- TOC entry 3944 (class 0 OID 18604)
-- Dependencies: 227
-- Data for Name: sua_airspace_type; Type: TABLE DATA; Schema: postgis; Owner: postgres
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
-- TOC entry 3945 (class 0 OID 18607)
-- Dependencies: 228
-- Data for Name: sua_sched_status; Type: TABLE DATA; Schema: postgis; Owner: postgres
--

INSERT INTO postgis.sua_sched_status VALUES ('W', 'Waiting to Start');
INSERT INTO postgis.sua_sched_status VALUES ('P', 'Pending Approval');
INSERT INTO postgis.sua_sched_status VALUES ('H', 'Activated for Use');


--
-- TOC entry 3952 (class 0 OID 18638)
-- Dependencies: 235
-- Data for Name: taf; Type: TABLE DATA; Schema: postgis; Owner: postgres
--



--
-- TOC entry 3954 (class 0 OID 32403)
-- Dependencies: 237
-- Data for Name: taf_forecast; Type: TABLE DATA; Schema: postgis; Owner: postgres
--



--
-- TOC entry 3946 (class 0 OID 18610)
-- Dependencies: 229
-- Data for Name: winds; Type: TABLE DATA; Schema: postgis; Owner: postgres
--



--
-- TOC entry 3961 (class 0 OID 0)
-- Dependencies: 222
-- Name: nexrad_counter_seq; Type: SEQUENCE SET; Schema: postgis; Owner: postgres
--

SELECT pg_catalog.setval('postgis.nexrad_counter_seq', 1, false);


--
-- TOC entry 3776 (class 2606 OID 17419)
-- Name: airspace_ob_ele airspace_ob_ele_pkey; Type: CONSTRAINT; Schema: postgis; Owner: postgres
--

ALTER TABLE ONLY postgis.airspace_ob_ele
    ADD CONSTRAINT airspace_ob_ele_pkey PRIMARY KEY (airspace_ob_ele_id);


--
-- TOC entry 3778 (class 2606 OID 17449)
-- Name: circles circles_pkey; Type: CONSTRAINT; Schema: postgis; Owner: postgres
--

ALTER TABLE ONLY postgis.circles
    ADD CONSTRAINT circles_pkey PRIMARY KEY (prod_id, rep_num);


--
-- TOC entry 3782 (class 2606 OID 17498)
-- Name: fisb_products fisb_products_pkey; Type: CONSTRAINT; Schema: postgis; Owner: postgres
--

ALTER TABLE ONLY postgis.fisb_products
    ADD CONSTRAINT fisb_products_pkey PRIMARY KEY (fisb_product_id);


--
-- TOC entry 3792 (class 2606 OID 18661)
-- Name: graphics graphics_pkey; Type: CONSTRAINT; Schema: postgis; Owner: postgres
--

ALTER TABLE ONLY postgis.graphics
    ADD CONSTRAINT graphics_pkey PRIMARY KEY (rep_num, prod_id, alt);


--
-- TOC entry 3802 (class 2606 OID 18699)
-- Name: nexrad nexrad_pkey; Type: CONSTRAINT; Schema: postgis; Owner: postgres
--

ALTER TABLE ONLY postgis.nexrad
    ADD CONSTRAINT nexrad_pkey PRIMARY KEY (coords, prod_id, block_num, maptime);


--
-- TOC entry 3780 (class 2606 OID 17489)
-- Name: overlay_geo_opt overlay_geo_opt_pkey; Type: CONSTRAINT; Schema: postgis; Owner: postgres
--

ALTER TABLE ONLY postgis.overlay_geo_opt
    ADD CONSTRAINT overlay_geo_opt_pkey PRIMARY KEY (overlay_geo_opt_id);


--
-- TOC entry 3794 (class 2606 OID 18659)
-- Name: pirep pirep_pkey; Type: CONSTRAINT; Schema: postgis; Owner: postgres
--

ALTER TABLE ONLY postgis.pirep
    ADD CONSTRAINT pirep_pkey PRIMARY KEY (rep_time, stn_call);


--
-- TOC entry 3796 (class 2606 OID 18657)
-- Name: sigairmet sigairmet_pkey; Type: CONSTRAINT; Schema: postgis; Owner: postgres
--

ALTER TABLE ONLY postgis.sigairmet
    ADD CONSTRAINT sigairmet_pkey PRIMARY KEY (prod_id, rep_num, stn_call);


--
-- TOC entry 3806 (class 2606 OID 33565)
-- Name: stations stations_pkey; Type: CONSTRAINT; Schema: postgis; Owner: postgres
--

ALTER TABLE ONLY postgis.stations
    ADD CONSTRAINT stations_pkey PRIMARY KEY (stn_call);


--
-- TOC entry 3784 (class 2606 OID 18655)
-- Name: sua_airspace sua_airspace_pkey; Type: CONSTRAINT; Schema: postgis; Owner: postgres
--

ALTER TABLE ONLY postgis.sua_airspace
    ADD CONSTRAINT sua_airspace_pkey PRIMARY KEY (airsp_id);


--
-- TOC entry 3786 (class 2606 OID 18653)
-- Name: sua_airspace_type sua_airspace_type_pkey; Type: CONSTRAINT; Schema: postgis; Owner: postgres
--

ALTER TABLE ONLY postgis.sua_airspace_type
    ADD CONSTRAINT sua_airspace_type_pkey PRIMARY KEY (sua_airsp_type);


--
-- TOC entry 3798 (class 2606 OID 32480)
-- Name: sua sua_pkey; Type: CONSTRAINT; Schema: postgis; Owner: postgres
--

ALTER TABLE ONLY postgis.sua
    ADD CONSTRAINT sua_pkey PRIMARY KEY (rep_num, sched_status);


--
-- TOC entry 3788 (class 2606 OID 18649)
-- Name: sua_sched_status sua_sched_status_pkey; Type: CONSTRAINT; Schema: postgis; Owner: postgres
--

ALTER TABLE ONLY postgis.sua_sched_status
    ADD CONSTRAINT sua_sched_status_pkey PRIMARY KEY (sua_status);


--
-- TOC entry 3804 (class 2606 OID 32410)
-- Name: taf_forecast taf_forecast_pkey; Type: CONSTRAINT; Schema: postgis; Owner: postgres
--

ALTER TABLE ONLY postgis.taf_forecast
    ADD CONSTRAINT taf_forecast_pkey PRIMARY KEY (stn_call, rep_time, taf_line_number);


--
-- TOC entry 3800 (class 2606 OID 18647)
-- Name: taf taf_pkey; Type: CONSTRAINT; Schema: postgis; Owner: postgres
--

ALTER TABLE ONLY postgis.taf
    ADD CONSTRAINT taf_pkey PRIMARY KEY (stn_call, rep_time);


--
-- TOC entry 3790 (class 2606 OID 18645)
-- Name: winds winds_pkey; Type: CONSTRAINT; Schema: postgis; Owner: postgres
--

ALTER TABLE ONLY postgis.winds
    ADD CONSTRAINT winds_pkey PRIMARY KEY (stn_call, issue_date);


-- Completed on 2021-07-03 16:02:01 EDT

--
-- PostgreSQL database dump complete
--

