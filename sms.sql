--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.6
-- Dumped by pg_dump version 9.6.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.studentcourseclass
    DROP CONSTRAINT studentcourseclass_student_rollno_fk;
ALTER TABLE ONLY public.studentcourseclass
    DROP CONSTRAINT studentcourseclass_courseclass_ccid_fk;
ALTER TABLE ONLY public.studentclass
    DROP CONSTRAINT studentclass_student_rollno_fk;
ALTER TABLE ONLY public.studentclass
    DROP CONSTRAINT studentclass_class_id_fk;
ALTER TABLE ONLY public.courseclass
    DROP CONSTRAINT courseclass_course_courseid_fk;
ALTER TABLE ONLY public.courseclass
    DROP CONSTRAINT courseclass_class_id_fk;
ALTER TABLE ONLY public.classresult
    DROP CONSTRAINT classresult_class_id_fk;
ALTER TABLE ONLY public.admissiondates
    DROP CONSTRAINT admission_dates_student__fk;
DROP INDEX public.admission_dates_std_id_uindex;
ALTER TABLE ONLY public.users
    DROP CONSTRAINT users_pkey;
ALTER TABLE ONLY public.studentclass
    DROP CONSTRAINT studentclass_year_pk;
ALTER TABLE ONLY public.student
    DROP CONSTRAINT student_std_id_pk;
ALTER TABLE ONLY public.classresult
    DROP CONSTRAINT result_year_class_id_pk;
ALTER TABLE ONLY public.courseclass
    DROP CONSTRAINT courseclass_ccid_pk;
ALTER TABLE ONLY public.course
    DROP CONSTRAINT course_course_id_pk;
ALTER TABLE ONLY public.class
    DROP CONSTRAINT class_class_id_pk;
ALTER TABLE ONLY public.admissiondates
    DROP CONSTRAINT admission_dates_std_id_pk;
ALTER TABLE public.courseclass
    ALTER COLUMN ccid DROP DEFAULT;
ALTER TABLE public.course
    ALTER COLUMN courseid DROP DEFAULT;
ALTER TABLE public.class
    ALTER COLUMN id DROP DEFAULT;
DROP TABLE public.users;
DROP TABLE public.studentcourseclass;
DROP TABLE public.studentclass;
DROP SEQUENCE public.student_rollno_seq;
DROP TABLE public.student;
DROP SEQUENCE public.courseclass_ccid_seq;
DROP TABLE public.courseclass;
DROP SEQUENCE public.course_courseid_seq;
DROP TABLE public.course;
DROP TABLE public.classresult;
DROP SEQUENCE public.class_id_seq;
DROP TABLE public.class;
DROP TABLE public.admissiondates;
DROP EXTENSION adminpack;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: admissiondates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE admissiondates
(
    rollno      character varying NOT NULL,
    admitdate   date              NOT NULL,
    leavingdate date
);


ALTER TABLE admissiondates
    OWNER TO postgres;

--
-- Name: class; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE class
(
    name character varying NOT NULL,
    id   character varying NOT NULL
);


ALTER TABLE class
    OWNER TO postgres;

--
-- Name: class_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE class_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE class_id_seq
    OWNER TO postgres;

--
-- Name: class_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE class_id_seq OWNED BY class.id;


--
-- Name: classresult; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE classresult
(
    year          character varying NOT NULL,
    totalappeared integer,
    passed        integer,
    failed        integer,
    percentage    real,
    classid       character varying NOT NULL
);


ALTER TABLE classresult
    OWNER TO postgres;

--
-- Name: TABLE classresult; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE classresult IS 'This table is to store Result of Students';


--
-- Name: course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE course
(
    courseid   character varying NOT NULL,
    coursename character varying
);


ALTER TABLE course
    OWNER TO postgres;

--
-- Name: TABLE course; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE course IS 'Contain Info about course';


--
-- Name: course_courseid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE course_courseid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE course_courseid_seq
    OWNER TO postgres;

--
-- Name: course_courseid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE course_courseid_seq OWNED BY course.courseid;


--
-- Name: courseclass; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE courseclass
(
    ccid     character varying NOT NULL,
    courseid character varying,
    classid  character varying,
    year     character varying
);


ALTER TABLE courseclass
    OWNER TO postgres;

--
-- Name: courseclass_ccid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE courseclass_ccid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE courseclass_ccid_seq
    OWNER TO postgres;

