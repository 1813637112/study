--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years numeric(10,2),
    galaxy_types integer,
    distance_from_earth numeric(10,2),
    has_life boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years numeric(10,2),
    distance_from_earth numeric(10,2),
    is_spherical boolean,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years numeric(10,2),
    planet_types integer NOT NULL,
    distance_from_earth numeric(10,2),
    has_life boolean,
    is_spherical boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years numeric(10,2),
    distance_from_earth numeric(10,2),
    is_spherical boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.types (
    types_id integer NOT NULL,
    name character varying(30),
    description text,
    planet_id integer NOT NULL
);


ALTER TABLE public.types OWNER TO freecodecamp;

--
-- Name: types_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.types_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.types_type_id_seq OWNER TO freecodecamp;

--
-- Name: types_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.types_type_id_seq OWNED BY public.types.types_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: types types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.types ALTER COLUMN types_id SET DEFAULT nextval('public.types_type_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'aaa', 'aaaaaaa', 34.32, 1, 343.33, false);
INSERT INTO public.galaxy VALUES (2, 'bb', 'bbbbbbb', 34.34, 1, 3243.40, false);
INSERT INTO public.galaxy VALUES (3, 'ccc', 'ccccccc', 343.33, 2, 344.33, false);
INSERT INTO public.galaxy VALUES (4, 'dddd', 'ddddddddd', 282.20, 2, 32423.23, false);
INSERT INTO public.galaxy VALUES (5, 'aasdfa', 'agfaaaaaa', 34.32, 1, 343.33, false);
INSERT INTO public.galaxy VALUES (6, 'bsdfb', 'bbdfdsbbbbb', 34.34, 2, 3243.40, false);
INSERT INTO public.galaxy VALUES (7, 'cdecc', 'ceeecccccc', 343.33, 3, 344.33, false);
INSERT INTO public.galaxy VALUES (8, 'ddwdd', 'dddddddddd', 282.20, 4, 32423.23, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (44, 'a1', 'aaad', 4500.00, 384.40, true, 1);
INSERT INTO public.moon VALUES (45, 'b1', 'aaad', 2100.00, 232.11, true, 1);
INSERT INTO public.moon VALUES (46, 'c1', 'aaad', 3500.00, 671.00, true, 2);
INSERT INTO public.moon VALUES (47, 'c2', 'aaad', 4200.00, 232.11, true, 2);
INSERT INTO public.moon VALUES (48, 'd1', 'aaad', 3800.00, 108.90, true, 3);
INSERT INTO public.moon VALUES (49, 'd2', 'aaad', 3900.00, 232.11, true, 3);
INSERT INTO public.moon VALUES (50, 'e1', 'aaad', 4100.00, 232.11, true, 4);
INSERT INTO public.moon VALUES (51, 'f1', 'aaad', 2200.00, 232.11, true, 4);
INSERT INTO public.moon VALUES (52, 'dd1', 'aaad', 2900.00, 232.11, true, 5);
INSERT INTO public.moon VALUES (53, 'g1', 'aaad', 3100.00, 232.11, true, 5);
INSERT INTO public.moon VALUES (54, 'h1', 'aaad', 3300.00, 232.11, true, 6);
INSERT INTO public.moon VALUES (55, 'gfa1', 'aaad', 2700.00, 232.11, true, 11);
INSERT INTO public.moon VALUES (56, 'i1', 'aaad', 2400.00, 232.11, true, 1);
INSERT INTO public.moon VALUES (57, 'a3', 'aaad', 2600.00, 232.11, true, 1);
INSERT INTO public.moon VALUES (58, 'a4', 'aaad', 2800.00, 232.11, true, 1);
INSERT INTO public.moon VALUES (59, 'da1', 'aaad', 3000.00, 232.11, true, 9);
INSERT INTO public.moon VALUES (60, 'fa1', 'aaad', 3200.00, 232.11, true, 12);
INSERT INTO public.moon VALUES (61, 'adfg1', 'aaad', 3400.00, 232.11, true, 10);
INSERT INTO public.moon VALUES (62, 'afgf1', 'aaad', 3600.00, 232.11, true, 7);
INSERT INTO public.moon VALUES (63, 'asdf1', 'aaad', 3700.00, 232.11, true, 11);
INSERT INTO public.moon VALUES (64, 'dga1', 'aaad', 3800.00, 232.11, true, 10);
INSERT INTO public.moon VALUES (65, 'bba1', 'aaad', 4000.00, 232.11, true, 14);
INSERT INTO public.moon VALUES (66, 'aggg1', 'aaad', 4300.00, 232.11, true, 10);
INSERT INTO public.moon VALUES (67, 'agg1', 'aaad', 4400.00, 232.11, true, 8);
INSERT INTO public.moon VALUES (68, 'adfffff1', 'aaad', 4600.00, 232.11, true, 10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'a', 'aaad', 21.22, 1, 232.11, false, true, 1);
INSERT INTO public.planet VALUES (2, 'ab', 'azxcad', 21.22, 1, 232.11, true, true, 2);
INSERT INTO public.planet VALUES (3, 'b', 'aasd', 21.22, 2, 232.11, false, true, 3);
INSERT INTO public.planet VALUES (4, 'abc', 'azxcad', 21.22, 1, 232.11, true, true, 1);
INSERT INTO public.planet VALUES (5, 'c', 'aadd', 21.22, 2, 232.11, false, true, 4);
INSERT INTO public.planet VALUES (6, 'ac', 'azxcad', 21.22, 1, 232.11, false, true, 8);
INSERT INTO public.planet VALUES (7, 'd', 'aadd', 21.22, 1, 232.11, false, false, 5);
INSERT INTO public.planet VALUES (8, 'as', 'aazxcd', 21.22, 1, 232.11, false, true, 1);
INSERT INTO public.planet VALUES (9, 'e', 'aadd', 21.22, 2, 232.11, false, false, 6);
INSERT INTO public.planet VALUES (10, 'ass', 'azxcad', 21.22, 1, 232.11, false, true, 5);
INSERT INTO public.planet VALUES (11, 'f', 'adad', 21.22, 2, 232.11, false, true, 7);
INSERT INTO public.planet VALUES (12, 'add', 'aad', 21.22, 1, 232.11, false, true, 4);
INSERT INTO public.planet VALUES (13, 'g', 'aadzcxd', 21.22, 3, 232.11, false, true, 8);
INSERT INTO public.planet VALUES (14, 'aa', 'aad', 21.22, 1, 232.11, false, true, 4);
INSERT INTO public.planet VALUES (15, 'h', 'adazcxd', 21.22, 1, 232.11, false, true, 1);
INSERT INTO public.planet VALUES (16, 'aaa', 'zxcaad', 21.22, 1, 232.11, false, true, 3);
INSERT INTO public.planet VALUES (17, 'i', 'aadd', 21.22, 1, 232.11, false, true, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'dd', 'dfsdfsdf', 334.22, 343.23, false, 1);
INSERT INTO public.star VALUES (2, 'ddfd', 'dddddfsdfsdf', 334.22, 343.23, true, 2);
INSERT INTO public.star VALUES (3, 'ddd', 'dddddddfsdfsdf', 334.22, 343.23, true, 3);
INSERT INTO public.star VALUES (4, 'ddaad', 'dddddaaaddfsdfsdf', 334.22, 343.23, false, 4);
INSERT INTO public.star VALUES (5, 'dqqdaad', 'dqqddddaaaddfsdfsdf', 334.22, 343.23, true, 5);
INSERT INTO public.star VALUES (6, 'dqqdddaad', 'dqqdddddddaaaddfsdfsdf', 334.22, 343.23, true, 5);
INSERT INTO public.star VALUES (7, 'aaadqqdddaad', 'dqqdddddddddaaaddfsdfsdf', 334.22, 343.23, true, 6);
INSERT INTO public.star VALUES (8, 'aaddadqqdddaad', 'dddqqdddddddddaaaddfsdfsdf', 334.22, 343.23, false, 7);
INSERT INTO public.star VALUES (9, 'aaddsssadqqdddaad', 'dddqqssdddddddddaaaddfsdfsdf', 334.22, 343.23, false, 8);


--
-- Data for Name: types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.types VALUES (1, 'a', 'ddddd', 1);
INSERT INTO public.types VALUES (2, 'b', 'ddddddd', 2);
INSERT INTO public.types VALUES (3, 'c', 'ddddddd', 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 68, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 18, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: types_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.types_type_id_seq', 3, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: types types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_name_key UNIQUE (name);


--
-- Name: types types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_pkey PRIMARY KEY (types_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: types types_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--

