--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.24
-- Dumped by pg_dump version 9.5.24

-- Started on 2023-06-07 08:55:03 UTC

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12361)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2204 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 56274)
-- Name: course_competency_collection; Type: TABLE; Schema: public; Owner: sunbird
--

CREATE TABLE public.course_competency_collection (
    course_competency_id character varying(255) NOT NULL,
    competency_name character varying(255),
    competency_type character varying(255),
    course_id character varying(255),
    course_name character varying(255)
);


ALTER TABLE public.course_competency_collection OWNER TO sunbird;

--
-- TOC entry 184 (class 1259 OID 56282)
-- Name: course_curated; Type: TABLE; Schema: public; Owner: sunbird
--

CREATE TABLE public.course_curated (
    course_curated_id character varying(255) NOT NULL,
    course_id character varying(255),
    type character varying(255),
    curated_id character varying(255)
);


ALTER TABLE public.course_curated OWNER TO sunbird;

--
-- TOC entry 186 (class 1259 OID 56298)
-- Name: master_course; Type: TABLE; Schema: public; Owner: sunbird
--

CREATE TABLE public.master_course (
    master_course_id character varying(255) NOT NULL,
    avg_rating real NOT NULL,
    course_id character varying(255),
    course_name character varying(255),
    created_date character varying(255),
    durationh real NOT NULL,
    durationhms character varying(255),
    num_of_people_rated integer NOT NULL,
    org_name character varying(255),
    published_date character varying(255),
    publishedmmyy character varying(255),
    root_org_id character varying(255),
    status character varying(255),
    total_rating integer NOT NULL
);


ALTER TABLE public.master_course OWNER TO sunbird;

--
-- TOC entry 187 (class 1259 OID 56306)
-- Name: master_curated_collection; Type: TABLE; Schema: public; Owner: sunbird
--

CREATE TABLE public.master_curated_collection (
    curated_id character varying(255) NOT NULL,
    curated_durationh real,
    curated_durationhms character varying(255),
    curated_name character varying(255)
);


ALTER TABLE public.master_curated_collection OWNER TO sunbird;

--
-- TOC entry 189 (class 1259 OID 56322)
-- Name: master_org_hierarchy; Type: TABLE; Schema: public; Owner: sunbird
--

CREATE TABLE public.master_org_hierarchy (
    org_hierarchy_id character varying(255) NOT NULL,
    dept_id character varying(255),
    dept_name character varying(255),
    ms_id character varying(255),
    ms_name character varying(255),
    ms_type character varying(255),
    org_id character varying(255),
    org_name character varying(255)
);


ALTER TABLE public.master_org_hierarchy OWNER TO sunbird;

--
-- TOC entry 188 (class 1259 OID 56314)
-- Name: master_organization; Type: TABLE; Schema: public; Owner: sunbird
--

CREATE TABLE public.master_organization (
    root_org_id character varying(255) NOT NULL,
    creation_date character varying(255),
    creation_datemmyy character varying(255),
    org_name character varying(255),
    status character varying(255),
    user_count integer NOT NULL
);


ALTER TABLE public.master_organization OWNER TO sunbird;

--
-- TOC entry 190 (class 1259 OID 56330)
-- Name: master_program; Type: TABLE; Schema: public; Owner: sunbird
--

CREATE TABLE public.master_program (
    program_id character varying(255) NOT NULL,
    last_published_date character varying(255),
    created_date character varying(255),
    durationh real NOT NULL,
    org_name character varying(255),
    program_durationhms character varying(255),
    program_name character varying(255),
    program_status character varying(255),
    root_org_id character varying(255)
);


ALTER TABLE public.master_program OWNER TO sunbird;

--
-- TOC entry 185 (class 1259 OID 56290)
-- Name: master_user; Type: TABLE; Schema: public; Owner: sunbird
--

CREATE TABLE public.master_user (
    user_id character varying(255) NOT NULL,
    created_date character varying(255),
    created_datemmyy character varying(255),
    designation character varying(255),
    email character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    org_name character varying(255),
    phone character varying(255),
    profile_update_status character varying(255),
    roles character varying(255),
    root_org_id character varying(255)
);


ALTER TABLE public.master_user OWNER TO sunbird;

--
-- TOC entry 182 (class 1259 OID 56255)
-- Name: org_hierarchy_v2; Type: TABLE; Schema: public; Owner: sunbird
--

CREATE TABLE public.org_hierarchy_v2 (
    id integer NOT NULL,
    orgname character varying(256) NOT NULL,
    channel character varying(1024) NOT NULL,
    mapid character varying(256) NOT NULL,
    orgcode character varying(256),
    parentmapid character varying(1024) NOT NULL,
    sborgid character varying(32),
    sbrootorgid character varying(32),
    sborgtype character varying(16),
    sborgsubtype character varying(16),
    l1mapid character varying(256),
    l2mapid character varying(256),
    l3mapid character varying(256),
    l1orgname character varying(256),
    l2orgname character varying(256),
    l3orgname character varying(256)
);


ALTER TABLE public.org_hierarchy_v2 OWNER TO sunbird;

