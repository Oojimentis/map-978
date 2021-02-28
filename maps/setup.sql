--
-- PostgreSQL database dump
--

-- Dumped from database version 10.15 (Ubuntu 10.15-1.pgdg18.04+1)
-- Dumped by pg_dump version 10.15 (Ubuntu 10.15-1.pgdg18.04+1)

-- Started on 2021-01-26 15:32:27 EST

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
-- TOC entry 8 (class 2615 OID 16395)
-- Name: postgis; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA postgis;


ALTER SCHEMA postgis OWNER TO postgres;

--
-- TOC entry 1 (class 3079 OID 13039)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 4401 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 2 (class 3079 OID 16396)
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA postgis;


--
-- TOC entry 4402 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 217 (class 1259 OID 18422)
-- Name: airspace_ob_ele; Type: TABLE; Schema: postgis; Owner: postgres
--

CREATE TABLE postgis.airspace_ob_ele (
    airspace_ob_ele_id integer NOT NULL,
    airspace_ob_ele_desc text NOT NULL
);


ALTER TABLE postgis.airspace_ob_ele OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 18406)
-- Name: fisb_products; Type: TABLE; Schema: postgis; Owner: postgres
--

CREATE TABLE postgis.fisb_products (
    fisb_product_id integer NOT NULL,
    fisb_product_desc text NOT NULL
);


ALTER TABLE postgis.fisb_products OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 18456)
-- Name: graphics; Type: TABLE; Schema: postgis; Owner: postgres
--

CREATE TABLE postgis.graphics (
    coords postgis.geometry,
    alt integer NOT NULL,
    ob_ele character varying,
    rep_num integer NOT NULL,
    prod_id integer NOT NULL,
    start_date character varying,
    stop_date character varying,
    geo_overlay_opt integer NOT NULL
);


ALTER TABLE postgis.graphics OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 17942)
-- Name: metar; Type: TABLE; Schema: postgis; Owner: postgres
--

CREATE TABLE postgis.metar (
    stn_call character(5) NOT NULL,
    ob_date character(15) NOT NULL,
    temp integer,
    windsp integer,
    winddir integer,
    altimeter numeric,
    visby numeric,
    dewp integer
);


ALTER TABLE postgis.metar OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 18432)
-- Name: nexrad; Type: TABLE; Schema: postgis; Owner: postgres
--

CREATE TABLE postgis.nexrad (
    counter integer NOT NULL,
    prod_id integer NOT NULL,
    nexrad character varying NOT NULL,
    maptype character varying NOT NULL,
    scale_factor integer NOT NULL,
    lat_n integer NOT NULL,
    lon_w integer NOT NULL,
    lat_size integer NOT NULL,
    lon_size integer NOT NULL,
    level integer,
    block_data character varying NOT NULL,
    maptime character varying NOT NULL
);


ALTER TABLE postgis.nexrad OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 18430)
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
-- TOC entry 4403 (class 0 OID 0)
-- Dependencies: 218
-- Name: nexrad_counter_seq; Type: SEQUENCE OWNED BY; Schema: postgis; Owner: postgres
--

ALTER SEQUENCE postgis.nexrad_counter_seq OWNED BY postgis.nexrad.counter;


--
-- TOC entry 216 (class 1259 OID 18414)
-- Name: overlay_geo_opt; Type: TABLE; Schema: postgis; Owner: postgres
--

CREATE TABLE postgis.overlay_geo_opt (
    overlay_geo_opt_id integer NOT NULL,
    overlay_geo_opt_desc text NOT NULL
);


ALTER TABLE postgis.overlay_geo_opt OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 18439)
-- Name: pirep; Type: TABLE; Schema: postgis; Owner: postgres
--

CREATE TABLE postgis.pirep (
    rep_type character varying(20) NOT NULL,
    fl_lev character varying(10),
    ac_type character varying(10),
    cloud character varying(50),
    weather character varying(30),
    temperature character varying(10),
    wind_spd_dir character varying(15),
    turbulence character varying(30),
    icing character varying(30),
    remarks character varying(100),
    location character varying(30),
    rep_time character varying(15) NOT NULL,
    stn_call character varying(5) NOT NULL
);


ALTER TABLE postgis.pirep OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 19380)
-- Name: sigairmet; Type: TABLE; Schema: postgis; Owner: postgres
--

CREATE TABLE postgis.sigairmet (
    prod_id integer NOT NULL,
    rep_num integer NOT NULL,
    text_data character varying,
    stn_call character varying(5) NOT NULL,
    rep_time character varying
);


ALTER TABLE postgis.sigairmet OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 17967)
-- Name: stations; Type: TABLE; Schema: postgis; Owner: postgres
--

CREATE TABLE postgis.stations (
    coords postgis.geometry NOT NULL,
    stn_call character(5) NOT NULL,
    stn_loc character(70) NOT NULL,
    lat numeric NOT NULL,
    lng numeric NOT NULL,
    state character(3) NOT NULL
);


ALTER TABLE postgis.stations OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 19412)
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
-- TOC entry 4236 (class 2604 OID 18435)
-- Name: nexrad counter; Type: DEFAULT; Schema: postgis; Owner: postgres
--

ALTER TABLE ONLY postgis.nexrad ALTER COLUMN counter SET DEFAULT nextval('postgis.nexrad_counter_seq'::regclass);


--
-- TOC entry 4387 (class 0 OID 18422)
-- Dependencies: 217
-- Data for Name: airspace_ob_ele; Type: TABLE DATA; Schema: postgis; Owner: postgres
--

COPY postgis.airspace_ob_ele (airspace_ob_ele_id, airspace_ob_ele_desc) FROM stdin;
0	Temporary Flight Restriction
1	Turbulence
2	Low Level Wind Shear
3	Surface Winds
4	Icing
5	Freezing Level
6	IFR Conditions
7	Mountain Obscuration
8	Future Use (8)
9	Future Use(9)
10	Future Use(10)
11	Future Use(11)
12	Future Use(12)
13	Future Use(13)
14	Future Use(14)
15	Future Use(15)
16	Future Use(16)
17	Future Use(17)
18	Future Use(18)
19	Future Use(19)
20	Future Use(20)
21	Future Use(21)
22	Future Use(22)
23	Future Use(23)
24	Future Use(24)
25	Future Use(25)
26	Future Use(26)
27	Future Use(27)
28	Future Use(28)
29	Future Use(29)
30	Future Use(30)
31	Future Use(31)
\.


--
-- TOC entry 4385 (class 0 OID 18406)
-- Dependencies: 215
-- Data for Name: fisb_products; Type: TABLE DATA; Schema: postgis; Owner: postgres
--

COPY postgis.fisb_products (fisb_product_id, fisb_product_desc) FROM stdin;
8	NOTAM
11	AIRMET
12	SIGMET
13	SUA
14	G-AIRMET
15	CWA
63	Regional NEXRAD
64	CONUS NEXRAD
70	Icing Forecast - Low
71	Icing Forecast - High
84	Cloud Tops
90	Turbulence Forecast - Low
91	Turbulence Forecast - High
103	Lightning
413	Generic Textual Data Product
\.


--
-- TOC entry 4391 (class 0 OID 18456)
-- Dependencies: 221
-- Data for Name: graphics; Type: TABLE DATA; Schema: postgis; Owner: postgres
--

COPY postgis.graphics (coords, alt, ob_ele, rep_num, prod_id, start_date, stop_date, geo_overlay_opt) FROM stdin;
\.


--
-- TOC entry 4383 (class 0 OID 17942)
-- Dependencies: 213
-- Data for Name: metar; Type: TABLE DATA; Schema: postgis; Owner: postgres
--

COPY postgis.metar (stn_call, ob_date, temp, windsp, winddir, altimeter, visby, dewp) FROM stdin;
\.


--
-- TOC entry 4389 (class 0 OID 18432)
-- Dependencies: 219
-- Data for Name: nexrad; Type: TABLE DATA; Schema: postgis; Owner: postgres
--

COPY postgis.nexrad (counter, prod_id, nexrad, maptype, scale_factor, lat_n, lon_w, lat_size, lon_size, level, block_data, maptime) FROM stdin;
\.


--
-- TOC entry 4386 (class 0 OID 18414)
-- Dependencies: 216
-- Data for Name: overlay_geo_opt; Type: TABLE DATA; Schema: postgis; Owner: postgres
--

COPY postgis.overlay_geo_opt (overlay_geo_opt_id, overlay_geo_opt_desc) FROM stdin;
0	No Geometry
1	High Resolution 3D Polygon
2	Extended Range 3D Polygon (MSL)
3	Extended Range 3D Polygon (AGL)
4	Low Resolution 2D Ellipse
5	High Resolution 3D Ellipse
6	Extended Range Circular Prism (MSL)
7	Extended Range Circular Prism (AGL)
8	Extended Range 3D Point (AGL)
9	Extended Range 3D Point (MSL)
10	Extended Range 3D Polyline (MSL)
11	Extended Range 3D Polyline (AGL)
12	Future Use
13	Future Use
14	Future Use
\.


--
-- TOC entry 4390 (class 0 OID 18439)
-- Dependencies: 220
-- Data for Name: pirep; Type: TABLE DATA; Schema: postgis; Owner: postgres
--

COPY postgis.pirep (rep_type, fl_lev, ac_type, cloud, weather, temperature, wind_spd_dir, turbulence, icing, remarks, location, rep_time, stn_call) FROM stdin;
\.


--
-- TOC entry 4392 (class 0 OID 19380)
-- Dependencies: 222
-- Data for Name: sigairmet; Type: TABLE DATA; Schema: postgis; Owner: postgres
--

COPY postgis.sigairmet (prod_id, rep_num, text_data, stn_call, rep_time) FROM stdin;
\.


--
-- TOC entry 4234 (class 0 OID 16696)
-- Dependencies: 199
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: postgis; Owner: postgres
--

COPY postgis.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- TOC entry 4384 (class 0 OID 17967)
-- Dependencies: 214
-- Data for Name: stations; Type: TABLE DATA; Schema: postgis; Owner: postgres
--

