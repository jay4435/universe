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
    age_in_billion_years numeric(4,2) NOT NULL,
    size_in_light_years integer NOT NULL,
    type text NOT NULL
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
    atmosphere boolean NOT NULL,
    shape character varying(30) NOT NULL,
    diameter_in_km integer NOT NULL,
    planet_id integer
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
-- Name: nebula; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.nebula (
    nebula_id integer NOT NULL,
    name character varying(20) NOT NULL,
    constellation text,
    size_in_light_years numeric(4,2)
);


ALTER TABLE public.nebula OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.nebula_nebula_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nebula_nebula_id_seq OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.nebula_nebula_id_seq OWNED BY public.nebula.nebula_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type text NOT NULL,
    habitable boolean,
    no_of_moons integer,
    surface_temp_celsius text NOT NULL,
    star_id integer
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
    age_in_billion_years numeric(5,3) NOT NULL,
    type text NOT NULL,
    distance_from_earth text NOT NULL,
    no_of_planets integer NOT NULL,
    galaxy_id integer
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: nebula nebula_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula ALTER COLUMN nebula_id SET DEFAULT nextval('public.nebula_nebula_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13.60, 100000, 'Barren Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10.00, 220000, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 12.00, 60000, 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 12.00, 49000, 'Unbarred Spiral');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 10.00, 76000, 'Spiral');
INSERT INTO public.galaxy VALUES (6, 'Messier 51', 12.00, 120000, 'Elliptical');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (8, 'Phobos', false, 'Irregular', 22, 4);
INSERT INTO public.moon VALUES (9, 'Deimos', false, 'Irregular', 12, 4);
INSERT INTO public.moon VALUES (1, 'Titan', true, 'Spherical', 5151, 6);
INSERT INTO public.moon VALUES (5, 'Enceladus', true, 'Spherical', 504, 6);
INSERT INTO public.moon VALUES (2, 'Europa', true, 'Spherical', 3121, 5);
INSERT INTO public.moon VALUES (3, 'Ganymede', true, 'Spherical', 5268, 5);
INSERT INTO public.moon VALUES (4, 'Callisto', false, 'Spherical', 4821, 5);
INSERT INTO public.moon VALUES (6, 'Io', true, 'Spherical', 3643, 5);
INSERT INTO public.moon VALUES (7, 'Triton', true, 'Spherical', 2706, 8);
INSERT INTO public.moon VALUES (11, 'Dione', false, 'Spherical', 1123, 6);
INSERT INTO public.moon VALUES (12, 'Mimas', false, 'Spherical', 396, 6);
INSERT INTO public.moon VALUES (13, 'Rhea', false, 'Spherical', 1527, 6);
INSERT INTO public.moon VALUES (14, 'Iapetus', false, 'Spherical', 1470, 6);
INSERT INTO public.moon VALUES (10, 'Charon', false, 'Spherical', 1212, 9);
INSERT INTO public.moon VALUES (15, 'Miranda', false, 'Spherical', 471, 7);
INSERT INTO public.moon VALUES (16, 'Oberon', false, 'Spherical', 1523, 7);
INSERT INTO public.moon VALUES (17, 'Ariel', false, 'Spherical', 1158, 7);
INSERT INTO public.moon VALUES (18, 'Umbriel', false, 'Spherical', 1169, 7);
INSERT INTO public.moon VALUES (19, 'Hyperion', false, 'Irregular', 270, 6);
INSERT INTO public.moon VALUES (20, 'Nereid', false, 'Irregular', 340, 9);


--
-- Data for Name: nebula; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.nebula VALUES (1, 'Orion Nebula', 'Orion', 24.00);
INSERT INTO public.nebula VALUES (2, 'Crab Nebula', 'Taurus', 11.00);
INSERT INTO public.nebula VALUES (3, 'Eagle Nebula', 'Serpens', 70.00);
INSERT INTO public.nebula VALUES (4, 'Ring Nebula', 'Lyra', 1.00);
INSERT INTO public.nebula VALUES (5, 'Horsehead Nebula', 'Orion', 3.50);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'rocky', false, 0, '167', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Terrestrial', false, 0, '465', 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Terrestrial', true, 1, '15', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestrial', false, 2, '-60', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas Giant', false, 92, '-145', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas Giant', false, 145, '-178', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice Giant', false, 27, '-195', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice Giant', false, 14, '-200', 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Dwarf Planet', false, 5, '-225', 1);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 'Terrestrial (Exoplanet)', true, NULL, '-39', 2);
INSERT INTO public.planet VALUES (11, 'Kepler-186f', 'Terrestrial (Exoplanet)', true, NULL, '-85', 6);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1d', 'Terrestrial (Exoplanet)', true, NULL, '-28', 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4.600, 'g-type', '0', 8, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 4.240, 'm-type', '4.24', 3, 1);
INSERT INTO public.star VALUES (3, 'Sirius A', 0.300, 'a-type', '8.6', 1, 1);
INSERT INTO public.star VALUES (4, 'Trappist-1', 0.700, 'm-type cool dwarf', '39', 7, 1);
INSERT INTO public.star VALUES (5, 'LHS-1140', 3.500, 'm-type', '40', 2, 1);
INSERT INTO public.star VALUES (6, 'Kepler-186', 1.000, 'k-type', '500', 5, 1);
INSERT INTO public.star VALUES (7, 'NGC-604', 0.003, 'blue supergiant', '270000', 0, 3);
INSERT INTO public.star VALUES (8, 'S Andromedae', 2.000, 'm-type', '270000', 0, 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.nebula_nebula_id_seq', 5, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


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
-- Name: nebula nebula_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_name_key UNIQUE (name);


--
-- Name: nebula nebula_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_pkey PRIMARY KEY (nebula_id);


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