--
-- TOC entry 181 (class 1259 OID 56253)
-- Name: org_hierarchy_v2_id_seq; Type: SEQUENCE; Schema: public; Owner: sunbird
--

CREATE SEQUENCE public.org_hierarchy_v2_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.org_hierarchy_v2_id_seq OWNER TO sunbird;

--
-- TOC entry 2205 (class 0 OID 0)
-- Dependencies: 181
-- Name: org_hierarchy_v2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sunbird
--

ALTER SEQUENCE public.org_hierarchy_v2_id_seq OWNED BY public.org_hierarchy_v2.id;


--
-- TOC entry 195 (class 1259 OID 56510)
-- Name: org_hierarchy_v4; Type: TABLE; Schema: public; Owner: sunbird
--

CREATE TABLE public.org_hierarchy_v4 (
    id integer NOT NULL,
    orgname character varying(256) NOT NULL,
    channel character varying(1024) NOT NULL,
    mapid character varying(256) NOT NULL,
    orgcode character varying(256),
    parentmapid character varying(1024) NOT NULL,
    sborgid character varying(32),
    sbrootorgid character varying(32),
    sborgtype character varying(32),
    sborgsubtype character varying(32),
    l1mapid character varying(256),
    l1orgname character varying(256),
    l2mapid character varying(256),
    l2orgname character varying(256),
    l3mapid character varying(256),
    l3orgname character varying(256)
);


ALTER TABLE public.org_hierarchy_v4 OWNER TO sunbird;

--
-- TOC entry 194 (class 1259 OID 56508)
-- Name: org_hierarchy_v4_id_seq; Type: SEQUENCE; Schema: public; Owner: sunbird
--

CREATE SEQUENCE public.org_hierarchy_v4_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.org_hierarchy_v4_id_seq OWNER TO sunbird;

--
-- TOC entry 2206 (class 0 OID 0)
-- Dependencies: 194
-- Name: org_hierarchy_v4_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sunbird
--

ALTER SEQUENCE public.org_hierarchy_v4_id_seq OWNED BY public.org_hierarchy_v4.id;


--
-- TOC entry 191 (class 1259 OID 56349)
-- Name: program_batch; Type: TABLE; Schema: public; Owner: sunbird
--

CREATE TABLE public.program_batch (
    program_batch_id character varying(255) NOT NULL,
    batch_id character varying(255),
    end_date character varying(255),
    start_date character varying(255),
    program_id character varying(255)
);


ALTER TABLE public.program_batch OWNER TO sunbird;

--
-- TOC entry 192 (class 1259 OID 56357)
-- Name: user_course_enrolment; Type: TABLE; Schema: public; Owner: sunbird
--

CREATE TABLE public.user_course_enrolment (
    enrolment_id character varying(255) NOT NULL,
    certificate_status character varying(255),
    completed_on character varying(255),
    completed_onmmyy character varying(255),
    completion_percentage character varying(255),
    completion_status character varying(255),
    course_id character varying(255),
    enrolled_date character varying(255),
    enrolled_datemmyy character varying(255),
    rating character varying(255),
    user_id character varying(255)
);


ALTER TABLE public.user_course_enrolment OWNER TO sunbird;

--
-- TOC entry 193 (class 1259 OID 56365)
-- Name: user_program_enrolment; Type: TABLE; Schema: public; Owner: sunbird
--

CREATE TABLE public.user_program_enrolment (
    user_program_enrolment_id character varying(255) NOT NULL,
    batch_id character varying(255),
    certificate_status character varying(255),
    completed_on character varying(255),
    program_id character varying(255),
    rating integer NOT NULL,
    status character varying(255),
    user_id character varying(255)
);


ALTER TABLE public.user_program_enrolment OWNER TO sunbird;

--
-- TOC entry 2048 (class 2604 OID 56258)
-- Name: id; Type: DEFAULT; Schema: public; Owner: sunbird
--

ALTER TABLE ONLY public.org_hierarchy_v2 ALTER COLUMN id SET DEFAULT nextval('public.org_hierarchy_v2_id_seq'::regclass);


--
-- TOC entry 2049 (class 2604 OID 56513)
-- Name: id; Type: DEFAULT; Schema: public; Owner: sunbird
--

ALTER TABLE ONLY public.org_hierarchy_v4 ALTER COLUMN id SET DEFAULT nextval('public.org_hierarchy_v4_id_seq'::regclass);


--
-- TOC entry 2055 (class 2606 OID 56281)
-- Name: course_competency_collection_pkey; Type: CONSTRAINT; Schema: public; Owner: sunbird
--

ALTER TABLE ONLY public.course_competency_collection
    ADD CONSTRAINT course_competency_collection_pkey PRIMARY KEY (course_competency_id);


--
-- TOC entry 2057 (class 2606 OID 56289)
-- Name: course_curated_pkey; Type: CONSTRAINT; Schema: public; Owner: sunbird
--

ALTER TABLE ONLY public.course_curated
    ADD CONSTRAINT course_curated_pkey PRIMARY KEY (course_curated_id);


--
-- TOC entry 2061 (class 2606 OID 56305)
-- Name: master_course_pkey; Type: CONSTRAINT; Schema: public; Owner: sunbird
--