COPY postgis.stations (coords, stn_call, stn_loc, lat, lng, state) FROM stdin;
0101000020E6100000A01A2FDD24F263C09A99999999594F40	PAHX 	\tShageluk Airport-Shageluka, AK\t                                      	62.7	-159.567	AK 
0101000020E6100000355EBA490CD260C004560E2DB22D4D40	PAJN 	\tJuneau International Airport-Juneau, AK\t                             	58.357	-134.564	AK 
0101000020E6100000DF4F8D976E2E62C03BDF4F8D973E4E40	PACV 	\tMerle K. (Mudhole) Smith Airport-Cordova, AK\t                        	60.489	-145.451	AK 
0101000020E610000077BE9F1A2FA563C046B6F3FDD4B85040	PAGH 	\tShungnak Airport-Shungnak, AK\t                                       	66.888	-157.162	AK 
0101000020E6100000F4FDD478E9BE55C0CDCCCCCCCC2C4040	KSEM 	\tSelma Airport-Selma, AL\t                                             	32.35	-86.983	AL 
0101000020E6100000DD240681959355C0BC74931804964040	KSCD 	\tSylacauga, AL\t                                                       	33.172	-86.306	AL 
0101000020E6100000EE7C3F355EB255C0DF4F8D976E524140	KHSV 	\tHuntsville International Airport, AL\t                                	34.644	-86.787	AL 
0101000020E6100000EBC5504EB47152C08BFD65F7E4514440	K06A 	\tMoton Field Municipal Airport-Tuskegee, AL\t                          	40.6398	-73.77663	AL 
0101000020E6100000E3C798BB96A056C00EBE30992A084240	KPGR 	\tKirk Field Airport Paragould, AR\t                                    	36.0638	-90.5092	AR 
0101000020E6100000FCA9F1D24DFA5BC039B4C876BECF4040	KSDL 	\tScottsdale Airport-Scottsdale, AZ\t                                   	33.623	-111.911	AZ 
0101000020E61000004C378941604D5BC0D122DBF97E7A4040	KCFT 	\tGreenlee County Airport Clifton/Morenci, AZ\t                         	32.957	-109.209	AZ 
0101000020E6100000C520B07268915CC0F90FE9B7AF134140	KP20 	\tAvi Suquilla-Parker, AZ\t                                             	34.1538	-114.272	AZ 
0101000020E61000004A0C022B87665DC06DE7FBA9F1F24040	KAJO 	\tCorona Municipal Airport-Corona, CA\t                                 	33.898	-117.602	CA 
0101000020E610000062105839B4685DC0CDCCCCCCCCFC4040	KCNO 	\tChino Airport-Chino, CA\t                                             	33.975	-117.636	CA 
0101000020E6100000F4FDD478E9965DC07D3F355EBA194140	KBUR 	\tBob Hope Airport Burbank, CA\t                                        	34.201	-118.358	CA 
0101000020E6100000736891ED7C875EC0B29DEFA7C6BB4240	KPAO 	\tPalo Alto Airport-Santa Clara, CA\t                                   	37.467	-122.117	CA 
0101000020E61000000000000000905EC01904560E2DC24240	KSQL 	\tSan Carlos Airport-San Carlos, CA\t                                   	37.517	-122.25	CA 
0101000020E61000008FC2F5285C975EC08FC2F5285CCF4240	KSFO 	\tSan Francisco International-Burlingame, CA\t                          	37.62	-122.365	CA 
0101000020E61000005839B4C8764E5EC06F1283C0CAF14240	KSCK 	\tStockton Metropolitan Airport-Stockton, CA\t                          	37.889	-121.226	CA 
0101000020E6100000643BDF4F8D775DC04A0C022B87D64040	KSNA 	\tJohn Wayne Airport Santa Ana, CA\t                                    	33.676	-117.868	CA 
0101000020E6100000A8C64B3789F95AC054E3A59BC4404340	KMTJ 	\tMontrose Regional-Montrose, CO\t                                      	38.506	-107.899	CO 
0101000020E6100000289B7285776752C0545227A089884440	K5B3 	\tPutnam, CT\t                                                          	41.0667	-73.61667	CT 
0101000020E61000005BCEA5B8AA0A52C00000000000E04440	K5B0 	\tMansfield, CT\t                                                       	41.75	-72.16667	CT 
0101000020E6100000E3A59BC4204852C0A245B6F3FD944440	KBDR 	\tIgor I. Sikorsky Memorial Airport-Bridgeport, CT\t                    	41.164	-73.127	CT 
0101000020E610000054E3A59BC43852C06F1283C0CAA14440	KHVN 	\tTweed-New Haven Airport-New Haven, CT\t                               	41.264	-72.887	CT 
0101000020E61000004260E5D0220352C0448B6CE7FBA94440	KGON 	\tGroton-New London Airport-Groton / New London, CT\t                   	41.328	-72.049	CT 
0101000020E6100000F4FDD478E95E52C0736891ED7CAF4440	KDXR 	\tDanbury Municipal Airport-Danbury, CT\t                               	41.371	-73.483	CT 
0101000020E6100000AAF1D24D622052C0FED478E926B14440	KSNC 	\tChester Airport-Chester, CT\t                                         	41.384	-72.506	CT 
0101000020E61000008D976E12834852C0E7FBA9F1D2BD4440	KOXC 	\tWaterbury-Oxford Airport-Oxford, CT\t                                 	41.483	-73.133	CT 
0101000020E6100000A245B6F3FD3452C0E17A14AE47C14440	KMMK 	\tMeriden Markham Municipal Airport-Meriden, CT\t                       	41.51	-72.828	CT 
0101000020E61000008B6CE7FBA92952C091ED7C3F35DE4440	KHFD 	\tHartford-Brainard Airport-Hartford, CT\t                              	41.736	-72.651	CT 
0101000020E6100000B29DEFA7C60B52C0E5D022DBF9DE4440	KIJD 	\tWindham Airport-Willimantic, CT\t                                     	41.742	-72.184	CT 
0101000020E6100000CFF753E3A52B52C0F2D24D6210F84440	KBDL 	\tBradley International Airport-Windsor Locks, CT\t                     	41.938	-72.682	CT 
0101000020E61000000B98C0ADBB3B53C0CDCCCCCCCC6C4340	KWBC 	\tNews Headquarters, DC\t                                               	38.85	-76.93333	DC 
0101000020E610000033333333336353C0CDCCCCCCCC8C4340	KZDC 	\tWashington-ARTCC, DC\t                                                	39.1	-77.55	DC 
0101000020E6100000C1CAA145B6DB52C0B4C876BE9F6A4340	KDOX 	\tDover-Ellendale, DE\t                                                 	38.833	-75.433	DE 
0101000020E61000006666666666E652C088855AD3BC9B4340	K33N 	\tDover-Cheswold Airpark, DE\t                                          	39.2167	-75.6	DE 
0101000020E61000003F355EBA491454C07D3F355EBAC93940	KMIA 	\tMiami International Airport, FL\t                                     	25.788	-80.317	FL 
0101000020E6100000B29DEFA7C6A354C02DB29DEFA7663B40	KSRQ 	\tSarasota-Bradenton-Sarasota,Fl\t                                      	27.401	-82.559	Fl 
0101000020E61000008716D9CEF75B54C00AD7A3703D4A3C40	KISM 	\tKissimmee Gateway-Orlando, FL\t                                       	28.29	-81.437	FL 
0101000020E6100000560E2DB29D4F54C048E17A14AEC73C40	KSFB 	\tOrlando Sanford International Airport-Orlando, FL\t                   	28.78	-81.244	FL 
0101000020E610000023DBF97E6A6C54C01F85EB51B87E3E40	KJAX 	\tJacksonville International Airport, Jacksonville, FL\t                	30.495	-81.694	FL 
0101000020E6100000C2340C1F117154C06666666666263A40	KAPF 	\tNaples Airplort, FL\t                                                 	26.15	-81.76667	FL 
0101000020E61000003CBD5296217A54C06DE7FBA9F1B23E40	KZJX 	\tHilliard Jacksonville ARTCC, FL\t                                     	30.699	-81.9083	FL 
0101000020E6100000B0726891ED4C54C054E3A59BC4104040	KSAV 	\tSavannah/Hilton Head International Airport, GA\t                      	32.131	-81.202	GA 
0101000020E61000003F355EBA493C55C0355EBA490C424040	KCSG 	\tColumbus Airport, COlumbus, GA\t                                      	32.516	-84.942	GA 
0101000020E61000001B2FDD2406A154C0A4703D0AD7C34040	KHQU 	\tThomson-Mcduffie County Airpot, Thomson, GA\t                         	33.53	-82.516	GA 
0101000020E610000017D9CEF7531355C00000000000F04040	KPDK 	\tDeKalb-Peachtree Airport-Chamblee, GA\t                               	33.875	-84.302	GA 
0101000020E6100000289B728577B754C024287E8CB97B3F40	KDQH 	\tDouglas Municipal Gene Chambers Airport-Douglas, GA\t                 	31.4833	-82.86667	GA 
0101000020E6100000CDCCCCCCCC345CC0A01A2FDD24664540	KU01 	\tAmerican Falls Airport-American Falls, ID\t                           	42.798	-112.825	ID 
0101000020E6100000B29DEFA7C66B56C05C8FC2F528EC4340	KSPI 	\tAbraham Lincoln Capital Airport, Springfield, IL\t                    	39.845	-89.684	IL 
0101000020E6100000D8648D7A88F855C00000000000004540	KCHI 	\tChicago-WSFO, IL\t                                                    	42	-87.88333	IL 
0101000020E6100000B29DEFA7C66B56C02FDD240681554440	KPIA 	\tGeneral Downing-Peoria International Airport, Peoria, IL\t            	40.668	-89.684	IL 
0101000020E6100000A69BC420B00A56C00000000000C04440	KJOT 	\tJoliet Regional Airport, Joliet,Il\t                                  	41.5	-88.167	IL 
0101000020E6100000CFF753E3A5FB55C07B14AE47E1FA4440	KORD 	\tO"Hare International-Chicago, IL\t                                    	41.96	-87.932	IL 
0101000020E61000003D0AD7A3707556C0F6285C8FC2454340	KBLV 	\tScott AFB/Midamerica Airport Belleville, IL\t                         	38.545	-89.835	IL 
0101000020E6100000D34D621058E155C01283C0CAA1054340	KEVV 	\tEvansville Regional Airport, IN\t                                     	38.044	-87.521	IN 
0101000020E6100000B29DEFA7C6D355C060E5D022DBB94340	KHUF 	\tTerre Haute Regional Airport-Terre Haute, IN\t                        	39.452	-87.309	IN 
0101000020E6100000355EBA490C9255C0CDCCCCCCCCDC4340	KIND 	\tIndianapolis International Airport, IN\t                              	39.725	-86.282	IN 
0101000020E6100000C2340C1F11B155C088855AD3BC5B4440	KMCX 	\tMontcello/White, IN\t                                                 	40.7167	-86.76667	IN 
0101000020E610000077BE9F1A2F4D55C03F355EBA497C4440	KFWA 	\tFort Wayne, IN\t                                                      	40.971	-85.206	IN 
0101000020E61000003F355EBA49A45AC04C37894160954140	KZAB 	\tAlbuquerque Center Weather Service Unit, NM\t                         	35.167	-106.567	NM 
0101000020E61000006FF085C954855DC0454772F90F514140	KZLA 	\tLos Angeles Center Weather Service Unit , CA\t                        	34.6333	-118.0833	CA 
0101000020E61000000B98C0ADBB4B57C0454772F90F514640	KZMP 	\tMinneapolis Center Weather Service Unit, MN\t                         	44.6333	-93.18333	MN 
0101000020E61000004260E5D0229B55C0EC51B81E857B4240	KBWG 	\tBowling Green-Warren County Regional Airport-Bowling Green, KY\t      	36.965	-86.424	KY 
0101000020E61000009EEFA7C64B6F55C0BA490C022B174340	KSDF 	\tLouisville International, KY\t                                        	38.181	-85.739	KY 
0101000020E6100000D122DBF97E6A55C077BE9F1A2F1D4340	KLOU 	\tBowman Field Airport, Louisville, KY\t                                	38.228	-85.664	KY 
0101000020E61000005EBA490C022B55C01283C0CAA1854340	KCVG 	\tCovington, KY\t                                                       	39.044	-84.672	KY 
0101000020E6100000B4C876BE9F0257C0355EBA490C424040	KMLU 	\tMonroe Regional Airport-Monroe, LA\t                                  	32.516	-92.041	LA 
0101000020E6100000D8648D7A88C851C09A99999999F94440	KBOX 	\tBoston-Taunton, MA\t                                                  	41.95	-71.13333	MA 
0101000020E6100000D8648D7A88C851C09A99999999F94440	KTAR 	\tBoston-RFC, MA\t                                                      	41.95	-71.13333	MA 
0101000020E61000005BCEA5B8AAAA51C0CDCCCCCCCC0C4540	K3B2 	\tMarshfield, MA\t                                                      	42.1	-70.66667	MA 
0101000020E610000066666666665652C09A99999999194540	KGBR 	\tWalter J. Koladza Airport-Great Barrington, MA\t                      	42.2	-73.35	MA 
0101000020E6100000289B7285773752C0EEEBC03923224540	K7B2 	\tKnightville, MA\t                                                     	42.2667	-72.86667	MA 
0101000020E61000005BCEA5B8AA3A52C0454772F90F314540	KWOR 	\tWorthington, MA\t                                                     	42.3833	-72.91667	MA 
0101000020E6100000F5673F52440452C0211FF46C56354540	K8B5 	\tBarre Falls, MA\t                                                     	42.4167	-72.06667	MA 
0101000020E61000008E01D9EBDDFD51C0545227A089484540	KGDM 	\tGardner Municipal Airport-Gardner, MA\t                               	42.5667	-71.96667	MA 
0101000020E6100000289B728577F751C03333333333534540	K9B4 	\tAshburnham, MA\t                                                      	42.65	-71.86667	MA 
0101000020E61000000B98C0ADBB4B52C09A99999999594540	K2B6 	\tNorth Adams, MA\t                                                     	42.7	-73.18333	MA 
0101000020E61000005BCEA5B8AABA51C0545227A089684540	K2B2 	\tNewburyport, MA\t                                                     	42.8167	-70.91667	MA 
0101000020E610000096438B6CE78351C0AAF1D24D62A04440	KACK 	\tNantucket Memorial Airport-Nantucket, MA\t                            	41.253	-70.061	MA 
0101000020E61000008FC2F5285CA751C0FCA9F1D24DB24440	KMVY 	\tMartha"S Vineyard Airport-Vineyard Haven, MA\t                        	41.393	-70.615	MA 
0101000020E61000000C022B8716A151C03333333333D34440	KFMH 	\tOtis Air National Guard Base-Falmouth, MA\t                           	41.65	-70.517	MA 
0101000020E6100000D9CEF753E37D51C04C37894160D54440	KCHH 	\tChatham, MA\t                                                         	41.667	-69.967	MA 
0101000020E610000052B81E85EB9151C01283C0CAA1D54440	KHYA 	\tBarnstable Municipal Airport-Hyannis, MA\t                            	41.669	-70.28	MA 
0101000020E61000005A643BDF4FBD51C04A0C022B87D64440	KEWB 	\tNew Bedford Regional Airport-New Bedford, MA\t                        	41.676	-70.958	MA 
0101000020E6100000643BDF4F8D7F51C0F2D24D6210D84440	KCQX 	\tChatham Municipal Airport-Chatham, MA\t                               	41.688	-69.993	MA 
0101000020E6100000D34D621058C151C0E3A59BC420F04440	KTAN 	\tTaunton Municipal Airport-Taunton, MA\t                               	41.876	-71.021	MA 
0101000020E61000002DB29DEFA7AE51C014AE47E17AF44440	KPYM 	\tPlymouth Municipal Airport-Plymouth, MA\t                             	41.91	-70.729	MA 
0101000020E6100000A01A2FDD248E51C0F0A7C64B37094540	KPVC 	\tProvincetown Municipal Airport-Provincetown, MA\t                     	42.072	-70.221	MA 
0101000020E61000005EBA490C02AB51C0068195438B0C4540	KGHG 	\tMarshfield Municipal Airport -Marshfield, MA\t                        	42.098	-70.672	MA 
0101000020E6100000C1CAA145B6BB51C03333333333134540	KNZW 	\tSouth Weymouth, MA\t                                                  	42.15	-70.933	MA 
0101000020E6100000E7FBA9F1D22D52C04E62105839144540	KBAF 	\tWestfield-Barnes Regional Airport-Springfield, MA\t                   	42.158	-72.716	MA 
0101000020E61000004260E5D022CB51C09CC420B072184540	KOWD 	\tNorwood Memorial Airport-Norwood, MA\t                                	42.191	-71.174	MA 
0101000020E6100000273108AC1C2252C09A99999999194540	KCEF 	\tWestover Metropolitan Airport-Springfield, MA\t                       	42.2	-72.533	MA 
0101000020E61000009EEFA7C64BC751C04260E5D0221B4540	KMQE 	\tMilton/Blue Hills Observatory, MA\t                                   	42.212	-71.114	MA 
0101000020E61000001D5A643BDFF751C0A69BC420B0224540	KORH 	\tWorcester Regional Airport-Worcester, MA\t                            	42.271	-71.873	MA 
0101000020E6100000713D0AD7A3C051C091ED7C3F352E4540	KBOS 	\tLogan International Airport-Boston, MA\t                              	42.361	-71.01	MA 
0101000020E6100000D122DBF97E5252C02DB29DEFA7364540	KPSF 	\tPittsfield Municipal Airport-Pittsfield, MA\t                         	42.427	-73.289	MA 
0101000020E6100000D122DBF97ED251C05C8FC2F5283C4540	KBED 	\tLaurence G. Hanscom Field-Bedford, MA\t                               	42.47	-71.289	MA 
0101000020E6100000AAF1D24D62F051C02DB29DEFA7464540	KFIT 	\tFitchburg Municipal Airport-Fitchburg, MA\t                           	42.552	-71.756	MA 
0101000020E61000006666666666E651C07F6ABC7493484540	KAYE 	\tAyer, MA\t                                                            	42.567	-71.6	MA 
0101000020E6100000B4C876BE9F1252C0295C8FC2F5484540	KORE 	\tOrange Municipal Airport-Orange, MA\t                                 	42.57	-72.291	MA 
0101000020E6100000986E1283C0BA51C0986E1283C04A4540	KBVY 	\tBeverly Regional Airport-Beverly, MA\t                                	42.584	-70.918	MA 
0101000020E61000007B14AE47E14A52C0F0A7C64B37594540	KAQW 	\tHarriman-And-West Airport-North Adams, MA\t                           	42.697	-73.17	MA 
0101000020E61000000E2DB29DEFC751C0B29DEFA7C65B4540	KLWM 	\tLawrence Municipal Airport-Lawrence, MA\t                             	42.717	-71.124	MA 
0101000020E6100000FA7E6ABC741B53C01904560E2D124340	KNUI 	\tNaval Outlying Field Webster-Saint Inigoes, MD\t                      	38.142	-76.429	MD 
0101000020E6100000A69BC420B01A53C06666666666264340	KNHK 	\tNaval Air Station Patuxent River, MD\t                                	38.3	-76.417	MD 
0101000020E61000000E2DB29DEFC752C08195438B6C274340	KOXB 	\tOcean City Municipal Airport-Ocean City, MD\t                         	38.308	-75.124	MD 
0101000020E610000046B6F3FDD4E052C0CFF753E3A52B4340	KSBY 	\tSalisbury-Ocean City Regional Airport-Salisbury, MD\t                 	38.341	-75.513	MD 
0101000020E6100000273108AC1C0253C04E62105839444340	KCGE 	\tCambridge-Dorchester Regional Airport-Cambridge, MD\t                 	38.533	-76.033	MD 
0101000020E610000023DBF97E6A0453C0F4FDD478E9664340	KESN 	\tEaston Airport (Newnan Field)-Easton, MD\t                            	38.804	-76.069	MD 
0101000020E6100000736891ED7C3753C07F6ABC7493684340	KADW 	\tAndrews Air Force Base-Camp Springs, MD\t                             	38.817	-76.867	MD 
0101000020E61000005A643BDF4F1553C0B29DEFA7C67B4340	KW29 	\tStevensville, MD\t                                                    	38.967	-76.333	MD 
0101000020E61000008195438B6CF752C05C8FC2F5287C4340	KRJD 	\tRidgely Airpark-Ridgely, MD\t                                         	38.97	-75.866	MD 
0101000020E61000005EBA490C023B53C021B07268917D4340	KCGS 	\tCollege Park Airport-College Park, MD\t                               	38.981	-76.922	MD 
0101000020E61000001F85EB51B81E53C01F85EB51B87E4340	KNAK 	\tAnnapolis/Naval Academy, MD\t                                         	38.99	-76.48	MD 
0101000020E61000000C022B87163153C0B4C876BE9F8A4340	KFME 	\tTipton Airport-Fort Meade / Odenton, MD\t                             	39.083	-76.767	MD 
0101000020E6100000A69BC420B04A53C04C37894160954340	KGAI 	\tMontgomery County Airpark-Gaithersburg, MD\t                          	39.167	-77.167	MD 
0101000020E6100000B29DEFA7C62B53C0A01A2FDD24964340	KBWI 	\tBaltimore-Washington International-Baltimore, MD\t                    	39.173	-76.684	MD 
0101000020E6100000C976BE9F1A2753C08716D9CEF7A34340	KDMH 	\tBaltimore-Dwntwn, MD\t                                                	39.281	-76.611	MD 
0101000020E6100000A69BC420B01A53C0B4C876BE9FAA4340	KMTN 	\tMartin State Airport-Baltimore, MD\t                                  	39.333	-76.417	MD 
0101000020E61000008D976E12835853C04C37894160B54340	KFDK 	\tFrederick Municipal Airport-Frederick, MD\t                           	39.417	-77.383	MD 
0101000020E61000007B14AE47E10A53C023DBF97E6ABC4340	KAPG 	\tPhillips Army Airfield-Aberdeen Proving Ground, MD\t                  	39.472	-76.17	MD 
0101000020E61000000C022B8716B153C0CDCCCCCCCCCC4340	KCBE 	\tGreater Cumberland Regional Airport-Cumberland, MD\t                  	39.6	-78.767	MD 
0101000020E61000008D976E12834053C0E7FBA9F1D2CD4340	KDMW 	\tCarroll County Regional Airport-Westminster, MD\t                     	39.608	-77.008	MD 
0101000020E6100000CBA145B6F35D53C0C3F5285C8FD24340	KRSP 	\tNSF Thurmont, MD\t                                                    	39.645	-77.468	MD 
0101000020E61000001F85EB51B86E53C0EE7C3F355EDA4340	KHGR 	\tHagerstown Regional Airport-Hagerstown, MD\t                          	39.706	-77.73	MD 
0101000020E610000071AC8BDB682453C0FFB27BF2B0784340	KANP 	\tLee Airport-Annapolis, MD\t                                           	38.9429	-76.5689	MD 
0101000020E61000009FCDAACFD51253C027C286A757B24340	KEDG 	\tWeide Army Heliport-Edgewood Arsenal, Aberdeen Proving Ground, MD\t   	39.3933	-76.2943	MD 
0101000020E6100000F0A7C64B373D53C09CA223B9FC5F4340	KVKX 	\tPotomac Airfield-Friendly, MD\t                                       	38.7499	-76.9565	MD 
0101000020E610000033333333332353C0EACF7EA488284340	K2W6 	\tSt Marys (Duke), MD\t                                                 	38.31667	-76.55	MD 
0101000020E6100000289B728577C752C0EACF7EA488284340	KN80 	\tOcean City, MD\t                                                      	38.31667	-75.11667	MD 
0101000020E61000000B98C0ADBB3B53C00000000000604340	KW32 	\tClinton, MD\t                                                         	38.75	-76.93333	MD 
0101000020E61000000B98C0ADBB3B53C0CDCCCCCCCC6C4340	KWNB 	\tCamp Springs-DBC, MD\t                                                	38.85	-76.93333	MD 
0101000020E61000000B98C0ADBB3B53C0CDCCCCCCCC6C4340	KWNC 	\tCamp Springs-CPC, MD\t                                                	38.85	-76.93333	MD 
0101000020E61000000B98C0ADBB3B53C0CDCCCCCCCC6C4340	KWNH 	\tCamp Springs-HPC, MD\t                                                	38.85	-76.93333	MD 
0101000020E61000000B98C0ADBB3B53C0CDCCCCCCCC6C4340	KWNM 	\tCamp Springs-MPC, MD\t                                                	38.85	-76.93333	MD 
0101000020E61000000B98C0ADBB3B53C0CDCCCCCCCC6C4340	KWNO 	\tCamp Spring-NCEP, MD\t                                                	38.85	-76.93333	MD 
0101000020E61000003ECBF3E0EE3E53C00000000000C04340	KEMI 	\tWestminster, MD\t                                                     	39.5	-76.98333	MD 
0101000020E6100000A5315A4755D553C04963B48EAACA4340	K2G4 	\tOakland/Garrett County, MD\t                                          	39.58333	-79.33333	MD 
0101000020E61000008E01D9EBDD5D53C03333333333D34340	KDVD 	\tCamp David, MD\t                                                      	39.65	-77.46667	MD 
0101000020E61000005BCEA5B8AA5A53C01D03B2D7BBDB4340	K43M 	\tFort Ritchie-Sit, MD\t                                                	39.71667	-77.41667	MD 
0101000020E61000005BCEA5B8AA5A53C01D03B2D7BBDB4340	KJWX 	\tFort Ritchie, MD\t                                                    	39.71667	-77.41667	MD 
0101000020E6100000FFB27BF2B04051C0143FC6DCB5344640	KBST 	\tBelfast Municipal Airport-Belfast, ME\t                               	44.4118	-69.0108	ME 
0101000020E61000006F1283C0CA7B51C097FF907EFBF24540	KBXM 	\tBrunswick Executive Airport-Brunswick, ME\t                           	43.8983	-69.93425	ME 
0101000020E610000075029A081B2251C0E08442041CAE4640	KLRG 	\tLincoln Regional Airport-Lincoln, ME\t                                	45.36023	-68.5329	ME 
0101000020E61000001F4B1FBAA0DE50C07DD0B359F5594640	KMVM 	\tMachias Valley Airport-Machias, ME\t                                  	44.7028	-67.47856	ME 
0101000020E61000004CE0D6DD3C7751C000C63368E85B4640	KOWK 	\tCentral Maine Airport-Norridgewock, ME\t                              	44.71803	-69.86309	ME 
0101000020E6100000A301BC0512E450C06F8104C58F994640	KPNN 	\tPrinceton Municipal Airport-Princeton, ME\t                           	45.1997	-67.5636	ME 
0101000020E610000000000000000051C00000000000804540	K9B6 	\tSewel Ridge, ME\t                                                     	43	-68	ME 
0101000020E6100000289B728577A751C01630815B77B74540	KENE 	\tKennebunk Port, ME\t                                                  	43.43333	-70.61667	ME 
0101000020E610000000000000009051C0B0C91AF510F14540	KGYX 	\tGray-Portland, ME\t                                                   	43.88333	-70.25	ME 
0101000020E61000008E01D9EBDD6D51C01D03B2D7BBFB4540	K9B9 	\tWiscasset, ME\t                                                       	43.96667	-69.71667	ME 
0101000020E6100000CDCCCCCCCCBC51C07D96E7C1DDFD4540	KB20 	\tFreyburg, ME\t                                                        	43.98333	-70.95	ME 
0101000020E610000072FE261422A251C0E3FC4D2844444640	KRUM 	\tRumford, ME\t                                                         	44.53333	-70.53333	ME 
0101000020E61000000000000000C050C0B79C4B7155754640	K47B 	\tEastport, ME\t                                                        	44.91667	-67	ME 
0101000020E6100000289B7285776751C01630815B77774640	K2B7 	\tHarmony, ME\t                                                         	44.93333	-69.61667	ME 
0101000020E61000008E01D9EBDD8D51C04963B48EAA8A4640	KB21 	\tCarrabassett, ME\t                                                    	45.08333	-70.21667	ME 
0101000020E610000033333333336351C01D03B2D7BBBB4640	K3B1 	\tGreenville, ME\t                                                      	45.46667	-69.55	ME 
0101000020E61000003333333333F350C0E3FC4D2844044740	KCBW 	\tHoulton-88D, ME\t                                                     	46.03333	-67.8	ME 
0101000020E61000005A643BDF4FAD51C0DF4F8D976EB24540	KSFM 	\tSanford Seacoast Regional Airport-Sanford, ME\t                       	43.394	-70.708	ME 
0101000020E6100000FA7E6ABC749351C01904560E2DD24540	KPWM 	\tPortland International Jetport-Portland, ME\t                         	43.642	-70.304	ME 
0101000020E6100000C1CAA145B67B51C03333333333F34540	KNHZ 	\tBrunswick NAS, ME\t                                                   	43.9	-69.933	ME 
0101000020E610000021B07268916D51C008AC1C5A64FB4540	KIWI 	\tWiscasset Airport-Wiscasset, ME\t                                     	43.964	-69.712	ME 
0101000020E6100000E9263108ACBC51C0022B8716D9FE4540	KIZG 	\tEastern Slopes Regional Airport-Fryeburg, ME\t                        	43.991	-70.948	ME 
0101000020E6100000273108AC1C9251C06666666666064640	KLEW 	\tAuburn/Lewiston Municipal Airport-Auburn, ME\t                        	44.05	-70.283	ME 
0101000020E610000066666666664651C07F6ABC7493084640	KRKD 	\tKnox County Regional Airport-Rockland, ME\t                           	44.067	-69.1	ME 
0101000020E61000005EBA490C027351C09CC420B072284640	KAUG 	\tAugusta State Airport-Augusta, ME\t                                   	44.316	-69.797	ME 
0101000020E6100000736891ED7C1751C09A99999999394640	KBHB 	\tHancock County-Bar Harbor Airport-Bar Harbor, ME\t                    	44.45	-68.367	ME 
0101000020E6100000A69BC420B06A51C04E62105839444640	KWVL 	\tWaterville Robert Lafleur Airport-Waterville, ME\t                    	44.533	-69.667	ME 
0101000020E610000023DBF97E6A3451C0A01A2FDD24664640	KBGR 	\tBangor International Airport-Bangor, ME\t                             	44.798	-68.819	ME 
0101000020E61000000000000000C050C04C37894160754640	KEPM 	\tEastport Municipal Airport-Eastport, ME\t                             	44.917	-67	ME 
0101000020E6100000A69BC420B02A51C09A99999999794640	KOLD 	\tOld Town Municipal Airport-Old Town, ME\t                             	44.95	-68.667	ME 
0101000020E6100000C3F5285C8FAA51C0E5D022DBF97E4640	K8B0 	\tRangeley, ME\t                                                        	44.992	-70.665	ME 
0101000020E6100000AE47E17A146651C04260E5D022BB4640	KGNR 	\tGreenville Municipal, ME\t                                            	45.462	-69.595	ME 
0101000020E61000003108AC1C5A2C51C06DE7FBA9F1D24640	KMLT 	\tMillinocket Municipal Airport-Millinocket, ME\t                       	45.648	-68.693	ME 
0101000020E6100000986E1283C0F250C0AC1C5A643B0F4740	KHUL 	\tHoulton International Airport-Houlton, ME\t                           	46.119	-67.793	ME 
0101000020E6100000273108AC1C6251C0E5D022DBF94E4740	K40B 	\tClayton Lake, ME\t                                                    	46.617	-69.533	ME 
0101000020E610000033333333330351C08195438B6C574740	KPQI 	\tNorthern Maine Regional Airport-Presque Isle, ME\t                    	46.683	-68.05	ME 
0101000020E61000000C022B87160151C0736891ED7C6F4740	KCAR 	\tCaribou Municipal Airport-Caribou, ME\t                               	46.871	-68.017	ME 
0101000020E61000008D976E1283F850C09A99999999794740	KLIZ 	\tLoring AFB, ME\t                                                      	46.95	-67.883	ME 
0101000020E610000079E92631081451C0F853E3A59BA44740	KFVE 	\tNorthern Aroostook Regional Airport-Frenchville, ME\t                 	47.286	-68.313	ME 
0101000020E61000008E01D9EBDDAD54C00000000000A04540	KECK 	\tPeck, MI\t                                                            	43.25	-82.71667	MI 
0101000020E6100000289B7285771755C01D03B2D7BB3B4740	KSSM 	\tSault Ste Marie, MI\t                                                 	46.46667	-84.36667	MI 
0101000020E6100000BA490C022B8F55C0D9CEF753E3954540	KMKG 	\tMuskegon County Airport, MI\t                                         	43.171	-86.237	MI 
0101000020E61000005A643BDF4F6555C0022B8716D95E4640	KTVC 	\tCherry Capital Airport, Traverse City, MI\t                           	44.741	-85.583	MI 
0101000020E61000004260E5D022E355C08716D9CEF7434740	KMQT 	\tMarquette, MI\t                                                       	46.531	-87.549	MI 
0101000020E61000009EEFA7C64B1F56C01283C0CAA1954740	KCMX 	\tHoughton County Memorial Airport-Hancock, MI\t                        	47.169	-88.489	MI 
0101000020E61000005DFE43FAED9757C03EEDF0D764314740	K9Y2 	\tEast Gull Lake, MN\t                                                  	46.38589	-94.3739	MN 
0101000020E61000006ADE718A8E6857C0FB3A70CE88E24640	K18Y 	\tMilaca Municipal Airport, MN\t                                        	45.7698	-93.6337	MN 
0101000020E61000000E2DB29DEF9756C0AAF1D24D62604340	KSTL 	\tSt Louis/Lambert International Airport, MO\t                          	38.753	-90.374	MO 
0101000020E6100000CBA145B6F30D57C07F6ABC7493684340	KCOU 	\tColumbia Regional Airport-Columbia, MO\t                              	38.817	-92.218	MO 
0101000020E610000091ED7C3F35A657C0736891ED7C8F4340	KMKC 	\tCharles B. Wheeler Downtown Airport-Kansas City, MO\t                 	39.121	-94.597	MO 
0101000020E6100000508D976E12BB57C0508D976E12E34340	KSTJ 	\tRosecrans Memorial-St Joseph, MO\t                                    	39.774	-94.923	MO 
0101000020E6100000ACCABE2B82A756C0BEC1172653E14240	KH57 	\tBismark Memorial Airport-Bismark, MO\t                                	37.76035	-90.61732	MO 
0101000020E61000005BCEA5B8AAAA57C0E3FC4D2844A44340	KKCI 	\tKansas City International Airport, MO\t                               	39.28333	-94.66667	MO 
0101000020E61000009CC420B072D85BC0068195438BBC4740	KGTF 	\tGreat Falls, MT\t                                                     	47.473	-111.382	MT 
0101000020E6100000CDCCCCCCCC8453C0F4FDD478E9F64040	KSUT 	\tCape Fear Regional Jetport-Oak Island, NC\t                           	33.929	-78.075	NC 
0101000020E61000009A999999997953C0FCA9F1D24D224140	KILM 	\tWilmington International Airport-Wilmington, NC\t                     	34.268	-77.9	NC 
0101000020E6100000F6285C8FC2AD53C06DE7FBA9F1224140	KCPC 	\tColumbus County Municipal Airport-Whiteville, NC\t                    	34.273	-78.715	NC 
0101000020E6100000A245B6F3FDA453C0931804560E4D4140	KEYF 	\tCurtis L. Brown Jr. Field-Elizabethtown, NC\t                         	34.602	-78.578	NC 
0101000020E6100000B29DEFA7C6C353C0E7FBA9F1D24D4140	KLBT 	\tLumberton Municipal Airport-Lumberton, NC\t                           	34.608	-79.059	NC 
0101000020E6100000273108AC1C4253C08195438B6C574140	KNJM 	\tMarine Corps Auxiliary Landing Field Bogue-Swansboro, NC\t            	34.683	-77.033	NC 
0101000020E61000005C8FC2F5285C53C0B4C876BE9F5A4140	KNCA 	\tMarine Corps Air Station New River-Jacksonville, NC\t                 	34.708	-77.44	NC 
0101000020E6100000355EBA490C2A53C0E7FBA9F1D25D4140	KMRH 	\tMichael J. Smith Field-Beaufort, NC\t                                 	34.733	-76.657	NC 
0101000020E6100000736891ED7C3753C01904560E2D624140	KMHX 	\tMorehead-Newport, NC\t                                                	34.767	-76.867	NC 
0101000020E61000008195438B6CD753C04C37894160654140	KMEB 	\tLaurinburg-Maxton Airport-Maxton, NC\t                                	34.792	-79.366	NC 
0101000020E6100000736891ED7C6753C0B4C876BE9F6A4140	KOAJ 	\tAlbert J. Ellis Airport-Jacksonville, NC\t                            	34.833	-77.617	NC 
0101000020E61000007F6ABC7493F053C0355EBA490C724140	KRCZ 	\tRockingham, NC\t                                                      	34.891	-79.759	NC 
0101000020E61000008D976E12833853C03333333333734140	KNKT 	\tMarine Corps Air Station Cherry Point, NC\t                           	34.9	-76.883	NC 
0101000020E61000009EEFA7C64B9753C0B0726891ED7C4140	KCTZ 	\tClinton-Sampson County Airport-Clinton, NC\t                          	34.976	-78.364	NC 
0101000020E6100000B81E85EB51B853C0022B8716D97E4140	KFAY 	\tFayetteville Regional Airport-Fayetteville, NC\t                      	34.991	-78.88	NC 
0101000020E6100000022B8716D97E53C00000000000804140	KDPL 	\tDuplin County Airport-Kenansville, NC\t                               	35	-77.982	NC 
0101000020E61000005A643BDF4F0554C01904560E2D824140	KAFP 	\tAnson County Airport-Wadesboro, NC\t                                  	35.017	-80.083	NC 
0101000020E610000039B4C876BE2754C01904560E2D824140	KEQY 	\tMonroe Regional Airport-Monroe, NC\t                                  	35.017	-80.621	NC 
0101000020E6100000D9CEF753E31D53C01904560E2D824140	KNBT 	\tPiney Island/Bomb Range, NC\t                                         	35.017	-76.467	NC 
0101000020E61000000000000000E053C04E62105839844140	KHFF 	\tMackall Army Airfield-Camp Mackall, NC\t                              	35.033	-79.5	NC 
0101000020E6100000508D976E124353C062105839B4884140	KEWN 	\tCraven County Regional Airport-New Bern, NC\t                         	35.068	-77.048	NC 
0101000020E6100000C1CAA145B6BB53C01B2FDD2406914140	KFBG 	\tSimmons Army Airfield-Fort Bragg, NC\t                                	35.133	-78.933	NC 
0101000020E61000007F6ABC7493C053C083C0CAA145964140	KPOB 	\tPope Field (Military)-Fayetteville, NC\t                              	35.174	-79.009	NC 
0101000020E61000008FC2F5285CF754C0295C8FC2F5984140	KRHP 	\tWestern Carolina Regional Airport-Andrews, NC\t                       	35.195	-83.865	NC 
0101000020E6100000448B6CE7FB4954C0F0A7C64B37994140	KAKH 	\tGastonia Municipal Airport-Gastonia, NC\t                             	35.197	-81.156	NC 
0101000020E6100000894160E5D0DA54C0068195438B9C4140	K1A5 	\tMacon-Franklin, NC\t                                                  	35.223	-83.419	NC 
0101000020E610000085EB51B81E3D54C0E9263108AC9C4140	KCLT 	\tCharlotte/Douglas International Airport-Charlotte, NC\t               	35.224	-80.955	NC 
0101000020E61000002B8716D9CEE752C0E7FBA9F1D29D4140	KHSE 	\tBilly Mitchell Airport-Hatteras, NC\t                                 	35.233	-75.622	NC 
0101000020E61000001B2FDD2406D953C075931804569E4140	KSOP 	\tMoore County Airport-Southern Pines, NC\t                             	35.237	-79.391	NC 
0101000020E61000005839B4C8766654C054E3A59BC4A04140	KEHO 	\tShelby-Cleveland Regional Airport-Shelby, NC\t                        	35.256	-81.601	NC 
0101000020E61000008D976E12836853C07F6ABC7493A84140	KISO 	\tKinston Regional Jetport (Stallings Field)-Kinston, NC\t              	35.317	-77.633	NC 
0101000020E6100000F6285C8FC27D53C079E9263108AC4140	KGSB 	\tSeymour Johnson Air Force Base-Goldsboro, NC\t                        	35.344	-77.965	NC 
0101000020E6100000E5D022DBF9AE53C08D976E1283B04140	KHRJ 	\tHarnett Regional Jetport-Erwin, NC\t                                  	35.379	-78.734	NC 
0101000020E61000006891ED7C3F2D54C052B81E85EBB14140	KJQF 	\tConcord Regional Airport-Concord, NC\t                                	35.39	-80.707	NC 
0101000020E61000008B6CE7FBA90954C04C37894160B54140	KVUJ 	\tStanly County Airport-Albemarle, NC\t                                 	35.417	-80.151	NC 
0101000020E6100000A4703D0AD77B54C0105839B4C8B64140	KFQD 	\tRutherford County Airport-Rutherfordton, NC\t                         	35.428	-81.935	NC 
0101000020E6100000DF4F8D976EA254C09EEFA7C64BB74140	KAVL 	\tAsheville Regional Airport-Fletcher, NC\t                             	35.432	-82.538	NC 
0101000020E6100000F6285C8FC27D53C07B14AE47E1BA4140	KGWW 	\tGoldsboro-Wayne Municipal Airport-Goldsboro, NC\t                     	35.46	-77.965	NC 
0101000020E6100000FCA9F1D24D4A54C0E7FBA9F1D2BD4140	KIPJ 	\tLincolnton-Lincoln County Regional Airport-Lincolnton, NC\t           	35.483	-81.161	NC 
0101000020E6100000295C8FC2F59853C06891ED7C3FC54140	KJNX 	\tJohnston Regional Airport-Smithfield, NC\t                            	35.541	-78.39	NC 
0101000020E610000033333333334353C0295C8FC2F5C84140	KOCW 	\tWashington-Warren Airport-Washington, NC\t                            	35.57	-77.05	NC 
0101000020E61000005839B4C876C653C0D122DBF97ECA4140	KTTA 	\tSanford-Lee County Regional Airport-Sanford, NC\t                     	35.582	-79.101	NC 
0101000020E61000008D976E12835853C01B2FDD2406D14140	KPGV 	\tPitt-Greenville Airport-Greenville, NC\t                              	35.633	-77.383	NC 
0101000020E6100000E17A14AE472154C0A69BC420B0D24140	KRUQ 	\tMid-Carolina Regional Airport-Salisbury, NC\t                         	35.646	-80.52	NC 
0101000020E6100000E17A14AE47F953C0C1CAA145B6D34140	KHBI 	\tAsheboro Regional Airport-Asheboro, NC\t                              	35.654	-79.895	NC 
0101000020E6100000C74B378941E053C0273108AC1CDA4140	K5W8 	\tSiler City, NC\t                                                      	35.704	-79.504	NC 
0101000020E61000009CC420B0725854C0E5D022DBF9DE4140	KHKY 	\tHickory Regional Airport-Hickory, NC\t                                	35.742	-81.382	NC 
0101000020E61000006891ED7C3F3D54C052B81E85EBE14140	KSVH 	\tStatesville Regional Airport-Statesville, NC\t                        	35.765	-80.957	NC 
0101000020E6100000FA7E6ABC741354C08716D9CEF7E34140	KEXX 	\tDavidson County Airport-Lexington, NC\t                               	35.781	-80.304	NC 
0101000020E6100000C976BE9F1A6754C00C022B8716E94140	KMRN 	\tFoothills Regional Airport-Morganton, NC\t                            	35.821	-81.611	NC 
0101000020E6100000FED478E9267953C03D0AD7A370ED4140	KRWI 	\tRocky Mount-Wilson Regional Airport-Rocky Mount, NC\t                 	35.855	-77.893	NC 
0101000020E6100000355EBA490CB253C01904560E2DF24140	KRDU 	\tRaleigh-Durham International Airport-Raleigh, NC\t                    	35.892	-78.782	NC 
0101000020E6100000CDCCCCCCCCEC52C04C37894160F54140	KMQI 	\tDare County Regional Airport-Manteo, NC\t                             	35.917	-75.7	NC 
0101000020E61000006ABC749318C453C08195438B6CF74140	KIGX 	\tHorace Williams Airport-Chapel Hill, NC\t                             	35.933	-79.064	NC 
0101000020E61000005EBA490C026353C00E2DB29DEFF74140	KETC 	\tTarboro-Edgecombe Airport-Tarboro, NC\t                               	35.937	-77.547	NC 
0101000020E61000006DE7FBA9F1EA52C0FCA9F1D24D024240	KFFA 	\tFirst Flight Airport-Kill Devil Hills, NC\t                           	36.018	-75.671	NC 
0101000020E610000085EB51B81E9553C06DE7FBA9F1024240	KLHZ 	\tTriangle North Executive Airport-Louisburg, NC\t                      	36.023	-78.33	NC 
0101000020E61000003F355EBA492453C0DD24068195034240	KEDE 	\tNortheastern Regional Airport-Edenton, NC\t                           	36.028	-76.567	NC 
0101000020E61000004A0C022B87DE53C0BC74931804064240	KBUY 	\tBurlington-Alamance Regional Airport-Burlington, NC\t                 	36.047	-79.477	NC 
0101000020E61000003108AC1C5AFC53C023DBF97E6A0C4240	KGSO 	\tPiedmont Triad International Airport-Greensboro, NC\t                 	36.097	-79.943	NC 
0101000020E610000091ED7C3F350E54C0FED478E926114240	KINT 	\tSmith Reynolds Airport-Winston-Salem, NC\t                            	36.134	-80.222	NC 
0101000020E61000009A999999996954C09A99999999194240	KTNB 	\tBoone Watauga Ct, NC\t                                                	36.2	-81.65	NC 
0101000020E610000083C0CAA1454654C0068195438B1C4240	KUKF 	\tWilkes County Airport-North Wilkesboro, NC\t                          	36.223	-81.098	NC 
0101000020E610000033333333330B53C0C520B07268214240	KECG 	\tElizabeth City Regional Airport / Elizabeth City, NC\t                	36.261	-76.175	NC 
0101000020E6100000E5D022DBF9BE53C014AE47E17A244240	KTDF 	\tPerson County Airport-Roxboro, NC\t                                   	36.285	-78.984	NC 
0101000020E61000006DE7FBA9F14A53C0A01A2FDD24264240	KASJ 	\tTri-County Airport-Ahoskie, NC\t                                      	36.298	-77.171	NC 
0101000020E6100000713D0AD7A36853C00AD7A3703D2A4240	KIXA 	\tHalifax/Northampton, NC\t                                             	36.33	-77.635	NC 
0101000020E610000060E5D022DBA153C091ED7C3F352E4240	KHNZ 	\tHenderson-Oxford Airport-Oxford, NC\t                                 	36.361	-78.529	NC 
0101000020E61000001B2FDD24060153C0508D976E12334240	KONX 	\tCurrituck County Regional Airport-Currituck, NC\t                     	36.399	-76.016	NC 
0101000020E6100000894160E5D05A54C09EEFA7C64B374240	KGEV 	\tAshe County Airport-Jefferson, NC\t                                   	36.432	-81.419	NC 
0101000020E61000005839B4C876F653C00E2DB29DEF374240	KSIF 	\tRockingham County Nc Shiloh Airport-Stoneville, NC\t                  	36.437	-79.851	NC 
0101000020E61000003D0AD7A3706D53C0D578E92631384240	KRZZ 	\tHalifax County Airport-Roanoke Rapids, NC\t                           	36.439	-77.71	NC 
0101000020E610000008AC1C5A642354C07B14AE47E13A4240	KMWK 	\tMount Airy/Surry County Airport-Mount Airy, NC\t                      	36.46	-80.553	NC 
0101000020E610000033C4B12E6E4B53C0AED85F764FEE4140	KMCZ 	\tMartin County Airport-Williamston, NC\t                               	35.8618	-77.1786	NC 
0101000020E6100000B8AF03E78C3053C039B4C876BEE74140	KPMZ 	\tPlymouth Municipal Airport-Plymouth, NC\t                             	35.8105	-76.7586	NC 
0101000020E6100000E6AE25E4833254C05DFE43FAED234240	KZEF 	\tElkin Municipal Airport-Elkin, NC\t                                   	36.2807	-80.7893	NC 
0101000020E61000000B98C0ADBB9B53C07D96E7C1DDFD4040	KLTX 	\tShallotte-Wilm., NC\t                                                 	33.98333	-78.43333	NC 
0101000020E610000000000000008053C07D96E7C1DD5D4140	KACZ 	\tHenderson Field-Wallace, NC\t                                         	34.73333	-78	NC 
0101000020E6100000C2340C1F11F153C0B0C91AF510714140	K45J 	\tRockingham, NC\t                                                      	34.88333	-79.76667	NC 
0101000020E6100000CDCCCCCCCCEC52C03333333333934140	K44W 	\tDiamond Shores, NC\t                                                  	35.15	-75.7	NC 
0101000020E61000006666666666F654C01630815B77974140	K6A3 	\tAndrews, NC\t                                                         	35.18333	-83.85	NC 
0101000020E610000072FE261422E252C08369183E22A24140	KHAT 	\tCape Hatteras, NC\t                                                   	35.26667	-75.53333	NC 
0101000020E6100000CDCCCCCCCCCC54C0EACF7EA488A84140	K24A 	\tSylva, NC\t                                                           	35.31667	-83.2	NC 
0101000020E61000008E01D9EBDDAD53C05036E50AEFAE4140	K37W 	\tErwin-Harnett Co, NC\t                                                	35.36667	-78.71667	NC 
0101000020E6100000CDCCCCCCCCFC52C06666666666C64140	K7W6 	\tEngelhard/Hyde Connty, NC\t                                           	35.55	-75.95	NC 
0101000020E610000066666666660654C03333333333D34140	KW44 	\tAsheboro, NC\t                                                        	35.65	-80.1	NC 
0101000020E61000003ECBF3E0EE9E53C0B79C4B7155D54140	KRAX 	\tClayton-RDU 88D, NC\t                                                 	35.66667	-78.48333	NC 
0101000020E61000009A99999999F952C01630815B77D74140	K2DP 	\tDare County Gunnery Range, NC\t                                       	35.68333	-75.9	NC 
0101000020E61000000000000000E053C09A99999999D94140	KSCR 	\tSiler City Municipal Airport-Siler City, NC\t                         	35.7	-79.5	NC 
0101000020E610000072FE261422B253C05036E50AEFEE4140	KRAH 	\tRaleigh-WFO, NC\t                                                     	35.86667	-78.78333	NC 
0101000020E6100000F5673F5244B454C03333333333F34140	KHSS 	\tHot Springs, NC\t                                                     	35.9	-82.81667	NC 
0101000020E6100000C2340C1F110153C03333333333334240	K9W7 	\tCurrituck, NC\t                                                       	36.4	-76.01667	NC 
0101000020E61000006666666666F653C01630815B77374240	K78N 	\tReidsville, NC\t                                                      	36.43333	-79.85	NC 
0101000020E610000096438B6CE73358C06666666666764740	KFAR 	\tHector International Airport-Fargo, ND\t                              	46.925	-96.811	ND 
0101000020E61000003333333333535EC07F6ABC7493484340	KMHR 	\tJaffrey Airport-Silver Ranch, Jaffrey, NH\t                           	38.567	-121.3	NH 
0101000020E61000006B9A779CA21752C0F2B0506B9AAF4540	KCNH 	\tClaremont Municipal Airport-Claremont, NH\t                           	43.3719	-72.3693	NH 
0101000020E61000003480B74082CA51C0CC7F48BF7D654640	KERR 	\tErrol Airport-Errol, NH\t                                             	44.7929	-71.1642	NH 
0101000020E610000094F6065F98E051C0C364AA60549A4540	KOCN 	\tConcord Municipal Airport-Concord, NH\t                               	43.2057	-71.5093	NH 
0101000020E61000003ECBF3E0EEDE51C07D96E7C1DD5D4540	KZBW 	\tNashua-ARTCC-Bos, NH\t                                                	42.73333	-71.48333	NH 
0101000020E61000005BCEA5B8AABA51C0E3FC4D2844A44540	K6B1 	\tRochester, NH\t                                                       	43.28333	-70.91667	NH 
0101000020E6100000289B728577F751C08369183E22E24540	KNGR 	\tNorth Groton, NH\t                                                    	43.76667	-71.86667	NH 
0101000020E61000003333333333D351C03333333333F34540	KTMW 	\tTamworth, NH\t                                                        	43.9	-71.3	NH 
0101000020E6100000F5673F5244D451C09A99999999794640	K8B2 	\tDiamond Lake, NH\t                                                    	44.95	-71.31667	NH 
0101000020E61000000C022B8716E151C04E62105839644540	KASH 	\tNashua Airport (Boire Field)-Nashua, NH\t                             	42.783	-71.517	NH 
0101000020E6100000C74B3789410052C0D7A3703D0A674540	KAFN 	\tJaffrey Airport-Silver Ranch Airpark-Jaffrey, NH\t                    	42.805	-72.004	NH 
0101000020E61000000C022B87161152C03333333333734540	KEEN 	\tDillant-Hopkins Airport-Keene, NH\t                                   	42.9	-72.267	NH 
0101000020E610000096438B6CE7DB51C0D7A3703D0A774540	KMHT 	\tManchester-Boston Regional Airport-Manchester, NH\t                   	42.93	-71.436	NH 
0101000020E61000003F355EBA49B451C0B4C876BE9F8A4540	KPSM 	\tPortsmouth International Airport At Pease-Portsmouth, NH\t            	43.083	-70.817	NH 
0101000020E6100000D578E92631E051C00AD7A3703D9A4540	KCON 	\tConcord Municipal Airport-Concord, NH\t                               	43.205	-71.503	NH 
0101000020E61000005EBA490C02BB51C0DD24068195A34540	KDAW 	\tSkyhaven Airport-Rochester, NH\t                                      	43.278	-70.922	NH 
0101000020E6100000C1CAA145B6DB51C07F6ABC7493C84540	KLCI 	\tLaconia Municipal Airport-Laconia, NH\t                               	43.567	-71.433	NH 
0101000020E6100000EC51B81E851352C0E3A59BC420D04540	KLEB 	\tLebanon Municipal Airport-West Lebanon, NH\t                          	43.626	-72.305	NH 
0101000020E6100000C74B378941F051C0C1CAA145B6E34540	K1P1 	\tPlymouth Muni, NH\t                                                   	43.779	-71.754	NH 
0101000020E610000008AC1C5A64D351C0C3F5285C8F224640	KMWN 	\tMount Washington, NH\t                                                	44.27	-71.303	NH 
0101000020E61000007B14AE47E1E251C0C976BE9F1A2F4640	KHIE 	\tMount Washington Regional Airport-Whitefield, NH\t                    	44.368	-71.545	NH 
0101000020E6100000FA7E6ABC74CB51C07D3F355EBA494640	KBML 	\tBerlin Regional Airport-Berlin, NH\t                                  	44.576	-71.179	NH 
0101000020E6100000273108AC1CBA52C01B2FDD2406814340	KWWD 	\tCape Mayairport-Wildwood, NJ\t                                        	39.008	-74.908	NJ 
0101000020E6100000A245B6F3FDC452C0022B8716D9AE4340	KMIV 	\tMillville Municipal Airport-Millville, NJ\t                           	39.366	-75.078	NJ 
0101000020E61000003F355EBA49A452C060E5D022DBB94340	KACY 	\tAtlantic City International Airport-Atlantic City, NJ\t               	39.452	-74.567	NJ 
0101000020E6100000A69BC420B09252C0105839B4C8F64340	KMJX 	\tRobert J. Miller Air Park-Toms River, NJ\t                            	39.928	-74.292	NJ 
0101000020E6100000E7FBA9F1D2B552C09CC420B072F84340	KVAY 	\tSouth Jersey Regional Airport-Mount Holly, NJ\t                       	39.941	-74.841	NJ 
0101000020E61000006666666666A652C01904560E2D024440	KWRI 	\tMcguire Air Force Base-Wrightstown, NJ\t                              	40.017	-74.6	NJ 
0101000020E610000066666666669652C04E62105839044440	KNEL 	\tNaval Air Engineering Station-Lakehurst, NJ\t                         	40.033	-74.35	NJ 
0101000020E6100000736891ED7C8752C08195438B6C174440	KBLM 	\tMonmouth Executive Airport-Belmar / Farmingdale, NJ\t                 	40.183	-74.117	NJ 
0101000020E61000004E62105839B452C0FA7E6ABC74234440	KTTN 	\tTrenton-Mercer Airport-Trenton, NJ\t                                  	40.277	-74.816	NJ 
0101000020E610000000000000009052C0E5D022DBF94E4440	KLDJ 	\tLinden Airport-Linden, NJ\t                                           	40.617	-74.25	NJ 
0101000020E6100000894160E5D0AA52C01D5A643BDF4F4440	KSMQ 	\tSomerset Airport-Somerville, NJ\t                                     	40.624	-74.669	NJ 
0101000020E61000003333333333B352C0CDCCCCCCCC8C4340	KSIE 	\tSea Isle VOR, NJ\t                                                    	39.1	-74.8	NJ 
0101000020E61000003333333333B352C01D03B2D7BB9B4340	KOBI 	\tWoodbine Municipal Airport-Woodbine, NJ\t                             	39.21667	-74.8	NJ 
0101000020E61000006666666666A652C08369183E22A24340	K26N 	\tOcean City, NJ\t                                                      	39.26667	-74.6	NJ 
0101000020E61000000000000000B052C0B79C4B7155D54340	KN81 	\tHammonton, NJ\t                                                       	39.66667	-74.75	NJ 
0101000020E610000072FE261422C252C09A99999999D94340	K17N 	\tCross Keys, NJ\t                                                      	39.7	-75.03333	NJ 
0101000020E61000000B98C0ADBB9B52C0EACF7EA488E84340	KCYN 	\tCoyle VOR, NJ\t                                                       	39.81667	-74.43333	NJ 
0101000020E61000003333333333B352C01630815B77F74340	KN14 	\tLumberton, NJ\t                                                       	39.93333	-74.8	NJ 
0101000020E61000005BCEA5B8AA9A52C09A99999999F94340	KDIX 	\tManchester 88D, NJ\t                                                  	39.95	-74.41667	NJ 
0101000020E6100000F5673F5244B452C08369183E22024440	KPHI 	\tMt Holly-PHL-WFO, NJ\t                                                	40.01667	-74.81667	NJ 
0101000020E61000000B98C0ADBB8B52C0EACF7EA488084440	KN12 	\tLakewood, NJ\t                                                        	40.06667	-74.18333	NJ 
0101000020E61000006666666666A652C01D03B2D7BB1B4440	KN87 	\tRobbinsville, NJ\t                                                    	40.21667	-74.6	NJ 
0101000020E610000066666666669652C04963B48EAA2A4440	K3N6 	\tOld Bridge, NJ\t                                                      	40.33333	-74.35	NJ 
0101000020E61000005BCEA5B8AAAA52C03333333333334440	K39N 	\tPrinceton, NJ\t                                                       	40.4	-74.66667	NJ 
0101000020E6100000C2340C1F118152C01D03B2D7BB3B4440	K56N 	\tSandy Hook CGS, NJ\t                                                  	40.46667	-74.01667	NJ 
0101000020E61000000B98C0ADBB9B52C07D96E7C1DD3D4440	KNBK 	\tNew Brunswick, NJ\t                                                   	40.48333	-74.43333	NJ 
0101000020E61000006666666666A652C08369183E22424440	K47N 	\tManville, NJ\t                                                        	40.51667	-74.6	NJ 
0101000020E61000003ECBF3E0EEBE52C0EACF7EA488484440	KN40 	\tPittstown, NJ\t                                                       	40.56667	-74.98333	NJ 
0101000020E6100000C2340C1F11C152C04963B48EAA4A4440	KN85 	\tAlexandria, NJ\t                                                      	40.58333	-75.01667	NJ 
0101000020E61000005BCEA5B8AAAA52C05036E50AEF4E4440	KN52 	\tSomerville, NJ\t                                                      	40.61667	-74.66667	NJ 
0101000020E61000005BCEA5B8AAAA52C05036E50AEF4E4440	KSJB 	\tSomerville, NJ\t                                                      	40.61667	-74.66667	NJ 
0101000020E6100000F5673F52449452C09A99999999794440	KN07 	\tLincoln Park, NJ\t                                                    	40.95	-74.31667	NJ 
0101000020E61000000000000000C052C01D03B2D7BB7B4440	K1N7 	\tBlairstown, NJ\t                                                      	40.96667	-75	NJ 
0101000020E610000072FE261422A252C0EACF7EA488884440	KSAX 	\tSparta VOR, NJ\t                                                      	41.06667	-74.53333	NJ 
0101000020E610000066666666669652C0B0C91AF510914440	K4N1 	\tWest Milford, NJ\t                                                    	41.13333	-74.35	NJ 
0101000020E61000006666666666A652C09A99999999994440	KN63 	\tSussex, NJ\t                                                          	41.2	-74.6	NJ 
0101000020E6100000894160E5D08A52C08195438B6C574440	KEWR 	\tNewark Liberty International Airport, NJ\t                            	40.683	-74.169	NJ 
0101000020E6100000A69BC420B09A52C06666666666664440	KMMU 	\tMorristown Municipal Airport-Morristown, NJ\t                         	40.8	-74.417	NJ 
0101000020E610000096438B6CE78352C0CDCCCCCCCC6C4440	KTEB 	\tTeterboro Airport-Teterboro, NJ\t                                     	40.85	-74.061	NJ 
0101000020E6100000273108AC1C9252C0E3A59BC420704440	KCDW 	\tEssex County Airport (Caldwell Airport)-Caldwell, NJ\t                	40.876	-74.283	NJ 
0101000020E6100000C976BE9F1AAF52C0FED478E926814440	K12N 	\tAndover, NJ\t                                                         	41.009	-74.736	NJ 
0101000020E6100000F2D24D6210A852C0B6F3FDD478994440	KFWN 	\tSussex Airport-Sussex, NJ\t                                           	41.199	-74.626	NJ 
0101000020E610000004560E2DB2855AC0E5D022DBF9CE4140	KSAF 	\tSanta Fe Regional Airport-Santa Fe, NM\t                              	35.617	-106.089	NM 
0101000020E610000037894160E57052C06F1283C0CA514440	KJFK 	\tJohn F. Kennedy International Airport, NY\t                           	40.639	-73.764	NY 
0101000020E610000057EC2FBB27A753C0A01A2FDD24764540	KBQR 	\tBuffalo-Lancaster Regional Airport-Lancaster, NY\t                    	42.923	-78.6118	NY 
0101000020E61000009CC420B0728052C0713D0AD7A3604440	KJRA 	\tWest 30Th Street Heliport-Manhattan, NY\t                             	40.755	-74.007	NY 
0101000020E6100000F6285C8FC27D52C0355EBA490C224640	KLKP 	\tLake Placid Airport-Lake Placid, NY\t                                 	44.266	-73.965	NY 
0101000020E61000008D976E12833853C088855AD3BC5B4540	KSSN 	\tSeneca Army Airfield-Romulus, NY\t                                    	42.7167	-76.883	NY 
0101000020E61000000B98C0ADBB4B52C09A99999999394440	KN28 	\tAmbrose, NY\t                                                         	40.45	-73.18333	NY 
0101000020E610000066666666664652C06666666666664440	KZNY 	\tNew York-ARTCC, NY\t                                                  	40.8	-73.1	NY 
0101000020E6100000289B7285773752C05036E50AEF6E4440	KOKX 	\tBrookhaven-Upton, NY\t                                                	40.86667	-72.86667	NY 
0101000020E61000003ECBF3E0EE6E52C0E3FC4D2844C44440	KSTM 	\tStormville, NY\t                                                      	41.53333	-73.73333	NY 
0101000020E610000066666666669652C01D03B2D7BBFB4440	KSLD 	\tSlide Mountain, NY\t                                                  	41.96667	-74.35	NY 
0101000020E6100000F5673F5244D452C0EACF7EA488084540	KHNK 	\tHancock VOR, NY\t                                                     	42.06667	-75.31667	NY 
0101000020E610000066666666660653C04963B48EAA0A4540	KCZG 	\tTri-Cities Airport-Endicott, NY\t                                     	42.08333	-76.1	NY 
0101000020E61000008E01D9EBDD6D52C0E3FC4D2844244540	K1B1 	\tHudson-Columbia, NY\t                                                 	42.28333	-73.71667	NY 
0101000020E61000005BCEA5B8AADA52C06666666666264540	KN23 	\tSidney, NY\t                                                          	42.3	-75.41667	NY 
0101000020E61000000B98C0ADBB6B53C0B0C91AF510314540	K4G6 	\tHornell, NY\t                                                         	42.38333	-77.68333	NY 
0101000020E61000009A99999999C952C0B0C91AF510314540	KOZX 	\tOneonta, NY\t                                                         	42.38333	-75.15	NY 
0101000020E6100000C2340C1F11E152C0EACF7EA488484540	KOIC 	\tLt. Warren Eaton Airport-Norwich, NY\t                                	42.56667	-75.51667	NY 
0101000020E6100000F5673F52448452C04963B48EAA4A4540	KENX 	\tAlbany-E. Berne, NY\t                                                 	42.58333	-74.06667	NY 
0101000020E61000008E01D9EBDD0D53C0CDCCCCCCCC4C4540	KN03 	\tCortland County/Chase, NY\t                                           	42.6	-76.21667	NY 
0101000020E61000000B98C0ADBBAB53C0B79C4B7155554540	KCOL 	\tColden, NY\t                                                          	42.66667	-78.68333	NY 
0101000020E6100000CDCCCCCCCC8C53C01630815B77574540	KWRS 	\tWarsaw, NY\t                                                          	42.68333	-78.2	NY 
0101000020E61000005BCEA5B8AABA52C09A99999999594540	KCOO 	\tCooperstown, NY\t                                                     	42.7	-74.91667	NY 
0101000020E610000033333333337352C00000000000604540	KALY 	\tAlbany-WFO, NY\t                                                      	42.75	-73.8	NY 
0101000020E6100000F5673F5244E452C0CDCCCCCCCC6C4540	KVGC 	\tHamilton Municipal, NY\t                                              	42.85	-75.56667	NY 
0101000020E6100000F5673F52445453C03333333333734540	KD38 	\tCanandaigua, NY\t                                                     	42.9	-77.31667	NY 
0101000020E61000000B98C0ADBB1B53C0B79C4B7155754540	K6B9 	\tSkaneateles Aero Drome Airport Skaneateles, NY\t                      	42.91667	-76.43333	NY 
0101000020E6100000A5315A47559552C07D96E7C1DD7D4540	KNY0 	\tJohnstown/Fulton Cnt, NY\t                                            	42.98333	-74.33333	NY 
0101000020E61000005BCEA5B8AA8A53C0E3FC4D2844844540	KGVQ 	\tGenesee County Airport-Batavia, NY\t                                  	43.03333	-78.16667	NY 
0101000020E6100000289B7285777752C06666666666864540	K5B2 	\tSaratoga Springs, NY\t                                                	43.05	-73.86667	NY 
0101000020E6100000289B7285774753C07D96E7C1DD9D4540	KSDC 	\tWilliamson-Sodus Airport-Williamson/Sodus, NY\t                       	43.23333	-77.11667	NY 
0101000020E6100000D8648D7A881853C0CDCCCCCCCCAC4540	KN00 	\tOswego County Airport, Fulton, NY\t                                   	43.35	-76.38333	NY 
0101000020E61000006666666666D652C09A99999999B94540	K1B8 	\tBoonville, NY\t                                                       	43.45	-75.35	NY 
0101000020E610000072FE261422A252C09A99999999B94540	KPIC 	\tPiseco Lake, NY\t                                                     	43.45	-74.53333	NY 
0101000020E6100000CDCCCCCCCCDC52C01D03B2D7BBBB4540	KRMX 	\tGriffiss AFB-88D, NY\t                                                	43.46667	-75.45	NY 
0101000020E61000000B98C0ADBBEB52C00000000000E04540	KTYX 	\tFort Drum-88D, NY\t                                                   	43.75	-75.68333	NY 
0101000020E6100000CDCCCCCCCCBC52C01630815B77574640	KPTD 	\tPotsdam Municipal Airport-Potsdam, NY\t                               	44.68333	-74.95	NY 
0101000020E610000033333333339352C0CDCCCCCCCC6C4640	KMAL 	\tMalone-Dufort Airport-Malone, NY\t                                    	44.85	-74.3	NY 
0101000020E610000033333333337352C03333333333734640	KELB 	\tEllenburg Depot, NY\t                                                 	44.9	-73.8	NY 
0101000020E61000007F6ABC74938052C07D3F355EBA594440	KJRB 	\tDowntown Manhattan Heliport-Manhattan, NY\t                           	40.701	-74.009	NY 
0101000020E6100000A69BC420B05A52C0CBA145B6F35D4440	KFRG 	\tRepublic Airport-East Farmingdale, NY\t                               	40.734	-73.417	NY 
0101000020E6100000B81E85EB517852C0C1CAA145B6634440	KLGA 	\tLa Guardia International Airport-New York, NY\t                       	40.779	-73.88	NY 
0101000020E6100000BC749318047E52C0C1CAA145B6634440	KNYC 	\tNew York/Central Park, NY\t                                           	40.779	-73.969	NY 
0101000020E61000004A0C022B874652C01283C0CAA1654440	KISP 	\tLong Island Macarthur Airport-Islip, NY\t                             	40.794	-73.102	NY 
0101000020E6100000560E2DB29D3752C0F0A7C64B37694440	KHWV 	\tBrookhaven Airport-Shirley, NY\t                                      	40.822	-72.869	NY 
0101000020E61000009CC420B0722852C079E92631086C4440	KFOK 	\tFrancis S. Gabreski Airport-Westhampton Beach, NY\t                   	40.844	-72.632	NY 
0101000020E6100000E3A59BC4201052C07B14AE47E17A4440	KHTO 	\tEast Hampton Airport-East Hampton, NY\t                               	40.96	-72.252	NY 
0101000020E610000085EB51B81E6D52C00E2DB29DEF874440	KHPN 	\tWestchester County Airport-White Plains, NY\t                         	41.062	-73.705	NY 
0101000020E6100000508D976E12FB51C0D34D621058894440	KMTP 	\tMontauk Airport-Montauk, NY\t                                         	41.073	-71.923	NY 
0101000020E610000066666666668652C00000000000C04440	KSWF 	\tStewart International Airport-Newburgh, NY\t                          	41.5	-74.1	NY 
0101000020E6100000295C8FC2F59052C0FED478E926C14440	KMGJ 	\tOrange County Airport-Montgomery, NY\t                                	41.509	-74.265	NY 
0101000020E61000009CC420B0727852C0E3A59BC420D04440	KPOU 	\tHudson Valley Regional Airport-Poughkeepsie, NY\t                     	41.626	-73.882	NY 
0101000020E61000007B14AE47E1B252C07D3F355EBAD94440	KMSV 	\tSullivan County International Airport-Monticello, NY\t                	41.701	-74.795	NY 
0101000020E6100000736891ED7C7F53C0CBA145B6F30D4540	KELZ 	\tWellsville Municipal Airport-Wellsville, NY\t                         	42.109	-77.992	NY 
0101000020E61000000000000000D053C03333333333134540	KJHW 	\tChautauqua County-Jamestown Airport-Jamestown, NY\t                   	42.15	-79.25	NY 
0101000020E61000000C022B87163953C03108AC1C5A144540	KELM 	\tElmira/Corning Regional Airport-Big Flats, NY\t                       	42.159	-76.892	NY 
0101000020E61000001F85EB51B8FE52C0D122DBF97E1A4540	KBGM 	\tGreater Binghamton Airport-Binghamton, NY\t                           	42.207	-75.98	NY 
0101000020E610000039B4C876BE9753C0022B8716D91E4540	KOLE 	\tCattaraugus County-Olean Airport-Olean, NY\t                          	42.241	-78.371	NY 
0101000020E6100000D9CEF753E31D53C0E7FBA9F1D23D4540	KITH 	\tIthaca Tompkins Regional Airport-Ithaca, NY\t                         	42.483	-76.467	NY 
0101000020E6100000C520B07268D153C0C976BE9F1A3F4540	KDKK 	\tChautauqua County/Dunkirk Airport-Dunkirk, NY\t                       	42.493	-79.272	NY 
0101000020E61000001283C0CAA16D53C00C022B8716494540	KDSV 	\tDansville Municipal Airport-Dansville, NY\t                           	42.571	-77.713	NY 
0101000020E6100000DD240681954353C0FCA9F1D24D524540	KPEO 	\tPenn Yan Airport (Yates County Airport)-Penn Yan, NY\t                	42.643	-77.056	NY 
0101000020E61000004260E5D0227352C0560E2DB29D5F4540	KALB 	\tAlbany International Airport-Albany, NY\t                             	42.747	-73.799	NY 
0101000020E6100000CDCCCCCCCC7C52C0CDCCCCCCCC6C4540	KSCH 	\tSchenectady County Airport-Schenectady, NY\t                          	42.85	-73.95	NY 
0101000020E6100000C976BE9F1AAF53C0B81E85EB51784540	KBUF 	\tBuffalo Niagara International Airport-Buffalo, NY\t                   	42.94	-78.736	NY 
0101000020E610000079E9263108BC53C0E7FBA9F1D28D4540	KIAG 	\tNiagara Falls International-Niagara Falls, NY\t                       	43.108	-78.938	NY 
0101000020E61000002DB29DEFA70653C091ED7C3F358E4540	KSYR 	\tSyracuse Hancock International Airport-Syracuse, NY\t                 	43.111	-76.104	NY 
0101000020E610000033333333336B53C0E5D022DBF98E4540	KROC 	\tGreater Rochester International Airport-Rochester, NY\t               	43.117	-77.675	NY 
0101000020E61000007F6ABC7493D852C0C3F5285C8F924540	KUCA 	\tOneida County Airport-Utica, NY\t                                     	43.145	-75.384	NY 
0101000020E6100000355EBA490CDA52C0CBA145B6F39D4540	KRME 	\tGriffiss International Airport-Rome, NY\t                             	43.234	-75.407	NY 
0101000020E6100000736891ED7C6752C0CDCCCCCCCCAC4540	KGFL 	\tFloyd Bennett Memorial Airport-Glens Falls, NY\t                      	43.35	-73.617	NY 
0101000020E6100000713D0AD7A31853C0CDCCCCCCCCAC4540	KFZY 	\tOswego County Airport-Fulton, NY\t                                    	43.35	-76.385	NY 
0101000020E61000008B6CE7FBA90153C03BDF4F8D97FE4540	KART 	\tWatertown International Airport-Watertown, NY\t                       	43.989	-76.026	NY 
0101000020E6100000F4FDD478E9EE52C06666666666064640	KGTB 	\tWheeler-Sack Army Airfield-Fort Drum, NY\t                            	44.05	-75.733	NY 
0101000020E61000006891ED7C3F8D52C0E17A14AE47314640	KSLK 	\tAdirondack Regional Airport-Saranac Lake, NY\t                        	44.385	-74.207	NY 
0101000020E6100000CBA145B6F35D52C017D9CEF753534640	KPBG 	\tPlattsburgh International Airport-Plattsburgh, NY\t                   	44.651	-73.468	NY 
0101000020E6100000E7FBA9F1D2DD52C09EEFA7C64B574640	KOGS 	\tOgdensburg International Airport-Ogdensburg, NY\t                     	44.682	-75.466	NY 
0101000020E6100000B6F3FDD4786152C00E2DB29DEF574640	KPLB 	\tPlattsburgh, NY\t                                                     	44.687	-73.523	NY 
0101000020E6100000A01A2FDD24B652C02B8716D9CE774640	KMSS 	\tMassena International Airport-Massena, NY\t                           	44.936	-74.846	NY 
0101000020E61000000000000000A053C06891ED7C3F553E40	K2XG 	\tGulf Of Mexico?\t                                                     	30.333	-78.5	FL 
0101000020E6100000A245B6F3FDA454C021B07268917D4340	KI43 	\tJackson, OH\t                                                         	38.981	-82.578	OH 
0101000020E6100000894160E5D01A55C077BE9F1A2F8D4340	KLUK 	\tCincinnati Municipal Lunken Airport Cincinnati, OH\t                  	39.103	-84.419	OH 
0101000020E6100000F4FDD478E98E54C0B29DEFA7C69B4340	KUNI 	\tGordon K. Bush Airport-Athens / Albany, OH\t                          	39.217	-82.233	OH 
0101000020E61000009A999999992155C03BDF4F8D97AE4340	KHAO 	\tButler County Regional Airport-Hamilton, OH\t                         	39.364	-84.525	OH 
0101000020E61000007D3F355EBAF154C0BA490C022BB74340	KILN 	\tWilmington Air Park-Wilmington, OH\t                                  	39.431	-83.777	OH 
0101000020E6100000E17A14AE471955C08716D9CEF7C34340	KMWO 	\tMiddletown/Hook Fld, OH\t                                             	39.531	-84.395	OH 
0101000020E61000005839B4C8760E55C079E9263108CC4340	KMGY 	\tDayton Wright Brothers Airport-Dayton, OH\t                           	39.594	-84.226	OH 
0101000020E6100000355EBA490CAA54C054E3A59BC4E04340	KLHQ 	\tFairfield County Airport-Lancaster, OH\t                              	39.756	-82.657	OH 
0101000020E6100000C1CAA145B6BB54C07F6ABC7493E84340	KLCK 	\tRickenbacker International Airport-Columbus, OH\t                     	39.817	-82.933	OH 
0101000020E610000033333333330355C0B4C876BE9FEA4340	KFFO 	\tWright-Patterson Air Force Base-Dayton, OH\t                          	39.833	-84.05	OH 
0101000020E61000005A643BDF4FF554C0B4C876BE9FEA4340	KSGH 	\tSpringfield Municipal, OH\t                                           	39.833	-83.833	OH 
0101000020E61000008D976E1283C854C03333333333F34340	KTZR 	\tColumbus-Bolton, OH\t                                                 	39.9	-83.133	OH 
0101000020E6100000BC749318040E55C08716D9CEF7F34340	KDAY 	\tJames M. Cox International Airport-Dayton, OH\t                       	39.906	-84.219	OH 
0101000020E61000000C022B87167954C046B6F3FDD4F84340	KZZV 	\tZanesville Municipal Airport-Zanesville, OH\t                         	39.944	-81.892	OH 
0101000020E6100000E3A59BC420B854C0022B8716D9FE4340	KCMH 	\tJohn Glenn Columbus International Airport-Columbus, OH\t              	39.991	-82.877	OH 
0101000020E61000001283C0CAA19D54C06DE7FBA9F1024440	KVTA 	\tNewark-Heath Airport-Newark, OH\t                                     	40.023	-82.463	OH 
0101000020E6100000A245B6F3FDC454C0448B6CE7FB094440	KOSU 	\tOhio State University Airport-Columbus, OH\t                          	40.078	-83.078	OH 
0101000020E6100000355EBA490C2255C0273108AC1C1A4440	KVES 	\tDarke County Airport-Versailles, OH\t                                 	40.204	-84.532	OH 
0101000020E61000004A0C022B87D654C0CDCCCCCCCC1C4440	KMRT 	\tMarysville, OH\t                                                      	40.225	-83.352	OH 
0101000020E61000008FC2F5285CC754C0A4703D0AD7234440	KDLZ 	\tDelaware Municipal Airport-Delaware, OH\t                             	40.28	-83.115	OH 
0101000020E61000000C022B8716A154C0B4C876BE9F2A4440	K4I3 	\tMt Vernon-Knox, OH\t                                                  	40.333	-82.517	OH 
0101000020E61000003F355EBA49F454C0E5D022DBF92E4440	KEDJ 	\tBellefontaine Regional Airport-Bellefontaine, OH\t                    	40.367	-83.817	OH 
0101000020E61000004260E5D0225B54C023DBF97E6A3C4440	KPHD 	\tHarry Clever Field Airport, New Philadelphia, OH\t                    	40.472	-81.424	OH 
0101000020E61000006ABC749318C454C0022B8716D94E4440	KMNN 	\tMarion, OH\t                                                          	40.616	-83.064	OH 
0101000020E6100000E7FBA9F1D2A554C0C58F31772DF14340	K7B4 	\tMiller Farm Landing Strip-Baltimore, OH\t                             	39.8842	-82.591	OH 
0101000020E61000004E62105839E454C0931804560E6D4340	KAMT 	\tAlexander Salamon Airport-West Union, OH\t                            	38.852	-83.566	OH 
0101000020E610000096438B6CE7BB54C0696FF085C9944340	KEOP 	\tPike County Airport-Waverly, OH\t                                     	39.1624	-82.936	OH 
0101000020E6100000C520B07268D954C02AA913D044984440	KFZI 	\tFostoria Metropolitan Airport-Fostoria, OH\t                          	41.1896	-83.397	OH 
0101000020E61000006666666666B654C04963B48EAA6A4340	KPMH 	\tPortsmouth, OH\t                                                      	38.83333	-82.85	OH 
0101000020E61000008E01D9EBDD0D55C04963B48EAA8A4340	KI69 	\tBatavia, OH\t                                                         	39.08333	-84.21667	OH 
0101000020E610000072FE2614223255C00000000000A04340	KI67 	\tHarrison, OH\t                                                        	39.25	-84.78333	OH 
0101000020E6100000F5673F5244F454C0B79C4B7155B54340	KTIR 	\tWilmington-RFC, OH\t                                                  	39.41667	-83.81667	OH 
0101000020E6100000C2340C1F11C154C01630815B77B74340	KRZT 	\tRoss County Airport-Chillicothe, OH\t                                 	39.43333	-83.01667	OH 
0101000020E610000000000000001055C01D03B2D7BBBB4340	KI68 	\tLebanon, OH\t                                                         	39.46667	-84.25	OH 
0101000020E610000072FE2614223255C00000000000C04340	KOXD 	\tMiami University Airport-Oxford, OH\t                                 	39.5	-84.78333	OH 
0101000020E61000003ECBF3E0EEBE54C08369183E22C24340	KCYO 	\tPickaway County Memorial Airport-Circleville, OH\t                    	39.51667	-82.98333	OH 
0101000020E61000005BCEA5B8AADA54C0EACF7EA488C84340	KI23 	\tWashington Court, OH\t                                                	39.56667	-83.41667	OH 
0101000020E61000003ECBF3E0EEFE54C09A99999999D94340	KI19 	\tXenia, OH\t                                                           	39.7	-83.98333	OH 
0101000020E61000009A99999999A954C00000000000E04340	KI15 	\tLancaster, OH\t                                                       	39.75	-82.65	OH 
0101000020E6100000D8648D7A88C854C03333333333F34340	K2I4 	\tColumbus-Bolton, OH\t                                                 	39.9	-83.13333	OH 
0101000020E61000008E01D9EBDDDD54C01630815B77F74340	KUYF 	\tLondon, OH\t                                                          	39.93333	-83.46667	OH 
0101000020E6100000A5315A47556554C01D03B2D7BBFB4340	KCDI 	\tCambridge Municipal Airport-Cambridge, OH\t                           	39.96667	-81.58333	OH 
0101000020E61000008E01D9EBDD9D54C08369183E22024440	K2I8 	\tNewark, OH\t                                                          	40.01667	-82.46667	OH 
0101000020E6100000F5673F52443454C08369183E22024440	KAIR 	\tBellaire VOR, OH\t                                                    	40.01667	-80.81667	OH 
0101000020E61000000000000000F054C05036E50AEF0E4440	KI74 	\tUrbana, OH\t                                                          	40.11667	-83.75	OH 
0101000020E610000072FE2614220255C0E3FC4D2844244440	KROD 	\tRosewood VOR, OH\t                                                    	40.28333	-84.03333	OH 
0101000020E610000033333333331355C00000000000404440	KAXV 	\tNeil Armstrong Airport-Wapakoneta, OH\t                               	40.5	-84.3	OH 
0101000020E6100000289B7285772755C05036E50AEF6E4440	KVNW 	\tVan Wert County, OH\t                                                 	40.86667	-84.61667	OH 
0101000020E61000005BCEA5B8AAEA54C08369183E22824440	KFBC 	\tFlag City, OH\t                                                       	41.01667	-83.66667	OH 
0101000020E610000000000000005054C01D03B2D7BB9B4440	K29G 	\tRavena-Portage, OH\t                                                  	41.21667	-81.25	OH 
0101000020E6100000CDCCCCCCCC8C54C06666666666A64440	KZOB 	\tCleveland-ARTCC, OH\t                                                 	41.3	-82.2	OH 
0101000020E61000000B98C0ADBB8B54C0CDCCCCCCCCAC4440	K22G 	\tLorain-Elyria, OH\t                                                   	41.35	-82.18333	OH 
0101000020E6100000D8648D7A880855C05036E50AEFCE4440	KUSE 	\tWauseon, OH\t                                                         	41.61667	-84.13333	OH 
0101000020E6100000CDCCCCCCCC2C54C0E3FC4D2844E44440	K7G2 	\tAshtabula, OH\t                                                       	41.78333	-80.7	OH 
0101000020E6100000CDCCCCCCCC2C54C0E3FC4D2844E44440	KSHI 	\tAshtabula, OH\t                                                       	41.78333	-80.7	OH 
0101000020E61000007D3F355EBA0155C0B4C876BE9F5A4440	KAOH 	\tLima Allen County Airport-Lima, OH\t                                  	40.708	-84.027	OH 
0101000020E6100000FED478E926A154C0295C8FC2F5684440	KMFD 	\tMansfield, OH\t                                                       	40.82	-82.518	OH 
0101000020E610000054E3A59BC47854C039B4C876BE6F4440	KBJJ 	\tWayne County Airport-Wooster, OH\t                                    	40.873	-81.887	OH 
0101000020E610000023DBF97E6A5C54C02FDD240681754440	KCAK 	\tAkron-Canton Regional Airport-Akron, OH\t                             	40.918	-81.444	OH 
0101000020E6100000894160E5D0EA54C06F1283C0CA814440	KFDY 	\tFindlay, OH\t                                                         	41.014	-83.669	OH 
0101000020E6100000022B8716D9FE54C0F853E3A59B844440	KOWX 	\tOttawa, OH\t                                                          	41.036	-83.982	OH 
0101000020E610000004560E2DB25D54C0BE9F1A2FDD844440	KAKR 	\tAkron Fulton International Airport-Akron, OH\t                        	41.038	-81.464	OH 
0101000020E610000000000000005054C0B29DEFA7C69B4440	KPOV 	\tPortage County Airport Ravenna, OH\t                                  	41.217	-81.25	OH 
0101000020E61000004260E5D0222B54C0713D0AD7A3A04440	KYNG 	\tYoungstown-Warren Regional Airport-Youngstown, OH\t                   	41.255	-80.674	OH 
0101000020E6100000FA7E6ABC741B55C02506819543AB4440	KDFI 	\tDefiance Memorial Airport-Defiance, OH\t                              	41.338	-84.429	OH 
0101000020E6100000FA7E6ABC748B54C03F355EBA49AC4440	KLPR 	\tLorain County Regional Airport-Lorain, OH\t                           	41.346	-82.179	OH 
0101000020E61000004A0C022B877654C08716D9CEF7B34440	KCLE 	\tCleveland Hopkins International Airport-Cleveland, OH\t               	41.406	-81.852	OH 
0101000020E6100000560E2DB29DB754C0355EBA490CC24440	KPCW 	\tPort Clinton, OH\t                                                    	41.516	-82.869	OH 
0101000020E6100000B29DEFA7C66B54C0FCA9F1D24DC24440	KBKL 	\tCleveland Burke Lakefront Airport-Cleveland, OH\t                     	41.518	-81.684	OH 
0101000020E61000005839B4C876DE54C0F2D24D6210C84440	KTDZ 	\tToledo, OH\t                                                          	41.563	-83.476	OH 
0101000020E6100000F4FDD478E95E54C07F6ABC7493C84440	KCGF 	\tCuyahoga County Airport-Cleveland, OH\t                               	41.567	-81.483	OH 
0101000020E6100000DD24068195F354C04260E5D022CB4440	KTOL 	\tToledo Express Airport-Toledo, OH\t                                   	41.587	-83.806	OH 
0101000020E61000009A999999995954C08195438B6CD74440	KLNN 	\tLost Nation Airport-Willoughby, OH\t                                  	41.683	-81.4	OH 
0101000020E6100000068195438B2C54C0DD24068195E34440	KHZY 	\tNortheast Ohio Regional Airport Ashtabula, OH\t                       	41.778	-80.696	OH 
0101000020E6100000C1CAA145B6DB54C07F6ABC7493884640	KAPE 	\tAppleton, OH\t                                                        	45.067	-83.433	OH 
0101000020E610000039B4C876BEA757C0A69BC420B0824140	KRKR 	\tRobert S. Kerr Airport-Poteau, OK\t                                   	35.021	-94.621	OK 
0101000020E6100000A01A2FDD24CE5EC0AAF1D24D62104640	KEUG 	\tMahlon Sweet Field-Eugene, OR\t                                       	44.128	-123.221	OR 
0101000020E6100000C1CAA145B65B53C0E7FBA9F1D2DD4340	KRYT 	\tFountain Dale, PA\t                                                   	39.733	-77.433	PA 
0101000020E61000004A0C022B87CE52C039B4C876BEEF4340	KPHL 	\tPhiladelphia International Airport-Philadelphia, PA\t                 	39.873	-75.227	PA 
0101000020E61000000E2DB29DEF3753C02FDD240681F54340	KTHV 	\tYork Airport-York, PA\t                                               	39.918	-76.874	PA 
0101000020E6100000736891ED7CF752C0E7FBA9F1D2FD4340	KMQS 	\tChester County G. O. Carlson Airport-Coatesville, PA\t                	39.983	-75.867	PA 
0101000020E610000046B6F3FDD4C052C0273108AC1C0A4440	KPNE 	\tNortheast Philadelphia Airport-Philadelphia, PA\t                     	40.079	-75.013	PA 
0101000020E61000000C022B8716D152C0CDCCCCCCCC0C4440	KLOM 	\tPhiladelphia/Wings Field, PA\t                                        	40.1	-75.267	PA 
0101000020E6100000894160E5D01253C08FC2F5285C0F4440	KLNS 	\tLancaster Airport-Lancaster, PA\t                                     	40.12	-76.294	PA 
0101000020E6100000273108AC1C1254C01B2FDD2406114440	KAFJ 	\tWashington County Airport-Washington, PA\t                            	40.133	-80.283	PA 
0101000020E6100000C520B072683153C00C022B8716194440	KMDT 	\tHarrisburg International Airport-Middletown, PA\t                     	40.196	-76.772	PA 
0101000020E61000009A99999999C952C09A99999999194440	KNXX 	\tNaval Air Station Joint Reserve Base Willow Grove, PA\t               	40.2	-75.15	PA 
0101000020E61000005839B4C8763653C0B29DEFA7C61B4440	KCXY 	\tCapital City Airport-Harrisburg, PA\t                                 	40.217	-76.851	PA 
0101000020E6100000EC51B81E85E352C05839B4C8761E4440	KPTW 	\tHeritage Field-Pottstown, PA\t                                        	40.238	-75.555	PA 
0101000020E61000009A99999999D953C04E62105839244440	KLBE 	\tArnold Palmer Regional Airport-Latrobe, PA\t                          	40.283	-79.4	PA 
0101000020E610000014AE47E17A9453C0D9CEF753E3254440	KAOO 	\tAltoona-Blair County Airport-Altoona, PA\t                            	40.296	-78.32	PA 
0101000020E61000004C37894160B553C09CC420B072284440	KJST 	\tJohnstown-Cambria County Airport-Johnstown, PA\t                      	40.316	-78.834	PA 
0101000020E61000001D5A643BDFC752C00AD7A3703D2A4440	KDYL 	\tDoylestown Airport-Doylestown, PA\t                                   	40.33	-75.123	PA 
0101000020E61000005EBA490C02FB53C03D0AD7A3702D4440	KAGC 	\tAllegheny County Airport-West Mifflin, PA\t                           	40.355	-79.922	PA 
0101000020E6100000D9CEF753E3FD52C0E5D022DBF92E4440	KRDG 	\tReading Regional Airport-Reading, PA\t                                	40.367	-75.967	PA 
0101000020E61000003F355EBA492453C08195438B6C374440	KMUI 	\tMuir Aaf/Indiantown, PA\t                                             	40.433	-76.567	PA 
0101000020E61000009CC420B072D852C048E17A14AE374440	KUKT 	\tQuakertown Airport-Quakertown, PA\t                                   	40.435	-75.382	PA 
0101000020E610000004560E2DB20D54C0AE47E17A143E4440	KPIT 	\tPittsburgh International Airport-Pittsburgh, PA\t                     	40.485	-80.214	PA 
0101000020E6100000F4FDD478E9DE52C07F6ABC7493484440	KJVU 	\tAllentown Queen, PA\t                                                 	40.567	-75.483	PA 
0101000020E61000006666666666C653C01B2FDD2406514440	KIDI 	\tIndiana/Stewart Airport, PA\t                                         	40.633	-79.1	PA 
0101000020E61000008048BF7D1DDC53C0789CA223B99C4440	KAXQ 	\tClarion County Airport-Clarion, PA\t                                  	41.2244	-79.4393	PA 
0101000020E6100000CCEEC9C342F553C0C286A757CA1A4440	KFWQ 	\tRostraver Airport-Monongahela, PA\t                                   	40.2093	-79.8322	PA 
0101000020E6100000E09C11A5BDE953C0D7C0560916FB4340	KVVS 	\tJoseph A. Hardy Connellsville Airport-Connellsville, PA\t             	39.96161	-79.6522	PA 
0101000020E6100000637FD93D790854C0EC2FBB270FF34340	KWAY 	\tGreene County Airport-Waynesburg, PA\t                                	39.8989	-80.1324	PA 
0101000020E6100000BBB88D06F0F652C083C0CAA145A64440	KWBW 	\tWilkes-Barre Wyoming Valley Airport-Wilkes-Barre, PA\t                	41.299	-75.8584	PA 
0101000020E6100000EC51B81E851753C0742497FF905A4440	KZER 	\tSchuylkill County Airport-Pottsville, PA\t                            	40.70755	-76.3675	PA 
0101000020E6100000289B728577F752C07D96E7C1DDFD4340	K40N 	\tCoatesville, PA\t                                                     	39.98333	-75.86667	PA 
0101000020E6100000A5315A4755E552C07D96E7C1DDFD4340	KOQN 	\tBrandywine Airport-West Chester, PA\t                                 	39.98333	-75.58333	PA 
0101000020E6100000C2340C1F11C153C0E3FC4D2844044440	K2G9 	\tSomerset County Airport-Somerset, PA\t                                	40.03333	-79.01667	PA 
0101000020E6100000C2340C1F11A153C04963B48EAA0A4440	KHMZ 	\tBedford County Airport-Bedford, PA\t                                  	40.08333	-78.51667	PA 
0101000020E6100000F5673F52444453C06666666666264440	KHAR 	\tHarrisburg, PA\t                                                      	40.3	-77.06667	PA 
0101000020E610000072FE261422D252C0B0C91AF510314440	KCKZ 	\tPerkasie/Pennridge A, PA\t                                            	40.38333	-75.28333	PA 
0101000020E61000008E01D9EBDD0D54C0E3FC4D2844444440	KPBZ 	\tPitt-Coraopolis, PA\t                                                 	40.53333	-80.21667	PA 
0101000020E61000003ECBF3E0EEDE52C0EACF7EA488484440	KXLL 	\tAllentown Queen City Municipal Airport-Allentown, PA\t                	40.56667	-75.48333	PA 
0101000020E61000000B98C0ADBBEB52C04963B48EAA4A4440	KETX 	\tEast Texas VOR, PA\t                                                  	40.58333	-75.68333	PA 
0101000020E6100000C2340C1F11F152C06666666666664440	K22N 	\tLehighton/Arner Mem, PA\t                                             	40.8	-75.76667	PA 
0101000020E61000005BCEA5B8AA0A54C06666666666664440	KPJC 	\tZelienople, PA\t                                                      	40.8	-80.16667	PA 
0101000020E61000008E01D9EBDD0D54C04963B48EAA6A4440	KEWC 	\tEllwood City VOR, PA\t                                                	40.83333	-80.21667	PA 
0101000020E610000066666666667653C0CDCCCCCCCC6C4440	KCTP 	\tState College-WFO, PA\t                                               	40.85	-77.85	PA 
0101000020E610000066666666667653C0CDCCCCCCCC6C4440	KRHA 	\tState Colleg-RFC, PA\t                                                	40.85	-77.85	PA 
0101000020E610000000000000008053C0B79C4B7155754440	KCCX 	\tRush-St College, PA\t                                                 	40.91667	-78	PA 
0101000020E610000000000000000053C07D96E7C1DD7D4440	KHZL 	\tHazleton Regional Airport-Hazleton, PA\t                              	40.98333	-76	PA 
0101000020E61000005BCEA5B8AA9A53C06666666666864440	KN97 	\tClearfield, PA\t                                                      	41.05	-78.41667	PA 
0101000020E61000005BCEA5B8AA5A53C0B0C91AF510914440	KLHV 	\tWilliam T. Piper Memorial Airport-Lock Haven, PA\t                    	41.13333	-77.41667	PA 
0101000020E61000005BCEA5B8AA4A54C03333333333934440	K29D 	\tGrove City, PA\t                                                      	41.15	-81.16667	PA 
0101000020E61000005BCEA5B8AADA52C01630815B77974440	K7TB 	\tTobyhanna, PA\t                                                       	41.18333	-75.41667	PA 
0101000020E61000000000000000A053C0B79C4B7155B54440	KOYM 	\tSt. Marys Municipal Airport-Saint Marys, PA\t                         	41.41667	-78.5	PA 
0101000020E61000005BCEA5B8AACA52C07D96E7C1DDBD4440	KHAW 	\tHawley, PA\t                                                          	41.48333	-75.16667	PA 
0101000020E61000008E01D9EBDD7D53C00000000000C04440	KSLT 	\tSlate Run, PA\t                                                       	41.5	-77.96667	PA 
0101000020E6100000CDCCCCCCCC0C54C05036E50AEFCE4440	K2G6 	\tMeadville, PA\t                                                       	41.61667	-80.2	PA 
0101000020E6100000CDCCCCCCCC1C53C07D96E7C1DDDD4440	KN27 	\tTowanda, PA\t                                                         	41.73333	-76.45	PA 
0101000020E61000009A999999995953C07D96E7C1DDDD4440	KN38 	\tWellsboro/Grand Cany, PA\t                                            	41.73333	-77.4	PA 
0101000020E6100000E9263108ACDC52C03333333333534440	KABE 	\tLehigh Valley International Airport-Allentown, PA\t                   	40.65	-75.448	PA 
0101000020E6100000E3A59BC4206853C02DB29DEFA7564440	KRVL 	\tMifflin County Airport-Reedsville, PA\t                               	40.677	-77.627	PA 
0101000020E61000009A999999991954C01904560E2D624440	KBVI 	\tBeaver County Airport-Beaver Falls, PA\t                              	40.767	-80.4	PA 
0101000020E6100000CDCCCCCCCCFC53C0FA7E6ABC74634440	KBTP 	\tPittsburgh-Butler Regional Airport-Butler, PA\t                       	40.777	-79.95	PA 
0101000020E61000009EEFA7C64B3753C00C022B8716694440	KSEG 	\tPenn Valley Airport-Selinsgrove, PA\t                                 	40.821	-76.864	PA 
0101000020E610000066666666667653C0CDCCCCCCCC6C4440	KUNV 	\tUniversity Park Airport-University Park, PA\t                         	40.85	-77.85	PA 
0101000020E61000005A643BDF4F8553C03333333333734440	KPSB 	\tMid-State Regional Airport-Philipsburg, PA\t                          	40.9	-78.083	PA 
0101000020E6100000A69BC420B01A54C04E62105839844440	KUCP 	\tNew Castle Municipal Airport-New Castle, PA\t                         	41.033	-80.417	PA 
0101000020E6100000EE7C3F355E9A53C0BC74931804864440	KFIG 	\tClearfield-Lawrence Airport-Clearfield, PA\t                          	41.047	-78.412	PA 
0101000020E6100000C74B378941D852C06F1283C0CA914440	KMPO 	\tPocono Mountains Municipal Airport-Mount Pocono, PA\t                 	41.139	-75.379	PA 
0101000020E6100000FED478E926B953C0F4FDD478E9964440	KDUJ 	\tDubois Regional Airport-Dubois, PA\t                                  	41.179	-78.893	PA 
0101000020E61000005EBA490C023B53C0C976BE9F1A9F4440	KIPT 	\tWilliamsport Regional Airport-Williamsport, PA\t                      	41.243	-76.922	PA 
0101000020E61000004A0C022B87EE52C0986E1283C0AA4440	KAVP 	\tWilkes-Barre/Scranton International Airport-Avoca, PA\t               	41.334	-75.727	PA 
0101000020E6100000736891ED7CF753C01B2FDD2406B14440	KFKL 	\tVenango Regional Airport-Franklin, PA\t                               	41.383	-79.867	PA 
0101000020E6100000F6285C8FC20D54C0E3A59BC420D04440	KGKJ 	\tPort Meadville Airport-Meadville, PA\t                                	41.626	-80.215	PA 
0101000020E610000062105839B4A853C0A01A2FDD24E64440	KBFD 	\tBradford Regional Airport-Bradford, PA\t                              	41.798	-78.636	PA 
0101000020E6100000CFF753E3A50B54C00AD7A3703D0A4540	KERI 	\tErie International Airport-Erie, PA\t                                 	42.08	-80.182	PA 
0101000020E6100000AC1C5A643BD752C0B81E85EB51584340	KGED 	\tDelaware Coastal Airport-Georgetown, DE\t                             	38.69	-75.363	DE 
0101000020E6100000D9CEF753E3DD52C01B2FDD2406914340	KDOV 	\tDover Air Force Base-Dover, DE\t                                      	39.133	-75.467	DE 
0101000020E61000005839B4C876E652C0A01A2FDD24D64340	KILG 	\tWilmington Airport-Wilmington, DE\t                                   	39.673	-75.601	DE 
0101000020E6100000BC0512143FEE52C0ED0DBE3099C24340	KEVY 	\tSummit Airport-Middletown, DE\t                                       	39.5203	-75.7226	DE 
0101000020E610000072FE261422D251C0E3FC4D2844C44440	K2B4 	\tNewport, RI\t                                                         	41.53333	-71.28333	RI 
0101000020E6100000C2340C1F11E151C0B79C4B7155F54440	K1B6 	\tWoonsocket, RI\t                                                      	41.91667	-71.51667	RI 
0101000020E6100000A245B6F3FDE451C02FDD240681954440	KBID 	\tBlock Island State Airport-Block Island, RI\t                         	41.168	-71.578	RI 
0101000020E61000004260E5D022F351C0CDCCCCCCCCAC4440	KWST 	\tWesterly State Airport-Westerly, RI\t                                 	41.35	-71.799	RI 
0101000020E6100000273108AC1CD251C04E62105839C44440	KUUU 	\tNewport State Airport-Newport, RI\t                                   	41.533	-71.283	RI 
0101000020E6100000EE7C3F355EDA51C023DBF97E6ACC4440	KOQU 	\tQuonset State Airport-North Kingstown, RI\t                           	41.597	-71.412	RI 
0101000020E6100000C1CAA145B6DB51C0068195438BDC4440	KPVD 	\tT.F. Green State Airport-Providence, RI\t                             	41.723	-71.433	RI 
0101000020E6100000F4FDD478E9DE51C0D9CEF753E3F54440	KSFZ 	\tNorth Central State Airport-Pawtucket, RI\t                           	41.921	-71.483	RI 
0101000020E61000003F355EBA491C55C0713D0AD7A3D04040	KATL 	\tHartsfield-Jackson Atlanta International Airport, GA\t                	33.63	-84.442	GA 
0101000020E6100000CDCCCCCCCC2C54C0B29DEFA7C61B4040	KHXD 	\tHilton Head Airport-Hilton Head Island, SC\t                          	32.217	-80.7	SC 
0101000020E61000007F6ABC74932854C0DBF97E6ABC344040	KARW 	\tBeaufort County Airport-Beaufort County, SC\t                         	32.412	-80.634	SC 
0101000020E6100000D9CEF753E32D54C0E7FBA9F1D23D4040	KNBC 	\tMarine Corps Air Station Beaufort-Beaufort, SC\t                      	32.483	-80.717	SC 
0101000020E6100000D578E926310054C07D3F355EBA594040	KJZI 	\tCharleston Executive Airport-Charleston, SC\t                         	32.701	-80.003	SC 
0101000020E6100000C1CAA145B6FB53C0CDCCCCCCCC6C4040	KCLX 	\tCharleston-Grays, SC\t                                                	32.85	-79.933	SC 
0101000020E6100000B4C876BE9F0254C0508D976E12734040	KCHS 	\tCharleston International Airport-Charleston, SC\t                     	32.899	-80.041	SC 
0101000020E6100000273108AC1CF253C03333333333734040	KLRO 	\tMount Pleasant, SC\t                                                  	32.9	-79.783	SC 
0101000020E61000008D976E12832854C04C37894160754040	KRBW 	\tLowcountry Regional Airport-Walterboro, SC\t                          	32.917	-80.633	SC 
0101000020E610000060E5D022DB1154C0F2D24D6210884040	KDYB 	\tSummerville Airport-Summerville, SC\t                                 	33.063	-80.279	SC 
0101000020E6100000273108AC1C0254C08195438B6C974040	KMKS 	\tBerkeley Moncks, SC\t                                                 	33.183	-80.033	SC 
0101000020E61000008D976E12835854C00000000000A04040	KBNL 	\tBarnwell Regional Airport-Barnwell, SC\t                              	33.25	-81.383	SC 
0101000020E61000003F355EBA49D453C07F6ABC7493A84040	KGGE 	\tGeorgetown County Airport-Georgetown, SC\t                            	33.317	-79.317	SC 
0101000020E6100000F4FDD478E93654C04260E5D022BB4040	KOGB 	\tOrangeburg Municipal Airport-Orangeburg, SC\t                         	33.462	-80.858	SC 
0101000020E61000004C378941600D54C04260E5D022CB4040	KMNI 	\tSantee Cooper Regional Airport-Manning, SC\t                          	33.587	-80.209	SC 
0101000020E61000004C378941604554C01F85EB51B8CE4040	KXNO 	\tNorth Air Force Auxiliary Field-North, SC\t                           	33.615	-81.084	SC 
0101000020E6100000C1CAA145B66B54C03333333333D34040	KAIK 	\tAiken Municipal Airport-Aiken, SC\t                                   	33.65	-81.683	SC 
0101000020E6100000C1CAA145B6BB53C08195438B6CD74040	KMYR 	\tMyrtle Beach International Airport-Myrtle Beach, SC\t                 	33.683	-78.933	SC 
0101000020E61000006666666666F653C0B29DEFA7C6DB4040	KCKI 	\tWilliamsburg Regional Airport-Kingstree, SC\t                         	33.717	-79.85	SC 
0101000020E6100000AE47E17A14AE53C09CC420B072E84040	KCRE 	\tGrand Strand Airport-North Myrtle Beach, SC\t                         	33.816	-78.72	SC 
0101000020E61000002B8716D9CEC753C0448B6CE7FBE94040	KHYW 	\tConway-Horry County Airport-Conway, SC\t                              	33.828	-79.122	SC 
0101000020E6100000643BDF4F8D4754C07F6ABC7493F84040	KCAE 	\tColumbia Metropolitan Airport-West Columbia, SC\t                     	33.942	-81.118	SC 
0101000020E610000033333333333354C0B29DEFA7C6FB4040	KMMT 	\tMcentire Joint National Guard Base-Eastover, SC\t                     	33.967	-80.8	SC 
0101000020E6100000D9CEF753E31D54C0B29DEFA7C6FB4040	KSSC 	\tShaw Air Force Base-Sumter, SC\t                                      	33.967	-80.467	SC 
0101000020E610000039B4C876BE3F54C03F355EBA49FC4040	KCUB 	\tColumbia Owens Downtown Airport-Columbia, SC\t                        	33.971	-80.996	SC 
0101000020E6100000736891ED7C1754C00000000000004140	KSMS 	\tSumter Airport-Sumter, SC\t                                           	34	-80.367	SC 
0101000020E61000003D0AD7A370D553C0BA490C022B174140	KMAO 	\tMarion County Airport-Marion, SC\t                                    	34.181	-79.335	SC 
0101000020E6100000105839B4C8EE53C0F2D24D6210184140	KFLO 	\tFlorence Regional Airport-Florence, SC\t                              	34.188	-79.731	SC 
0101000020E61000001904560E2D8A54C01D5A643BDF1F4140	KGRD 	\tGreenwood County Airport-Greenwood, SC\t                              	34.249	-82.159	SC 
0101000020E61000003F355EBA492454C04E62105839244140	KCDN 	\tWoodward Field (Kershaw County Airport)-Camden, SC\t                  	34.283	-80.567	SC 
0101000020E61000008D976E12836854C06666666666264140	KEOE 	\tNewberry County Airport-Newberry, SC\t                                	34.3	-81.633	SC 
0101000020E6100000E5D022DBF94654C0B81E85EB51284140	KFDW 	\tFairfield County Airport-Winnsboro, SC\t                              	34.315	-81.109	SC 
0101000020E6100000736891ED7C0754C03333333333334140	KHVS 	\tHartsville Regional Airport-Hartsville, SC\t                          	34.4	-80.117	SC 
0101000020E6100000295C8FC2F5F853C0CFF753E3A53B4140	KUDG 	\tDarlington County Jetport-Darlington, SC\t                            	34.466	-79.89	SC 
0101000020E61000003D0AD7A370AD54C039B4C876BE3F4140	KAND 	\tAnderson Regional Airport-Anderson, SC\t                              	34.498	-82.71	SC 
0101000020E6100000CDCCCCCCCC7C54C00000000000404140	KLUX 	\tLaurens, SC\t                                                         	34.5	-81.95	SC 
0101000020E6100000F4FDD478E9EE53C0E5D022DBF94E4140	KBBP 	\tMarlboro County Jetport-Bennettsville, SC\t                           	34.617	-79.733	SC 
0101000020E610000062105839B4B854C0BC74931804564140	KCEU 	\tOconee County Regional Airport-Clemson, SC\t                          	34.672	-82.886	SC 
0101000020E6100000CDCCCCCCCCFC53C0B29DEFA7C65B4140	KCQW 	\tCheraw Municipal Airport-Cheraw, SC\t                                 	34.717	-79.95	SC 
0101000020E610000066666666663654C0B29DEFA7C65B4140	KLKR 	\tLancaster County Airport (Mcwhirter Field)-Lancaster, SC\t            	34.717	-80.85	SC 
0101000020E6100000F2D24D62109854C01B2FDD2406614140	KGYH 	\tDonaldson Center Airport-Greenville, SC\t                             	34.758	-82.376	SC 
0101000020E6100000CDCCCCCCCC4C54C04E62105839644140	KDCM 	\tChester Catawba, SC\t                                                 	34.783	-81.2	SC 
0101000020E6100000CDCCCCCCCCAC54C07F6ABC7493684140	KLQK 	\tPickens County Airport-Pickens, SC\t                                  	34.817	-82.7	SC 
0101000020E6100000A01A2FDD249654C03F355EBA496C4140	KGMU 	\tGreenville Downtown Airport-Greenville, SC\t                          	34.846	-82.346	SC 
0101000020E61000001283C0CAA18D54C08716D9CEF7734140	KGSP 	\tGreenville-Spartanburg International Airport, SC\t                    	34.906	-82.213	SC 
0101000020E6100000CDCCCCCCCC7C54C04C37894160754140	KSPA 	\tSpartanburg Downtown Memorial Airport-Spartanburg, SC\t               	34.917	-81.95	SC 
0101000020E6100000C1CAA145B64354C075931804567E4140	KUZA 	\tRock Hill/York County Airport-Rock Hill, SC\t                         	34.987	-81.058	SC 
0101000020E6100000DDB5847CD0D753C0287E8CB96B394140	KDLC 	\tDillon County Airport-Dillon, SC\t                                    	34.4486	-79.3721	SC 
0101000020E610000092CB7F48BFE153C036CD3B4ED1B94040	KPHH 	\tRobert F. Swinnie Airport-Andrews, SC\t                               	33.4517	-79.5273	SC 
0101000020E6100000BDE3141DC91554C03A92CB7F485F4140	KPYG 	\tPageland Airport-Pageland, SC\t                                       	34.7444	-80.3404	SC 
0101000020E6100000CDCCCCCCCC2C54C01D03B2D7BB1B4040	K49J 	\tHilton Head, SC\t                                                     	32.21667	-80.7	SC 
0101000020E610000072FE2614220254C03333333333734040	KIGC 	\tCharleston Afb, SC\t                                                  	32.9	-80.03333	SC 
0101000020E6100000C2340C1F115154C07D96E7C1DD7D4040	KAQX 	\tAllendale County, SC\t                                                	32.98333	-81.26667	SC 
0101000020E61000005BCEA5B8AA8A54C01D03B2D7BBDB4040	KIRQ 	\tColliers VOR, SC\t                                                    	33.71667	-82.16667	SC 
0101000020E61000003ECBF3E0EE1E54C0CDCCCCCCCCEC4040	K2PJ 	\tSumter-Poinsett, SC\t                                                 	33.85	-80.48333	SC 
0101000020E6100000D8648D7A889854C00000000000604140	KXAA 	\tGrnvl-Dnldsn, SC\t                                                    	34.75	-82.38333	SC 
0101000020E610000033333333334354C07D96E7C1DD7D4140	K29J 	\tRock Hill, SC\t                                                       	34.98333	-81.05	SC 
0101000020E6100000FA7E6ABC74C359C0D9CEF753E3054640	KRAP 	\tRapid City Regional Airport-Rapid City, SD\t                          	44.046	-103.054	SD 
0101000020E6100000C976BE9F1AFF54C062105839B4E84140	KTYS 	\tMc Ghee Tyson Airport, Knoxville, TN\t                                	35.818	-83.986	TN 
0101000020E61000006ABC749318AC55C0AC1C5A643B0F4240	KBNA 	\tNashville Internationl Airport, TN\t                                  	36.119	-86.689	TN 
0101000020E610000060E5D022DB9954C0068195438B3C4240	KTRI 	\tBristol/Tri-Cities Regional Airport, TN\t                             	36.473	-82.404	TN 
0101000020E6100000083D9B559F7355C03D0AD7A370FD4140	K0A3 	\tSmithville Municipal Airport-Smithville, TN\t                         	35.98	-85.8066	TN 
0101000020E61000003ECBF3E0EE9E55C0CDCCCCCCCC4C4240	K1M5 	\tPortland Municipal Airport-Portland, TN\t                             	36.6	-86.48333	TN 
0101000020E61000006DE7FBA9F14258C02FDD240681153C40	KRKP 	\tAransas Coounty-Rockport, TX\t                                        	28.084	-97.046	TX 
0101000020E6100000E5D022DBF99E58C025068195438B3D40	KSAT 	\tSan Antonio International Airport, TX\t                               	29.544	-98.484	TX 
0101000020E6100000D7A3703D0AD757C07B14AE47E1FA3D40	KIAH 	\tGeorge Bush International-Houston, TX\t                               	29.98	-95.36	TX 
0101000020E6100000EC51B81E856B58C0022B8716D92E3E40	KAUS 	\tAustin/Bergstrom International Airport, TX\t                          	30.183	-97.68	TX 
0101000020E6100000643BDF4F8D3758C0BA490C022B574040	KRBD 	\tDallas Executive Airport-Dallas, TX\t                                 	32.681	-96.868	TX 
0101000020E6100000F0A7C64B374158C06DE7FBA9F1724040	KDFW 	\tDallas-Ft Worth International Airport, TX\t                           	32.898	-97.019	TX 
0101000020E61000003108AC1C5A5458C0068195438B7C4040	KAFW 	\tFort Worth Alliance-Fort Worth, TX\t                                  	32.973	-97.318	TX 
0101000020E610000091ED7C3F35B658C0CDCCCCCCCC6C3A40	K67R 	\tRio Grande City Municipal Airport Rio Grande City, TX\t               	26.425	-98.847	TX 
0101000020E6100000B4C876BE9F4A58C09C33A2B437083E40	K84R 	\tSmithville Crawford Muniicipal-Smithville, TX\t                       	30.0321	-97.166	TX 
0101000020E61000003D0AD7A370D553C0D34D621058494240	KDAN 	\tDanville Regional Airport-Danville, VA\t                              	36.573	-79.335	VA 
0101000020E6100000FED478E9260154C054E3A59BC4504240	KMTV 	\tBlue Ridge Airport-Martinsville, VA\t                                 	36.631	-80.018	VA 
0101000020E6100000CBA145B6F3CD54C0C1CAA145B6534240	K0VG 	\tJonesville, VA\t                                                      	36.654	-83.218	VA 
0101000020E6100000068195438B1453C06891ED7C3F554240	KCPK 	\tChesapeake Regional Airport-Norfolk, VA\t                             	36.666	-76.321	VA 
0101000020E61000004A0C022B872653C09EEFA7C64B574240	KSFQ 	\tSuffolk Executive Airport-Suffolk, VA\t                               	36.682	-76.602	VA 
0101000020E6100000273108AC1C8254C08195438B6C574240	KVJI 	\tVirginia Highlands Airport-Abingdon, VA\t                             	36.683	-82.033	VA 
0101000020E6100000F4FDD478E95E53C00E2DB29DEF574240	KEMV 	\tEmporia-Greensville Regional Airport-Emporia, VA\t                    	36.687	-77.483	VA 
0101000020E6100000FA7E6ABC748353C0F2D24D6210584240	KAVC 	\tMecklenburg-Brunswick Regional Airport-South Hill, VA\t               	36.688	-78.054	VA 
0101000020E610000062105839B40853C0295C8FC2F5584240	KNFE 	\tNaval Auxiliary Landing Field Fentress-Chesapeake, VA\t               	36.695	-76.136	VA 
0101000020E61000006F1283C0CA3953C0D34D621058594240	KFKN 	\tFranklin Municipal-John Beverly Rose Airport-Franklin, VA\t           	36.698	-76.903	VA 
0101000020E6100000E9263108AC3454C0355EBA490C624240	KHLX 	\tTwin County Airport-Galax-Hillsville, VA\t                            	36.766	-80.823	VA 
0101000020E6100000894160E5D07253C06DE7FBA9F1624240	KLVL 	\tLawrenceville Municipal Airport-Lawrenceville, VA\t                   	36.773	-77.794	VA 
0101000020E6100000CDCCCCCCCC1C53C04E62105839644240	KPVG 	\tHampton Roads Executive Airport-Chesapeake, VA\t                      	36.783	-76.45	VA 
0101000020E6100000273108AC1C0253C07F6ABC7493684240	KNTU 	\tNaval Air Station Oceana-Virginia Beach, VA\t                         	36.817	-76.033	VA 
0101000020E610000066666666665654C0C3F5285C8F724240	KMKJ 	\tMountain Empire Airport-Marion / Wytheville, VA\t                     	36.895	-81.35	VA 
0101000020E61000003F355EBA490C53C0DD24068195734240	KORF 	\tNorfolk International Airport-Norfolk, VA\t                           	36.903	-76.192	VA 
0101000020E6100000D122DBF97E1253C00E2DB29DEF774240	KNGU 	\tNaval Station Norfolk-Norfolk, VA\t                                   	36.937	-76.289	VA 
0101000020E6100000F2D24D62104053C0E7FBA9F1D27D4240	KAKQ 	\tWakefield Municipal Airport-Wakefield, VA\t                           	36.983	-77.001	VA 
0101000020E610000052B81E85EBA154C05839B4C8767E4240	KLNP 	\tLonesome Pine Airport-Wise, VA\t                                      	36.988	-82.53	VA 
0101000020E6100000508D976E127354C0D578E92631884240	K6V3 	\tRichlands, VA\t                                                       	37.064	-81.798	VA 
0101000020E610000033333333337354C07F6ABC7493884240	KJFZ 	\tRichlands, VA\t                                                       	37.067	-81.8	VA 
0101000020E6100000CDCCCCCCCC7C53C0B4C876BE9F8A4240	KBKT 	\tAllen C. Perkinson Airport-Blackstone, VA\t                           	37.083	-77.95	VA 
0101000020E6100000D7A3703D0A1753C0B4C876BE9F8A4240	KLFI 	\tLangley Air Force Base-Hampton, VA\t                                  	37.083	-76.36	VA 
0101000020E6100000643BDF4F8D1F53C037894160E5904240	KPHF 	\tNewport News/Williamsburg International-Newport News, VA\t            	37.132	-76.493	VA 
0101000020E610000066666666662653C01B2FDD2406914240	KFAF 	\tJoint Base Langley-Eustis-Fort Eustis, VA\t                           	37.133	-76.6	VA 
0101000020E6100000C1CAA145B62B54C01B2FDD2406914240	KPSK 	\tNew River Valley Airport-Dublin, VA\t                                 	37.133	-80.683	VA 
0101000020E610000000000000006053C08195438B6C974240	KPTB 	\tDinwiddie County Airport-Petersburg, VA\t                             	37.183	-77.5	VA 
0101000020E6100000273108AC1C1A54C0B4C876BE9F9A4240	KBCB 	\tVirginiatech/Montgomery Executive Airport-Blacksburg, VA\t            	37.208	-80.408	VA 
0101000020E6100000E7FBA9F1D22D53C03BDF4F8D979E4240	KJGG 	\tWilliamsburg-Jamestown Airport-Williamsburg, VA\t                     	37.239	-76.716	VA 
0101000020E61000007593180456FE53C07F6ABC7493A84240	KROA 	\tRoanoke-Blacksburg Regional Airport-Roanoke, VA\t                     	37.317	-79.974	VA 
0101000020E61000006891ED7C3FCD53C00C022B8716A94240	KLYH 	\tLynchburg Regional Airport-Lynchburg, VA\t                            	37.321	-79.207	VA 
0101000020E610000079E92631089C53C0E7FBA9F1D2AD4240	KFVX 	\tFarmville Regional Airport-Farmville, VA\t                            	37.358	-78.438	VA 
0101000020E61000000C022B87166153C03333333333B34240	KFCI 	\tChesterfield County Airport-Richmond, VA\t                            	37.4	-77.517	VA 
0101000020E6100000E9263108AC5453C0A8C64B3789C14240	KRIC 	\tRichmond International Airport-Sandston, VA\t                         	37.512	-77.323	VA 
0101000020E6100000295C8FC2F53053C0A69BC420B0C24240	KFYJ 	\tMiddle Peninsula Regional Airport-West Point, VA\t                    	37.521	-76.765	VA 
0101000020E610000062105839B4F052C0894160E5D0D24240	KMFV 	\tAccomack County Airport-Melfa, VA\t                                   	37.647	-75.761	VA 
0101000020E6100000B29DEFA7C65B53C0B4C876BE9FDA4240	KOFP 	\tHanover County Municipal Airport-Richmond, VA\t                       	37.708	-77.434	VA 
0101000020E61000008D976E12833853C0CDCCCCCCCCEC4240	KXSA 	\tTappahannock, VA\t                                                    	37.85	-76.883	VA 
0101000020E6100000E7FBA9F1D2DD52C00E2DB29DEFF74240	KWAL 	\tWallops Flight Facility-Wallops Island, VA\t                          	37.937	-75.466	VA 
0101000020E61000003F355EBA49F453C09A99999999F94240	KHSP 	\tIngalls Field-Hot Springs, VA\t                                       	37.95	-79.817	VA 
0101000020E6100000AE47E17A147E53C0E17A14AE47014340	KLKU 	\tLouisa County Airport (Freeman Field)-Louisa, VA\t                    	38.01	-77.97	VA 
0101000020E610000085EB51B81E9D53C0A8C64B3789114340	KCHO 	\tCharlottesville-Albemarle Airport-Charlottesville, VA\t               	38.137	-78.455	VA 
0101000020E61000006DE7FBA9F18253C0560E2DB29D1F4340	KOMH 	\tOrange County Airport-Orange, VA\t                                    	38.247	-78.046	VA 
0101000020E6100000D34D621058B953C06F1283C0CA214340	KSHD 	\tShenandoah Valley Regional Airport-Staunton, VA\t                     	38.264	-78.896	VA 
0101000020E6100000DBF97E6ABC5C53C01904560E2D224340	KEZF 	\tShannon Airport-Fredericksburg, VA\t                                  	38.267	-77.449	VA 
0101000020E610000077BE9F1A2F5D53C06DE7FBA9F1324340	KRMN 	\tStafford Regional Airport-Stafford, VA\t                              	38.398	-77.456	VA 
0101000020E6100000EC51B81E855353C08D976E1283404340	KNYG 	\tMarine Corps Air Facility Quantico-Quantico, VA\t                     	38.504	-77.305	VA 
0101000020E6100000E5D022DBF97653C0FA7E6ABC74434340	KCJR 	\tCulpeper Regional Airport-Culpeper, VA\t                              	38.527	-77.859	VA 
0101000020E61000002FDD2406816D53C05EBA490C024B4340	KHWY 	\tWarrenton-Fauquier Airport-Warrenton, VA\t                            	38.586	-77.711	VA 
0101000020E6100000F2D24D6210A053C04C37894160554340	KLUA 	\tLuray Caverns Arpt, VA\t                                              	38.667	-78.501	VA 
0101000020E6100000F2D24D6210A053C04C37894160554340	KW45 	\tLuray, VA\t                                                           	38.667	-78.501	VA 
0101000020E6100000C1CAA145B64B53C0B29DEFA7C65B4340	KDAA 	\tDavison Army Airfield-Fort Belvoir, VA\t                              	38.717	-77.183	VA 
0101000020E6100000295C8FC2F56053C03F355EBA495C4340	KHEF 	\tManassas Regional Airport-Manassas, VA\t                              	38.721	-77.515	VA 
0101000020E61000000AD7A3703D4253C023DBF97E6A6C4340	KDCA 	\tRonald Reagan National Airport-Arlington County, VA\t                 	38.847	-77.035	VA 
0101000020E610000004560E2DB25D53C09CC420B072784340	KIAD 	\tWashington Dulles International Airport-Dulles, VA\t                  	38.941	-77.464	VA 
0101000020E6100000C1CAA145B66353C0448B6CE7FB894340	KJYO 	\tLeesburg Executive Airport-Leesburg, VA\t                             	39.078	-77.558	VA 
0101000020E6100000F0A7C64B378953C0FCA9F1D24D924340	KOKV 	\tWinchester Regional Airport-Winchester, VA\t                          	39.143	-78.144	VA 
0101000020E61000003108AC1C5A5453C046B6F3FDD4084340	KAPH 	\tA.P. Hill Army Airfield-Fort A.P. Hill, VA\t                          	38.069	-77.318	VA 
0101000020E6100000645DDC46038854C092CB7F48BF9D4240	KGDY 	\tGrundy Municipal Airport-Grundy, VA\t                                 	37.2324	-82.1252	VA 
0101000020E6100000A60A4625754253C0D0B359F5B92A4340	KNDY 	\tNaval Surface Warfare Center Dahlgren-Dahlgren, VA\t                  	38.3338	-77.0384	VA 
0101000020E61000003333333333A353C0CDCCCCCCCC4C4240	KW63 	\tClarksville/Lake Cou, VA\t                                            	36.6	-78.55	VA 
0101000020E61000006666666666B653C09A99999999594240	KW78 	\tSouth Boston/Tuck AR, VA\t                                            	36.7	-78.85	VA 
0101000020E61000000000000000A053C0E3FC4D2844644240	KCXE 	\tChase City Municipal Airport-Chase City, VA\t                         	36.78333	-78.5	VA 
0101000020E61000003ECBF3E0EEBE53C09A99999999794240	KVQN 	\tVolens, VA\t                                                          	36.95	-78.98333	VA 
0101000020E61000000B98C0ADBB8B53C09A99999999794240	KW31 	\tLunenburg County Airport Kenbridge, VA\t                              	36.95	-78.18333	VA 
0101000020E6100000C2340C1F111154C08369183E22824240	KFCX 	\tRoanoke-Floyd County, VA\t                                            	37.01667	-80.26667	VA 
0101000020E6100000C2340C1F11C153C03333333333934240	K0V4 	\tBrookneal/Campbell County, VA\t                                       	37.15	-79.01667	VA 
0101000020E610000066666666668653C01630815B77974240	KW81 	\tCrewe Muni, VA\t                                                      	37.18333	-78.1	VA 
0101000020E61000009A999999991954C09A99999999994240	KRNK 	\tRoanoke-Blacksbg, VA\t                                                	37.2	-80.4	VA 
0101000020E6100000D8648D7A882853C06666666666A64240	KW94 	\tWilliamsburg, VA\t                                                    	37.3	-76.63333	VA 
0101000020E6100000289B7285774753C00000000000C04240	KW96 	\tQuinton/New Kent Center, VA\t                                         	37.5	-77.11667	VA 
0101000020E6100000CDCCCCCCCC1C53C0CDCCCCCCCCCC4240	KW75 	\tSaluda/Hummel Field, VA\t                                             	37.6	-76.45	VA 
0101000020E61000003ECBF3E0EEFE52C0EACF7EA488E84240	KTGI 	\tTangier Island Airport-Tangier, VA\t                                  	37.81667	-75.98333	VA 
0101000020E610000000000000007053C01D03B2D7BBFB4240	K7W4 	\tBumpass/Lake Anna, VA\t                                               	37.96667	-77.75	VA 
0101000020E6100000CDCCCCCCCCBC53C04963B48EAA0A4340	KW13 	\tWaynesboro/Eagles Nest, VA\t                                          	38.08333	-78.95	VA 
0101000020E61000005BCEA5B8AA8A53C03333333333134340	KGVE 	\tGordonsville Municipal Airport-Gordonsville, VA\t                     	38.15	-78.16667	VA 
0101000020E61000008E01D9EBDDBD53C05036E50AEF2E4340	KVBW 	\tBridgewater Airport-Bridgewater, VA\t                                 	38.36667	-78.96667	VA 
0101000020E61000008E01D9EBDD6D53C04963B48EAA4A4340	KW66 	\tWarrenton, VA\t                                                       	38.58333	-77.71667	VA 
0101000020E6100000289B7285777753C0B0C91AF510514340	KCSN 	\tCassanova VOR, VA\t                                                   	38.63333	-77.86667	VA 
0101000020E6100000CDCCCCCCCCAC53C03333333333534340	K8W2 	\tNew Market, VA\t                                                      	38.65	-78.7	VA 
0101000020E610000000000000009053C0B79C4B7155754340	KFRR 	\tFront Royal-Warren County Airport-Front Royal, VA\t                   	38.91667	-78.25	VA 
0101000020E61000003ECBF3E0EE5E53C07D96E7C1DD7D4340	KLWX 	\tSterling, VA\t                                                        	38.98333	-77.48333	VA 
0101000020E6100000289B7285770752C05036E50AEF6E4540	KMNW 	\tWilmington, VT\t                                                      	42.86667	-72.11667	VT 
0101000020E610000000000000005052C0B0C91AF510714540	K5B5 	\tBennington, VT\t                                                      	42.88333	-73.25	VT 
0101000020E610000066666666663652C01630815B77774540	KWDO 	\tWest Dover, VT\t                                                      	42.93333	-72.85	VT 
0101000020E610000033333333333352C05036E50AEF8E4540	K8B3 	\tBall Mountain, VT\t                                                   	43.11667	-72.8	VT 
0101000020E610000066666666664652C07D96E7C1DDFD4540	K6B0 	\tMiddlebury, VT\t                                                      	43.98333	-73.1	VT 
0101000020E61000008E01D9EBDD3D52C0EACF7EA488084640	KSOL 	\tSouth Lincoln, VT\t                                                   	44.06667	-72.96667	VT 
0101000020E61000005BCEA5B8AA4A52C08369183E22424640	KCXX 	\tColchester-88D, VT\t                                                  	44.51667	-73.16667	VT 
0101000020E6100000C2340C1F110152C0545227A089484640	K6B8 	\tLyndonville, VT\t                                                     	44.5667	-72.01667	VT 
0101000020E61000003ECBF3E0EEFE51C03333333333534640	KVT2 	\tWest Burke, VT\t                                                      	44.65	-71.98333	VT 
0101000020E610000072FE2614222252C0ACADD85F76774640	KJAY 	\tJay Peak, VT\t                                                        	44.9333	-72.53333	VT 
0101000020E61000000000000000E051C012143FC6DC7D4640	KVT1 	\tCanaan, VT\t                                                          	44.9833	-71.5	VT 
0101000020E61000002B8716D9CE4F52C0355EBA490C724540	KDDH 	\tWilliam H. Morse State Airport-Bennington, VT\t                       	42.891	-73.247	VT 
0101000020E6100000FED478E9262152C079E9263108AC4540	KVSF 	\tHartness State Airport-Springfield, VT\t                              	43.344	-72.518	VT 
0101000020E6100000CDCCCCCCCC3C52C04E62105839C44540	KRUT 	\tRutland-Southern Vermont Regional Airport-Rutland, VT\t               	43.533	-72.95	VT 
0101000020E61000008716D9CEF72352C0273108AC1C1A4640	KMPV 	\tEdward F. Knapp State Airport-Barre-Montpelier, VT\t                  	44.204	-72.562	VT 
0101000020E6100000F0A7C64B370152C0F6285C8FC2354640	K1V4 	\tSaint Johnsbury St. Johnsbury, VT\t                                   	44.42	-72.019	VT 
0101000020E61000009A999999994952C096438B6CE73B4640	KBTV 	\tBurlington International Airport-Burlington, VT\t                     	44.468	-73.15	VT 
0101000020E61000009EEFA7C64B2752C03108AC1C5A444640	KMVL 	\tMorrisville-Stowe State Airport-Morrisville, VT\t                     	44.534	-72.614	VT 
0101000020E61000000C022B87160152C07F6ABC7493484640	KCDA 	\tCaledonia County Airport-Lyndonville, VT\t                            	44.567	-72.017	VT 
0101000020E6100000F4FDD478E90E52C01B2FDD2406714640	KEFK 	\tNortheast Kingdom International Airport-Newport, VT\t                 	44.883	-72.233	VT 
0101000020E610000066666666664652C08195438B6C774640	KFSO 	\tFranklin County State Airport-Highgate, VT\t                          	44.933	-73.1	VT 
0101000020E61000003C4ED1915CAE5EC08FC2F5285C1F4840	KCVV 	\tCoupeville-Penn Cove, WA\t                                            	48.245	-122.7244	WA 
0101000020E61000006ABC749318945EC046B6F3FDD4B84740	KSEA 	\tSeattle-Tacoma International, WA\t                                    	47.444	-122.314	WA 
0101000020E6100000068195438B545DC08195438B6CD74740	KSFF 	\tFelts Field Spokane, WA\t                                             	47.683	-117.321	WA 
0101000020E61000001904560E2D8A5EC0F853E3A59B144840	KAWO 	\tArlington Municipal Airport-Arlington, WA\t                           	48.161	-122.159	WA 
0101000020E610000054E3A59BC40856C05A643BDF4F3D4640	KGRB 	\tGreen Bay Austin Straubel International Airport, WI\t                 	44.479	-88.137	WI 
0101000020E6100000273108AC1C6256C06666666666464640	KSTE 	\tStevens Point Municipal Airport-Stevens Point, WI\t                   	44.55	-89.533	WI 
0101000020E6100000D578E926316856C0F4FDD478E9764640	KAUW 	\tWausau, WI\t                                                          	44.929	-89.628	WI 
0101000020E61000001D5A643BDF1757C0D34D621058E94640	KRZN 	\tBurnett County Airport-Siren, WI\t                                    	45.823	-92.373	WI 
0101000020E6100000C3F5285C8FBA5AC0FCA9F1D24DD24340	KGEE 	\tEagle County - Gypsum, CO\t                                           	39.643	-106.915	CO 
0101000020E6100000931804560E4D54C0A01A2FDD24A64240	KBLF 	\tMercer County Airport-Bluefield, WV\t                                 	37.298	-81.204	WV 
0101000020E61000001D5A643BDF4754C03108AC1C5AE44240	KBKW 	\tBeckley Raleigh County Memorial Airport-Beckley, WV\t                 	37.784	-81.123	WV 
0101000020E61000009A999999991954C0E5D022DBF9EE4240	KLWB 	\tGreenbrier Valley Airport-Lewisburg, WV\t                             	37.867	-80.4	WV 
0101000020E6100000EC51B81E85A354C01F85EB51B82E4340	KHTS 	\tTri-State Airport-Huntington, WV\t                                    	38.365	-82.555	WV 
0101000020E6100000F6285C8FC26554C08D976E1283304340	KCRW 	\tYeager Airport-Charleston, WV\t                                       	38.379	-81.59	WV 
0101000020E61000001F85EB51B8F653C052B81E85EB714340	KEKN 	\tElkins-Randolph County Airport-Elkins, WV\t                           	38.89	-79.855	WV 
0101000020E6100000F0A7C64B37C953C0AC1C5A643B7F4340	KW99 	\tGrant County Airport Petersburg, WV\t                                 	38.994	-79.144	WV 
0101000020E6100000A8C64B37891154C00000000000804340	KW22 	\tUpshur County Regional Airport Buckhannon, WV\t                       	39	-80.274	WV 
0101000020E6100000E17A14AE475154C09A99999999994340	KPKB 	\tMid-Ohio Valley Regional Airport-Parkersburg, WV\t                    	39.2	-81.27	WV 
0101000020E61000002DB29DEFA70E54C0D9CEF753E3A54340	KCKB 	\tHarrison/Marion Regional Airport-Clarksburg, WV\t                     	39.296	-80.229	WV 
0101000020E610000014AE47E17A7C53C0C1CAA145B6B34340	KMRB 	\tEastern West Virginia Regional-Martinsburg, WV\t                      	39.404	-77.945	WV 
0101000020E61000006DE7FBA9F1FA53C03333333333D34340	KMGW 	\tMorgantown Municipal Airport-Morgantown, WV\t                         	39.65	-79.921	WV 
0101000020E6100000C520B072682954C04A0C022B87164440	KHLG 	\tWheeling-Ohio County Airport-Wheeling, WV\t                           	40.176	-80.647	WV 
0101000020E610000024287E8CB93754C0AEB6627FD91D4340	KSXL 	\tSummersville Airport-Summersville, WV\t                               	38.2332	-80.8707	WV 
\.


