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
    name character varying(255) NOT NULL,
    age_in_billions_of_years numeric(5,2) NOT NULL,
    is_active boolean NOT NULL,
    distance_from_earth integer NOT NULL
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
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    diameter_in_km integer NOT NULL,
    is_geologically_active boolean NOT NULL,
    orbital_period_days numeric(5,2) NOT NULL
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
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    has_life boolean NOT NULL,
    orbit_radius_in_au numeric(5,2) NOT NULL,
    number_of_moons integer NOT NULL
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
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    mass_in_solar_masses numeric(5,3) NOT NULL,
    is_main_sequence boolean NOT NULL,
    temperature integer NOT NULL
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
-- Name: starsystem; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.starsystem (
    starsystem_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    distance numeric(10,2) NOT NULL,
    has_planets boolean NOT NULL
);


ALTER TABLE public.starsystem OWNER TO freecodecamp;

--
-- Name: starsystem_starsystem_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.starsystem_starsystem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.starsystem_starsystem_id_seq OWNER TO freecodecamp;

--
-- Name: starsystem_starsystem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.starsystem_starsystem_id_seq OWNED BY public.starsystem.starsystem_id;


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
-- Name: starsystem starsystem_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.starsystem ALTER COLUMN starsystem_id SET DEFAULT nextval('public.starsystem_starsystem_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13.80, true, 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10.00, true, 2530000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 3.00, true, 3000000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 8.00, false, 23000000);
INSERT INTO public.galaxy VALUES (5, 'Messier 87', 10.00, true, 53000000);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 12.00, true, 21000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3474, false, 27.30);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22, false, 0.30);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12, false, 1.30);
INSERT INTO public.moon VALUES (4, 'Io', 3, 3643, true, 1.80);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 3121, false, 3.50);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 5268, false, 7.20);
INSERT INTO public.moon VALUES (7, 'Titan', 4, 5150, false, 15.90);
INSERT INTO public.moon VALUES (8, 'Enceladus', 4, 504, true, 1.40);
INSERT INTO public.moon VALUES (9, 'Mimas', 4, 396, false, 0.90);
INSERT INTO public.moon VALUES (10, 'Tethys', 4, 1060, false, 1.90);
INSERT INTO public.moon VALUES (11, 'Rhea', 4, 763, false, 4.50);
INSERT INTO public.moon VALUES (12, 'Dione', 4, 1122, false, 2.70);
INSERT INTO public.moon VALUES (13, 'Hyperion', 4, 270, true, 21.30);
INSERT INTO public.moon VALUES (14, 'Iapetus', 4, 1469, false, 79.30);
INSERT INTO public.moon VALUES (15, 'Charon', 9, 1212, false, 6.40);
INSERT INTO public.moon VALUES (16, 'Nereid', 5, 340, false, 360.10);
INSERT INTO public.moon VALUES (17, 'Ariel', 5, 1157, false, 2.50);
INSERT INTO public.moon VALUES (18, 'Umbriel', 5, 1177, false, 4.10);
INSERT INTO public.moon VALUES (19, 'Miranda', 5, 471, false, 1.40);
INSERT INTO public.moon VALUES (20, 'Caliban', 5, 231, true, 1.20);
INSERT INTO public.moon VALUES (21, 'Sycorax', 5, 166, false, 0.60);
INSERT INTO public.moon VALUES (22, 'Prospero', 5, 108, true, 1.10);
INSERT INTO public.moon VALUES (23, 'Setebos', 5, 101, false, 0.70);
INSERT INTO public.moon VALUES (24, 'Puck', 5, 162, true, 0.80);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, 1.00, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 1, false, 1.50, 2);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, false, 5.20, 79);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, false, 9.50, 83);
INSERT INTO public.planet VALUES (5, 'Uranus', 1, false, 19.80, 27);
INSERT INTO public.planet VALUES (6, 'Neptune', 1, false, 30.10, 14);
INSERT INTO public.planet VALUES (7, 'Mercury', 1, false, 0.39, 0);
INSERT INTO public.planet VALUES (8, 'Venus', 1, false, 0.72, 0);
INSERT INTO public.planet VALUES (9, 'Pluto', 1, false, 39.50, 5);
INSERT INTO public.planet VALUES (10, 'Europa', 3, false, 0.00, 0);
INSERT INTO public.planet VALUES (11, 'Titan', 4, false, 0.08, 0);
INSERT INTO public.planet VALUES (12, 'Ganymede', 3, false, 0.03, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.000, true, 5778);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 2.100, true, 9940);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 20.000, false, 3500);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 0.120, true, 3050);
INSERT INTO public.star VALUES (5, 'Rigel', 1, 21.000, false, 12000);
INSERT INTO public.star VALUES (6, 'Altair', 1, 1.800, true, 7600);


--
-- Data for Name: starsystem; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.starsystem VALUES (1, 'Alpha Centauri', 'Closest star system', 4.37, true);
INSERT INTO public.starsystem VALUES (2, 'Sirius', 'Brightest star', 8.60, true);
INSERT INTO public.starsystem VALUES (3, 'Betelgeuse', 'Red supergiant star', 642.50, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: starsystem_starsystem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.starsystem_starsystem_id_seq', 3, true);


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
-- Name: starsystem starsystem_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.starsystem
    ADD CONSTRAINT starsystem_name_key UNIQUE (name);


--
-- Name: starsystem starsystem_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.starsystem
    ADD CONSTRAINT starsystem_pkey PRIMARY KEY (starsystem_id);


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
-- PostgreSQL database dump complete
--

