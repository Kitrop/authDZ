--
-- PostgreSQL database dump
--

-- Dumped from database version 15.0
-- Dumped by pg_dump version 15.0

-- Started on 2022-10-30 20:20:09

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
-- TOC entry 6 (class 2615 OID 16502)
-- Name: auth; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 16504)
-- Name: users; Type: TABLE; Schema: auth; Owner: postgres
--

CREATE TABLE auth.users (
    id integer NOT NULL,
    full_name character varying NOT NULL,
    login character varying NOT NULL,
    password character varying NOT NULL
);


ALTER TABLE auth.users OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16503)
-- Name: users_id_seq; Type: SEQUENCE; Schema: auth; Owner: postgres
--

CREATE SEQUENCE auth.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth.users_id_seq OWNER TO postgres;

--
-- TOC entry 3324 (class 0 OID 0)
-- Dependencies: 215
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: postgres
--

ALTER SEQUENCE auth.users_id_seq OWNED BY auth.users.id;


--
-- TOC entry 3174 (class 2604 OID 16507)
-- Name: users id; Type: DEFAULT; Schema: auth; Owner: postgres
--

ALTER TABLE ONLY auth.users ALTER COLUMN id SET DEFAULT nextval('auth.users_id_seq'::regclass);


--
-- TOC entry 3318 (class 0 OID 16504)
-- Dependencies: 216
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: postgres
--

INSERT INTO auth.users (id, full_name, login, password) VALUES (1, 'evgeniy', 'EvgShb', 'e20sh20');
INSERT INTO auth.users (id, full_name, login, password) VALUES (2, 'Kirill Osipov', 'Penguin', 'qwerty');
INSERT INTO auth.users (id, full_name, login, password) VALUES (3, 'Petya Shirokyi', 'tepliza', 'gregre');
INSERT INTO auth.users (id, full_name, login, password) VALUES (4, 'Kolya Tapkin', 'krutoi', 'myu');
INSERT INTO auth.users (id, full_name, login, password) VALUES (5, 'Olya Nova', 'zxc', '123qwe');
INSERT INTO auth.users (id, full_name, login, password) VALUES (6, 'Kirill Raze ', 'catVkusniy ', 'firstSF');
INSERT INTO auth.users (id, full_name, login, password) VALUES (7, 'Nastya Kornilova', 'bfi2202', 'dr15022004');
INSERT INTO auth.users (id, full_name, login, password) VALUES (8, 'Masha Bae', 'gghh', 'gghh');
INSERT INTO auth.users (id, full_name, login, password) VALUES (9, 'Polyna Yolkina', 'yolka', 'Pyolka');
INSERT INTO auth.users (id, full_name, login, password) VALUES (10, 'Evgeniy Godin', 'EvGodIn', 'godin_');
INSERT INTO auth.users (id, full_name, login, password) VALUES (11, 'Pasha Smek', 'Smek123', 'finally123');
INSERT INTO auth.users (id, full_name, login, password) VALUES (12, 'Abdul', 'Abdul123', '1234');
INSERT INTO auth.users (id, full_name, login, password) VALUES (13, '!!!', '@#@$', '@$%@%@#%@%^#&#&');
INSERT INTO auth.users (id, full_name, login, password) VALUES (14, 'Aval', 'Aval1234', '1234');
INSERT INTO auth.users (id, full_name, login, password) VALUES (15, '@', 'orangevoe', '123123');


--
-- TOC entry 3325 (class 0 OID 0)
-- Dependencies: 215
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: postgres
--

SELECT pg_catalog.setval('auth.users_id_seq', 15, true);


-- Completed on 2022-10-30 20:20:09

--
-- PostgreSQL database dump complete
--