ALTER TABLE ONLY public.master_course
    ADD CONSTRAINT master_course_pkey PRIMARY KEY (master_course_id);


--
-- TOC entry 2063 (class 2606 OID 56313)
-- Name: master_curated_collection_pkey; Type: CONSTRAINT; Schema: public; Owner: sunbird
--

ALTER TABLE ONLY public.master_curated_collection
    ADD CONSTRAINT master_curated_collection_pkey PRIMARY KEY (curated_id);


--
-- TOC entry 2067 (class 2606 OID 56329)
-- Name: master_org_hierarchy_pkey; Type: CONSTRAINT; Schema: public; Owner: sunbird
--

ALTER TABLE ONLY public.master_org_hierarchy
    ADD CONSTRAINT master_org_hierarchy_pkey PRIMARY KEY (org_hierarchy_id);


--
-- TOC entry 2065 (class 2606 OID 56321)
-- Name: master_organization_pkey; Type: CONSTRAINT; Schema: public; Owner: sunbird
--

ALTER TABLE ONLY public.master_organization
    ADD CONSTRAINT master_organization_pkey PRIMARY KEY (root_org_id);


--
-- TOC entry 2069 (class 2606 OID 56337)
-- Name: master_program_pkey; Type: CONSTRAINT; Schema: public; Owner: sunbird
--

ALTER TABLE ONLY public.master_program
    ADD CONSTRAINT master_program_pkey PRIMARY KEY (program_id);


--
-- TOC entry 2059 (class 2606 OID 56297)
-- Name: master_user_pkey; Type: CONSTRAINT; Schema: public; Owner: sunbird
--

ALTER TABLE ONLY public.master_user
    ADD CONSTRAINT master_user_pkey PRIMARY KEY (user_id);


--
-- TOC entry 2051 (class 2606 OID 56265)
-- Name: org_hierarchy_v2_channel_key; Type: CONSTRAINT; Schema: public; Owner: sunbird
--

ALTER TABLE ONLY public.org_hierarchy_v2
    ADD CONSTRAINT org_hierarchy_v2_channel_key UNIQUE (channel);


--
-- TOC entry 2053 (class 2606 OID 56263)
-- Name: org_hierarchy_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: sunbird
--

ALTER TABLE ONLY public.org_hierarchy_v2
    ADD CONSTRAINT org_hierarchy_v2_pkey PRIMARY KEY (id);


--
-- TOC entry 2077 (class 2606 OID 56520)
-- Name: org_hierarchy_v4_channel_key; Type: CONSTRAINT; Schema: public; Owner: sunbird
--

ALTER TABLE ONLY public.org_hierarchy_v4
    ADD CONSTRAINT org_hierarchy_v4_channel_key UNIQUE (channel);


--
-- TOC entry 2079 (class 2606 OID 56518)
-- Name: org_hierarchy_v4_pkey; Type: CONSTRAINT; Schema: public; Owner: sunbird
--

ALTER TABLE ONLY public.org_hierarchy_v4
    ADD CONSTRAINT org_hierarchy_v4_pkey PRIMARY KEY (id);


--
-- TOC entry 2071 (class 2606 OID 56356)
-- Name: program_batch_pkey; Type: CONSTRAINT; Schema: public; Owner: sunbird
--

ALTER TABLE ONLY public.program_batch
    ADD CONSTRAINT program_batch_pkey PRIMARY KEY (program_batch_id);


--
-- TOC entry 2073 (class 2606 OID 56364)
-- Name: user_course_enrolment_pkey; Type: CONSTRAINT; Schema: public; Owner: sunbird
--

ALTER TABLE ONLY public.user_course_enrolment
    ADD CONSTRAINT user_course_enrolment_pkey PRIMARY KEY (enrolment_id);


--
-- TOC entry 2075 (class 2606 OID 56372)
-- Name: user_program_enrolment_pkey; Type: CONSTRAINT; Schema: public; Owner: sunbird
--

ALTER TABLE ONLY public.user_program_enrolment
    ADD CONSTRAINT user_program_enrolment_pkey PRIMARY KEY (user_program_enrolment_id);


--
-- TOC entry 2081 (class 2606 OID 56378)
-- Name: fk2vmvv672t6r1j58y2nu28hk88; Type: FK CONSTRAINT; Schema: public; Owner: sunbird
--

ALTER TABLE ONLY public.program_batch
    ADD CONSTRAINT fk2vmvv672t6r1j58y2nu28hk88 FOREIGN KEY (program_id) REFERENCES public.master_program(program_id);


--
-- TOC entry 2080 (class 2606 OID 56373)
-- Name: fksk0uk2scv07my4nitb4la68by; Type: FK CONSTRAINT; Schema: public; Owner: sunbird
--

ALTER TABLE ONLY public.course_curated
    ADD CONSTRAINT fksk0uk2scv07my4nitb4la68by FOREIGN KEY (curated_id) REFERENCES public.master_curated_collection(curated_id);


--
-- TOC entry 2203 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2023-06-07 08:55:03 UTC

--
-- PostgreSQL database dump complete
--