--
-- TOC entry 4393 (class 0 OID 19412)
-- Dependencies: 223
-- Data for Name: taf; Type: TABLE DATA; Schema: postgis; Owner: postgres
--

COPY postgis.taf (issued, current, wind, visby, condx, rep_time, stn_call) FROM stdin;
\.


--
-- TOC entry 4404 (class 0 OID 0)
-- Dependencies: 218
-- Name: nexrad_counter_seq; Type: SEQUENCE SET; Schema: postgis; Owner: postgres
--

SELECT pg_catalog.setval('postgis.nexrad_counter_seq', 982728, true);


--
-- TOC entry 4246 (class 2606 OID 18429)
-- Name: airspace_ob_ele airspace_ob_ele_pkey; Type: CONSTRAINT; Schema: postgis; Owner: postgres
--

ALTER TABLE ONLY postgis.airspace_ob_ele
    ADD CONSTRAINT airspace_ob_ele_pkey PRIMARY KEY (airspace_ob_ele_id);


--
-- TOC entry 4242 (class 2606 OID 18413)
-- Name: fisb_products fisb_products_pkey; Type: CONSTRAINT; Schema: postgis; Owner: postgres
--

ALTER TABLE ONLY postgis.fisb_products
    ADD CONSTRAINT fisb_products_pkey PRIMARY KEY (fisb_product_id);


