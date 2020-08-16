--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: flyway_schema_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE public.flyway_schema_history OWNER TO postgres;

--
-- Name: mytable; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mytable (
    mycolumn character varying(100) NOT NULL,
    phone2 character varying(20)
);


ALTER TABLE public.mytable OWNER TO postgres;

--
-- Name: test_view; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.test_view AS
 SELECT mytable.mycolumn
   FROM public.mytable;


ALTER TABLE public.test_view OWNER TO postgres;

--
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
1	1	<< Flyway Baseline >>	BASELINE	<< Flyway Baseline >>	\N	null	2020-08-15 13:58:35.96238	0	t
2	2	createtable	SQL	V2__createtable.sql	-1527846543	postgres	2020-08-15 13:59:02.58597	15	t
3	3	add elements	SQL	V3__add_elements.sql	825511842	postgres	2020-08-15 14:01:37.425958	8	t
4	4	simple view	SQL	V4__simple_view.sql	1330129101	postgres	2020-08-15 14:14:36.032369	10	t
5	5	add phone	SQL	V5__add_phone.sql	890042998	postgres	2020-08-15 17:52:29.735968	12	t
\.


--
-- Data for Name: mytable; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mytable (mycolumn, phone2) FROM stdin;
ahmed	\N
aicha	\N
aicha2	\N
\.


--
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX flyway_schema_history_s_idx ON public.flyway_schema_history USING btree (success);


--
-- PostgreSQL database dump complete
--

