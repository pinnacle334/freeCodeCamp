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
    galaxy_type text,
    age_in_millions_of_years integer,
    light_years_from_earth numeric(4,3),
    stars_in_billion integer
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
    name character varying(30),
    is_spherical boolean,
    distance_from_earth_in_km numeric(7,2),
    composition text,
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
    name character varying(30),
    has_life boolean NOT NULL,
    is_spherical boolean,
    planet_type text,
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
-- Name: planet_properties; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_properties (
    planet_properties_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_solid boolean
);


ALTER TABLE public.planet_properties OWNER TO freecodecamp;

--
-- Name: planet_properties_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_properties_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_properties_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_properties_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_properties_planet_id_seq OWNED BY public.planet_properties.planet_properties_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    age_in_millions_of_years integer,
    diameter_in_km numeric(7,4),
    composition text,
    galaxy character varying(30),
    galaxy_id integer NOT NULL,
    luminosity numeric(12,2)
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
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_properties planet_properties_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_properties ALTER COLUMN planet_properties_id SET DEFAULT nextval('public.planet_properties_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13600, 0.000, 100);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10000, 2.537, 1000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 12200, 2.723, 40);
INSERT INTO public.galaxy VALUES (4, 'Large Magellaic Cloud', 'Dwarf Irregular', 13800, 0.163, 10);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Barred Spiral', 14000, 9.990, NULL);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Eliptical', 13000, 5.300, 18);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', true, 38440.00, 'Rock, Regolith', 1);
INSERT INTO public.moon VALUES (2, 'Phobos', true, 9377.00, 'Rock, Ice', 2);
INSERT INTO public.moon VALUES (3, 'Deimos', true, 23460.00, 'Rock, Ice', 2);
INSERT INTO public.moon VALUES (4, 'Titan', true, 12217.00, 'Nitrogen, Methane', 4);
INSERT INTO public.moon VALUES (5, 'Europa', true, 62800.00, 'Water Ice, Silicate Rock', 3);
INSERT INTO public.moon VALUES (6, 'Ganymede', true, 10704.00, 'Rock, Water', 4);
INSERT INTO public.moon VALUES (7, 'Callisto', true, 18827.00, 'Rock, Water', 4);
INSERT INTO public.moon VALUES (8, 'Io', true, 4217.00, 'Rock, Sulfur', 4);
INSERT INTO public.moon VALUES (9, 'Enceladus', true, 23800.00, 'Ice, Water', 5);
INSERT INTO public.moon VALUES (10, 'Mimas', true, 18500.00, 'Ice, Rock', 5);
INSERT INTO public.moon VALUES (11, 'Titania', true, 43500.00, 'Water, Ice', 6);
INSERT INTO public.moon VALUES (12, 'Oberon', true, 58300.00, 'Ice, Water', 6);
INSERT INTO public.moon VALUES (13, 'Miranda', true, 12900.00, 'Ice, Rock', 6);
INSERT INTO public.moon VALUES (14, 'Triton', true, 35600.00, 'Ice, Rock', 7);
INSERT INTO public.moon VALUES (15, 'Charon', true, 19570.00, 'Water, Rock', 8);
INSERT INTO public.moon VALUES (16, 'Rhea', true, 52700.00, 'Water, Ice', 5);
INSERT INTO public.moon VALUES (17, 'Hyperion', true, 15000.00, 'Ice, Rock', 5);
INSERT INTO public.moon VALUES (18, 'Ganymede II', true, 10500.00, 'Water, Ice', 4);
INSERT INTO public.moon VALUES (19, 'Enceladus II', true, 29850.00, 'Ice, Rock', 5);
INSERT INTO public.moon VALUES (20, 'Europa II', true, 7998.00, 'Ice, Rock', 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, true, 'Terrestrial', 1);
INSERT INTO public.planet VALUES (2, 'Mars', false, true, 'Terrestrial', 1);
INSERT INTO public.planet VALUES (3, 'Venus', false, true, 'Terrestrial', 2);
INSERT INTO public.planet VALUES (4, 'Jupiter', false, true, 'Gas Giant', 3);
INSERT INTO public.planet VALUES (5, 'Titan', false, true, 'Moon (satelite)', 4);
INSERT INTO public.planet VALUES (6, 'Saturn', false, true, 'Gas Giant', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', false, true, 'Ice Giant', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', false, true, 'Ice Giant', 1);
INSERT INTO public.planet VALUES (9, 'Keplar-22b', false, true, 'Exoplanet', 3);
INSERT INTO public.planet VALUES (10, 'Alpha Centauri-B', false, true, 'Exoplanet', 2);
INSERT INTO public.planet VALUES (11, 'Proxima B', false, true, 'Exoplanet', 3);
INSERT INTO public.planet VALUES (12, 'Gliese-581g', false, true, 'Exoplanet', 3);


--
-- Data for Name: planet_properties; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_properties VALUES (1, 'Water', false);
INSERT INTO public.planet_properties VALUES (2, 'Rock', true);
INSERT INTO public.planet_properties VALUES (3, 'Gas', false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4600, 139.0000, 'Hydrogen, Helium', 'Milky Way', 1, 1.00);
INSERT INTO public.star VALUES (2, 'Sirius', 242, 242.5000, 'Hydrogen, Helium, Metals', 'Milky Way', 1, 1.52);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 10000, 121.2400, 'Hydrogen, Helium, Carbon', 'Andromeda', 2, 100000.00);
INSERT INTO public.star VALUES (4, 'Rigel', 10000, 138.2500, 'Hydrogen, Helium', 'Triangulum', 3, 25.40);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 4700, 201.0000, 'Hydrogen, Helium', 'Large Magellanic Cloud', 4, 0.00);
INSERT INTO public.star VALUES (6, 'Antares', 1200, 142.0000, 'Hydrogen, Helium', 'Andromeda', 2, 0.01);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_properties_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_properties_planet_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: planet_properties planet_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_properties
    ADD CONSTRAINT planet_properties_pkey PRIMARY KEY (planet_properties_id);


--
-- Name: planet_properties planet_properties_properties_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_properties
    ADD CONSTRAINT planet_properties_properties_key UNIQUE (name);


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