--
-- TOC entry 4250 (class 2606 OID 18470)
-- Name: graphics graphics_pkey; Type: CONSTRAINT; Schema: postgis; Owner: postgres
--

ALTER TABLE ONLY postgis.graphics
    ADD CONSTRAINT graphics_pkey PRIMARY KEY (rep_num, prod_id, alt);


--
-- TOC entry 4238 (class 2606 OID 17949)
-- Name: metar metar_pkey; Type: CONSTRAINT; Schema: postgis; Owner: postgres
--

ALTER TABLE ONLY postgis.metar
    ADD CONSTRAINT metar_pkey PRIMARY KEY (stn_call, ob_date);


--
-- TOC entry 4244 (class 2606 OID 18421)
-- Name: overlay_geo_opt overlay_geo_opt_pkey; Type: CONSTRAINT; Schema: postgis; Owner: postgres
--

ALTER TABLE ONLY postgis.overlay_geo_opt
    ADD CONSTRAINT overlay_geo_opt_pkey PRIMARY KEY (overlay_geo_opt_id);


--
-- TOC entry 4248 (class 2606 OID 18473)
-- Name: pirep pirep_pkey; Type: CONSTRAINT; Schema: postgis; Owner: postgres
--

ALTER TABLE ONLY postgis.pirep
    ADD CONSTRAINT pirep_pkey PRIMARY KEY (rep_time, stn_call);


--
-- TOC entry 4252 (class 2606 OID 19394)
-- Name: sigairmet sigairmet_pkey; Type: CONSTRAINT; Schema: postgis; Owner: postgres
--

ALTER TABLE ONLY postgis.sigairmet
    ADD CONSTRAINT sigairmet_pkey PRIMARY KEY (prod_id, rep_num, stn_call);


--
-- TOC entry 4240 (class 2606 OID 17974)
-- Name: stations st-test_pkey; Type: CONSTRAINT; Schema: postgis; Owner: postgres
--

ALTER TABLE ONLY postgis.stations
    ADD CONSTRAINT "st-test_pkey" PRIMARY KEY (stn_call);


--
-- TOC entry 4254 (class 2606 OID 19419)
-- Name: taf taf_pkey; Type: CONSTRAINT; Schema: postgis; Owner: postgres
--

ALTER TABLE ONLY postgis.taf
    ADD CONSTRAINT taf_pkey PRIMARY KEY (stn_call, rep_time);


-- Completed on 2021-01-26 15:32:29 EST

--
-- PostgreSQL database dump complete
--

