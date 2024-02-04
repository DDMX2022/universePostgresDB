--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    age_in_millions_of_years integer,
    is_spherical boolean,
    distance_from_earth numeric(7,2),
    planet_types integer,
    description text
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
    name character varying(255),
    age_in_millions_of_years integer,
    is_spherical boolean,
    distance_from_earth numeric(5,2),
    planet_types integer,
    description text,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_copy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon_copy (
    moon_copy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    age_in_millions_of_years integer,
    is_spherical boolean,
    distance_from_earth numeric(5,2),
    planet_types integer,
    description text,
    planet_id integer
);


ALTER TABLE public.moon_copy OWNER TO freecodecamp;

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
    name character varying(255),
    age_in_millions_of_years integer,
    is_spherical boolean,
    distance_from_earth numeric(5,2),
    planet_types integer,
    description text,
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
    name character varying(255),
    age_in_millions_of_years integer,
    is_spherical boolean,
    distance_from_earth numeric(5,2),
    planet_types integer,
    description text,
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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 10000, true, 0.00, 5, 'Our galaxy, containing our Solar System.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 9000, true, 2537.00, 3, 'The nearest spiral galaxy to the Milky Way.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 5000, true, 3000.00, 2, 'The third-largest galaxy in the Local Group.');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy', 500, true, 23.16, 7, 'A classic spiral galaxy, known for its well-defined spiral arms.');
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 890, true, 29.35, 5, 'Named for its bright bulge and dark dust lane, resembling a sombrero hat.');
INSERT INTO public.galaxy VALUES (6, 'Pinwheel Galaxy', 210, true, 20.90, 6, 'Noted for its symmetrical spiral arms, rich in star formation.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 4500, true, 0.00, 1, 'Earth''s only natural satellite.', 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 4600, true, 0.00, 2, 'One of Mars'' small moons, slowly spiraling in towards the planet.', 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 4600, true, 0.00, 2, 'The smaller of Mars'' two moons, with a smoother appearance.', 2);
INSERT INTO public.moon VALUES (4, 'Europa', 4500, true, 0.00, 3, 'A moon of Jupiter with a smooth, icy surface.', 3);
INSERT INTO public.moon VALUES (5, 'Ganymede', 4600, true, 0.00, 3, 'The largest moon in the Solar System, orbiting Jupiter.', 3);
INSERT INTO public.moon VALUES (6, 'Callisto', 4600, true, 0.00, 3, 'A heavily cratered moon of Jupiter.', 3);
INSERT INTO public.moon VALUES (7, 'Io', 4500, true, 0.00, 3, 'The most volcanically active body in the Solar System, orbiting Jupiter.', 3);
INSERT INTO public.moon VALUES (8, 'Titan', 4600, true, 0.00, 4, 'The largest moon of Saturn, with thick nitrogen-rich atmosphere.', 4);
INSERT INTO public.moon VALUES (9, 'Enceladus', 4600, true, 0.00, 4, 'A small moon of Saturn known for its icy geysers.', 4);
INSERT INTO public.moon VALUES (10, 'Mimas', 4500, true, 0.00, 4, 'A moon of Saturn known for the large crater Herschel.', 4);
INSERT INTO public.moon VALUES (11, 'Tethys', 4600, true, 0.00, 4, 'A moon of Saturn with a high reflectivity due to water ice.', 4);
INSERT INTO public.moon VALUES (12, 'Dione', 4600, true, 0.00, 4, 'A moon of Saturn, with wispy ice cliffs.', 4);
INSERT INTO public.moon VALUES (13, 'Rhea', 4500, true, 0.00, 4, 'The second-largest moon of Saturn, with an icy surface.', 4);
INSERT INTO public.moon VALUES (14, 'Iapetus', 4600, true, 0.00, 4, 'Known for its two-tone coloration, a moon of Saturn.', 4);
INSERT INTO public.moon VALUES (15, 'Miranda', 4600, true, 0.00, 5, 'A small, icy moon of Uranus with a jumbled landscape.', 5);
INSERT INTO public.moon VALUES (16, 'Ariel', 4500, true, 0.00, 5, 'A moon of Uranus, showing signs of past geological activity.', 5);
INSERT INTO public.moon VALUES (17, 'Umbriel', 4600, true, 0.00, 5, 'A moon of Uranus, with a dark, heavily cratered surface.', 5);
INSERT INTO public.moon VALUES (18, 'Titania', 4500, true, 0.00, 5, 'The largest moon of Uranus, with a mix of craters and canyons.', 5);
INSERT INTO public.moon VALUES (19, 'Oberon', 4600, true, 0.00, 5, 'A moon of Uranus, with a heavily cratered icy surface.', 5);
INSERT INTO public.moon VALUES (20, 'Triton', 4600, true, 0.00, 6, 'The largest moon of Neptune, with geysers of nitrogen.', 6);


--
-- Data for Name: moon_copy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon_copy VALUES (1, 'Luna', 4500, true, 0.00, 1, 'Earth''s only natural satellite.', 1);
INSERT INTO public.moon_copy VALUES (2, 'Phobos', 4600, true, 0.00, 2, 'One of Mars'' small moons, slowly spiraling in towards the planet.', 2);
INSERT INTO public.moon_copy VALUES (3, 'Deimos', 4600, true, 0.00, 2, 'The smaller of Mars'' two moons, with a smoother appearance.', 2);
INSERT INTO public.moon_copy VALUES (4, 'Europa', 4500, true, 0.00, 3, 'A moon of Jupiter with a smooth, icy surface.', 3);
INSERT INTO public.moon_copy VALUES (5, 'Ganymede', 4600, true, 0.00, 3, 'The largest moon in the Solar System, orbiting Jupiter.', 3);
INSERT INTO public.moon_copy VALUES (6, 'Callisto', 4600, true, 0.00, 3, 'A heavily cratered moon of Jupiter.', 3);
INSERT INTO public.moon_copy VALUES (7, 'Io', 4500, true, 0.00, 3, 'The most volcanically active body in the Solar System, orbiting Jupiter.', 3);
INSERT INTO public.moon_copy VALUES (8, 'Titan', 4600, true, 0.00, 4, 'The largest moon of Saturn, with thick nitrogen-rich atmosphere.', 4);
INSERT INTO public.moon_copy VALUES (9, 'Enceladus', 4600, true, 0.00, 4, 'A small moon of Saturn known for its icy geysers.', 4);
INSERT INTO public.moon_copy VALUES (10, 'Mimas', 4500, true, 0.00, 4, 'A moon of Saturn known for the large crater Herschel.', 4);
INSERT INTO public.moon_copy VALUES (11, 'Tethys', 4600, true, 0.00, 4, 'A moon of Saturn with a high reflectivity due to water ice.', 4);
INSERT INTO public.moon_copy VALUES (12, 'Dione', 4600, true, 0.00, 4, 'A moon of Saturn, with wispy ice cliffs.', 4);
INSERT INTO public.moon_copy VALUES (13, 'Rhea', 4500, true, 0.00, 4, 'The second-largest moon of Saturn, with an icy surface.', 4);
INSERT INTO public.moon_copy VALUES (14, 'Iapetus', 4600, true, 0.00, 4, 'Known for its two-tone coloration, a moon of Saturn.', 4);
INSERT INTO public.moon_copy VALUES (15, 'Miranda', 4600, true, 0.00, 5, 'A small, icy moon of Uranus with a jumbled landscape.', 5);
INSERT INTO public.moon_copy VALUES (16, 'Ariel', 4500, true, 0.00, 5, 'A moon of Uranus, showing signs of past geological activity.', 5);
INSERT INTO public.moon_copy VALUES (17, 'Umbriel', 4600, true, 0.00, 5, 'A moon of Uranus, with a dark, heavily cratered surface.', 5);
INSERT INTO public.moon_copy VALUES (18, 'Titania', 4500, true, 0.00, 5, 'The largest moon of Uranus, with a mix of craters and canyons.', 5);
INSERT INTO public.moon_copy VALUES (19, 'Oberon', 4600, true, 0.00, 5, 'A moon of Uranus, with a heavily cratered icy surface.', 5);
INSERT INTO public.moon_copy VALUES (20, 'Triton', 4600, true, 0.00, 6, 'The largest moon of Neptune, with geysers of nitrogen.', 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 4500, true, 0.00, 3, 'The only planet known to support life.', 1);
INSERT INTO public.planet VALUES (2, 'Mars', 4600, true, 0.78, 2, 'The Red Planet, known for its dusty, cold desert world.', 2);
INSERT INTO public.planet VALUES (3, 'Jupiter', 4567, true, 4.20, 5, 'The largest planet in our solar system, with a prominent red spot.', 3);
INSERT INTO public.planet VALUES (4, 'Neptune', 4500, true, 30.07, 4, 'A cold blue planet, known for its strong winds and storms.', 1);
INSERT INTO public.planet VALUES (5, 'Venus', 4600, true, 0.28, 3, 'The second planet from the Sun, with a toxic atmosphere and surface temperatures hot enough to melt lead.', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 4567, true, 8.52, 5, 'Known for its stunning ring system, made up of ice and rock particles.', 2);
INSERT INTO public.planet VALUES (7, 'Mercury', 4400, true, 0.39, 1, 'The smallest and closest planet to the Sun, with a very thin atmosphere.', 2);
INSERT INTO public.planet VALUES (8, 'Uranus', 4500, true, 19.22, 6, 'An ice giant with a unique blue-green color, tilted on its side.', 3);
INSERT INTO public.planet VALUES (9, 'Pluto', 4600, true, 39.48, 0, 'A dwarf planet in the Kuiper belt, known for its heart-shaped glacier.', 3);
INSERT INTO public.planet VALUES (10, 'Kepler-22b', 3000, true, 620.00, 7, 'An exoplanet located in the habitable zone of its star, possibly capable of supporting life.', 1);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1d', 5000, true, 40.00, 8, 'One of the seven Earth-size planets in the TRAPPIST-1 system, potentially habitable.', 2);
INSERT INTO public.planet VALUES (12, 'Proxima b', 4800, true, 4.24, 9, 'An exoplanet orbiting within the habitable zone of the Proxima Centauri star.', 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpha Centauri', 4600, true, 4.37, 2, 'The closest star system to the Solar System.', 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 8000, false, 642.50, 0, 'A red supergiant star approaching the end of its life cycle.', 2);
INSERT INTO public.star VALUES (3, 'Sirius', 242, true, 8.60, 1, 'The brightest star in the Earth''s night sky.', 3);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 4600, true, 4.24, 1, 'The closest known star to the Sun and part of the Alpha Centauri star system.', 1);
INSERT INTO public.star VALUES (5, 'Vega', 455, true, 25.04, 2, 'The fifth-brightest star in the night sky and the brightest star in the constellation of Lyra.', 2);
INSERT INTO public.star VALUES (6, 'Altair', 1250, true, 16.70, 3, 'One of the closest stars visible to the naked eye and part of the Summer Triangle asterism.', 3);


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
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon_copy moon_copy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_copy
    ADD CONSTRAINT moon_copy_name_unique UNIQUE (name);


--
-- Name: moon_copy moon_copy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_copy
    ADD CONSTRAINT moon_copy_pkey PRIMARY KEY (moon_copy_id);


--
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


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