--
-- Name: courseclass_ccid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE courseclass_ccid_seq OWNED BY courseclass.ccid;


--
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE student
(
    stdname       character varying,
    rollno        character varying NOT NULL,
    cnic          character varying,
    fathername    character varying,
    fathercnic    character varying,
    address       character varying,
    district      character varying,
    tehsil        character varying,
    dob           date,
    status        character varying,
    guardianname  character varying,
    guardiancnic  character varying,
    contact1      character varying,
    contact2      character varying,
    qualification character varying,
    bloodgroup    character varying,
    department    character varying
);


ALTER TABLE student
    OWNER TO postgres;

--
-- Name: TABLE student; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE student IS 'Contains Student Information';


--
-- Name: student_rollno_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE student_rollno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE student_rollno_seq
    OWNER TO postgres;

--
-- Name: student_rollno_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE student_rollno_seq OWNED BY student.rollno;


--
-- Name: studentclass; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE studentclass
(
    stdrollno   character varying NOT NULL,
    classid     character varying NOT NULL,
    year        character varying NOT NULL,
    boardrollno character varying,
    classstatus character varying
);


ALTER TABLE studentclass
    OWNER TO postgres;

--
-- Name: studentcourseclass; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE studentcourseclass
(
    marks     real,
    year      character varying,
    stdrollno character varying NOT NULL,
    ccid      character varying NOT NULL,
    status    character varying
);


ALTER TABLE studentcourseclass
    OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users
(
    username character varying NOT NULL,
    password character varying,
    role     character varying
);


ALTER TABLE users
    OWNER TO postgres;

--
-- Name: class id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY class
    ALTER COLUMN id SET DEFAULT nextval('class_id_seq'::regclass);


--
-- Name: course courseid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY course
    ALTER COLUMN courseid SET DEFAULT nextval('course_courseid_seq'::regclass);


--
-- Name: courseclass ccid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY courseclass
    ALTER COLUMN ccid SET DEFAULT nextval('courseclass_ccid_seq'::regclass);


--
-- Data for Name: admissiondates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY admissiondates (rollno, admitdate, leavingdate) FROM stdin;
151	2015-02-22	\N
1813	2018-02-05	2018-02-06
1814	2018-02-06	\N
\.


--
-- Data for Name: class; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY class (name, id) FROM stdin;
SE	1
CS	2
IT	3
MSC	4
\.


--
-- Name: class_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('class_id_seq', 4, true);


--
-- Data for Name: classresult; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY classresult (year, totalappeared, passed, failed, percentage, classid) FROM stdin;
\.


--
-- Data for Name: course; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY course (courseid, coursename) FROM stdin;
321	Networking
350	OS
4	OOp
\.


--
-- Name: course_courseid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('course_courseid_seq', 5, true);


--
-- Data for Name: courseclass; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY courseclass (ccid, courseid, classid, year) FROM stdin;
2	321	1	2017
5	321	2	2021
6	4	1	2010
7	350	3	2013
8	350	2	2015
\.


--
-- Name: courseclass_ccid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('courseclass_ccid_seq', 8, true);


--
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY student (stdname, rollno, cnic, fathername, fathercnic, address, district, tehsil, dob, status, guardianname,
              guardiancnic, contact1, contact2, qualification, bloodgroup, department) FROM stdin;
jjk	1812	lkj	jlkj	lkj	j	ljll	ljl	2018-02-25	studying	jlkj	jlj	13	31	Ù¾Ø±Ø§Ø¦ÙØ±Û	A+	Ø¯Ø±Ø³ ÙØ¸Ø§ÙÛ Ø¢Ù¹Ú¾ Ø³Ø§ÙÛ
Ali	151	352012035455	skjddksjl	352012453652	djfghksjkdj	LHR	LHR	2018-02-21	studying	asdfgg	555454545	03244865656	520335454	Ù¾Ø±Ø§Ø¦ÙØ±Û	A+	Ø¯Ø±Ø³ ÙØ¸Ø§ÙÛ Ø¢Ù¹Ú¾ Ø³Ø§ÙÛ
Muhammad Azam	1801	336	Abdul Ghafoor	123	OKR	LHR	LHR	2018-02-04	Left	Ab	231	033	42	Ø§ÛÙ Ø§Û	B+	Ø­ÙØ¸ Ø§ÙÙØ±Ø¢Ù
j	1813	lj	l	jl	jl	jl	jl	2018-02-05	Left	l	jl	4645	54	Ù¾Ø±Ø§Ø¦ÙØ±Û	A+	Ø¯Ø±Ø³ ÙØ¸Ø§ÙÛ Ø¢Ù¹Ú¾ Ø³Ø§ÙÛ
Azam	1814	545	Abdul Ghafoor	12321	LHR	LHR	LHR	2018-02-06	studying	\N	\N	123	132	Ù¾Ø±Ø§Ø¦ÙØ±Û	A+	Ø¯Ø±Ø³ ÙØ¸Ø§ÙÛ Ø¢Ù¹Ú¾ Ø³Ø§ÙÛ
lkjh	1811	46	54	564	6	6	4	2018-02-16	Left	65	4	54	65	Ù¾Ø±Ø§Ø¦ÙØ±Û	A+	Ø¯Ø±Ø³ ÙØ¸Ø§ÙÛ Ø¢Ù¹Ú¾ Ø³Ø§ÙÛ
\.


--
-- Name: student_rollno_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('student_rollno_seq', 2, true);


--
-- Data for Name: studentclass; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY studentclass (stdrollno, classid, year, boardrollno, classstatus) FROM stdin;
1801	2	2015	\N	\N
1811	1	2013	\N	\N
\.


--
-- Data for Name: studentcourseclass; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY studentcourseclass (marks, year, stdrollno, ccid, status) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (username, password, role) FROM stdin;
h	j	Admin
azam	azam	Admin
zahid	123	Admin
lh	kjhg	Admin
\.


--
-- Name: admissiondates admission_dates_std_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY admissiondates
    ADD CONSTRAINT admission_dates_std_id_pk PRIMARY KEY (rollno, admitdate);


--
-- Name: class class_class_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY class
    ADD CONSTRAINT class_class_id_pk PRIMARY KEY (id);


--
-- Name: course course_course_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY course
    ADD CONSTRAINT course_course_id_pk PRIMARY KEY (courseid);


--
-- Name: courseclass courseclass_ccid_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY courseclass
    ADD CONSTRAINT courseclass_ccid_pk PRIMARY KEY (ccid);


--
-- Name: classresult result_year_class_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY classresult
    ADD CONSTRAINT result_year_class_id_pk PRIMARY KEY (year, classid);


--
-- Name: student student_std_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY student
    ADD CONSTRAINT student_std_id_pk PRIMARY KEY (rollno);


--
-- Name: studentclass studentclass_year_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY studentclass
    ADD CONSTRAINT studentclass_year_pk PRIMARY KEY (year, stdrollno, classid);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- Name: admission_dates_std_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX admission_dates_std_id_uindex ON admissiondates USING btree (rollno);


--
-- Name: admissiondates admission_dates_student__fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY admissiondates
    ADD CONSTRAINT admission_dates_student__fk FOREIGN KEY (rollno) REFERENCES student (rollno) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: classresult classresult_class_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY classresult
    ADD CONSTRAINT classresult_class_id_fk FOREIGN KEY (classid) REFERENCES class (id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: courseclass courseclass_class_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY courseclass
    ADD CONSTRAINT courseclass_class_id_fk FOREIGN KEY (classid) REFERENCES class (id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: courseclass courseclass_course_courseid_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY courseclass
    ADD CONSTRAINT courseclass_course_courseid_fk FOREIGN KEY (courseid) REFERENCES course (courseid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: studentclass studentclass_class_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY studentclass
    ADD CONSTRAINT studentclass_class_id_fk FOREIGN KEY (classid) REFERENCES class (id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: studentclass studentclass_student_rollno_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY studentclass
    ADD CONSTRAINT studentclass_student_rollno_fk FOREIGN KEY (stdrollno) REFERENCES student (rollno) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: studentcourseclass studentcourseclass_courseclass_ccid_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY studentcourseclass
    ADD CONSTRAINT studentcourseclass_courseclass_ccid_fk FOREIGN KEY (ccid) REFERENCES courseclass (ccid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: studentcourseclass studentcourseclass_student_rollno_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY studentcourseclass
    ADD CONSTRAINT studentcourseclass_student_rollno_fk FOREIGN KEY (stdrollno) REFERENCES student (rollno) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

