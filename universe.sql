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
    name character varying(80) NOT NULL,
    galaxy_type character varying(80) NOT NULL,
    description text,
    n_planets_m integer,
    n_stars_m integer,
    age_in_billions_of_years numeric(10,2),
    has_supermassive_black_hole boolean,
    distance_from_earth_ly integer
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
    name character varying(80) NOT NULL,
    description text,
    planet_id integer,
    orbit_period_days numeric(10,3)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_mood_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_mood_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_mood_id_seq OWNER TO freecodecamp;

--
-- Name: moon_mood_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_mood_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(80) NOT NULL,
    description text,
    orbit_period_days integer NOT NULL,
    number_of_moons integer,
    diameter_km numeric(10,2),
    has_rings boolean,
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
    name character varying(80) NOT NULL,
    galaxy_id integer NOT NULL,
    type character varying(80),
    mass numeric(10,2),
    age_million_years integer,
    distance_from_earth integer,
    visible_from_earth boolean,
    description text
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
-- Name: supermassive_black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.supermassive_black_hole (
    supermassive_black_hole_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    mass numeric(15,2),
    distance_light_years numeric(20,2),
    galaxy character varying(80)
);


ALTER TABLE public.supermassive_black_hole OWNER TO freecodecamp;

--
-- Name: supermassive_black_hole_sbh_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.supermassive_black_hole_sbh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.supermassive_black_hole_sbh_id_seq OWNER TO freecodecamp;

--
-- Name: supermassive_black_hole_sbh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.supermassive_black_hole_sbh_id_seq OWNED BY public.supermassive_black_hole.supermassive_black_hole_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_mood_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: supermassive_black_hole supermassive_black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.supermassive_black_hole ALTER COLUMN supermassive_black_hole_id SET DEFAULT nextval('public.supermassive_black_hole_sbh_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', 'Our home galaxy containing the Solar System.', 8000, 100000, 13.51, true, 27000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 'Nearest major galaxy to the Milky Way.', 10000, 1000000, 10.00, true, 2537000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 'A member of the Local Group of galaxies.', 2000, 40000, 13.72, false, 3000000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 'A classic spiral galaxy in the constellation Canes Venatici.', 5000, 100000, 8.00, true, 23000000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Elliptical', 'A bright galaxy with a large central bulge.', 7000, 80000, 9.00, true, 29000000);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel Galaxy', 'Lenticular', 'The Cartwheel Galaxy is a lenticular galaxy located about 500 million light-years away in the constellation Sculptor', 100, 10000, 10.00, true, 500000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (21, 'Io', 'A volcanic moon with a very active surface.', 1, 1.769);
INSERT INTO public.moon VALUES (22, 'Europa', 'An icy moon with a subsurface ocean.', 1, 3.551);
INSERT INTO public.moon VALUES (23, 'Ganymede', 'The largest moon in the Solar System.', 1, 7.154);
INSERT INTO public.moon VALUES (24, 'Callisto', 'A heavily cratered moon with a vast age.', 1, 16.689);
INSERT INTO public.moon VALUES (25, 'Luna', 'Earth’s only natural satellite.', 2, 27.321);
INSERT INTO public.moon VALUES (26, 'Phobos', 'One of the two small moons of Mars.', 3, 0.319);
INSERT INTO public.moon VALUES (27, 'Deimos', 'Mars’s second moon, smaller and less round.', 3, 1.263);
INSERT INTO public.moon VALUES (28, 'Titan', 'The largest moon of Saturn with a thick atmosphere.', 4, 15.945);
INSERT INTO public.moon VALUES (29, 'Rhea', 'One of Saturn’s mid-sized moons.', 4, 4.518);
INSERT INTO public.moon VALUES (30, 'Iapetus', 'A moon of Saturn with a distinctive color pattern.', 4, 79.330);
INSERT INTO public.moon VALUES (31, 'Enceladus', 'A small, icy moon with geysers and potential subsurface ocean.', 4, 1.370);
INSERT INTO public.moon VALUES (32, 'Miranda', 'A moon of Uranus with a highly varied surface.', 5, 1.414);
INSERT INTO public.moon VALUES (33, 'Titania', 'Uranus’s largest moon with a diverse landscape.', 5, 8.706);
INSERT INTO public.moon VALUES (34, 'Oberon', 'A large moon of Uranus, heavily cratered.', 5, 13.463);
INSERT INTO public.moon VALUES (35, 'Ariel', 'One of Uranus’s moons with a smooth surface.', 5, 2.520);
INSERT INTO public.moon VALUES (36, 'Triton', 'Neptune’s largest moon with retrograde orbit.', 6, 5.877);
INSERT INTO public.moon VALUES (37, 'Proteus', 'One of Neptune’s irregularly shaped moons.', 6, 1.120);
INSERT INTO public.moon VALUES (38, 'Charon', 'Pluto’s largest moon, close in size to Pluto.', 7, 6.387);
INSERT INTO public.moon VALUES (39, 'Nix', 'One of Pluto’s smaller moons, discovered in 2005.', 7, 0.296);
INSERT INTO public.moon VALUES (40, 'Hydra', 'Another small moon of Pluto, discovered in 2005.', 7, 0.400);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'The third planet from the Sun and the only known planet to support life.', 365, 1, 12742.00, false, 5);
INSERT INTO public.planet VALUES (2, 'Jupiter', 'The largest planet in the Solar System, known for its Great Red Spot.', 4333, 79, 139820.00, true, 5);
INSERT INTO public.planet VALUES (3, 'Mars', 'The fourth planet from the Sun, known for its reddish appearance.', 687, 2, 6779.00, false, 5);
INSERT INTO public.planet VALUES (4, 'Venus', 'The second planet from the Sun, known for its thick atmosphere and high surface temperatures.', 225, 0, 12104.00, false, 5);
INSERT INTO public.planet VALUES (5, 'Saturn', 'The sixth planet from the Sun, famous for its prominent ring system.', 10759, 83, 116460.00, true, 5);
INSERT INTO public.planet VALUES (6, 'Neptune', 'The eighth planet from the Sun, known for its deep blue color and strong winds.', 60182, 14, 49528.00, false, 5);
INSERT INTO public.planet VALUES (7, 'Proxima Centauri b', 'An exoplanet orbiting Proxima Centauri, the closest star to the Sun.', 11, 0, 1.12, false, 1);
INSERT INTO public.planet VALUES (8, 'TRAPPIST-1d', 'One of the seven Earth-sized exoplanets orbiting TRAPPIST-1.', 4, 0, 1.13, false, 2);
INSERT INTO public.planet VALUES (9, 'HD 189733b', 'A hot Jupiter-like exoplanet known for its extreme weather.', 2, 0, 1.14, true, 2);
INSERT INTO public.planet VALUES (10, 'Gliese 581g', 'An exoplanet in the Gliese 581 system, located in the constellation Libra.', 30, 0, 1.52, true, 1);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 'An exoplanet known for its transiting behavior, also known as Osiris.', 4, 0, 1.32, false, 2);
INSERT INTO public.planet VALUES (12, 'Kepler-22b', 'An exoplanet in the Kepler-22 system, located in the habitable zone of its star.', 290, 0, 2.42, false, 3);
INSERT INTO public.planet VALUES (13, 'Kepler-16b', 'A circumbinary planet orbiting two stars, known for its unusual orbit.', 228, 0, 0.74, false, 4);
INSERT INTO public.planet VALUES (14, 'HD 40307g', 'An exoplanet in the HD 40307 system, located in the habitable zone of its star.', 195, 0, 2.52, true, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Betelgeuse', 5, 'Red Supergiant', 20.00, 8000, 642, true, 'Betelgeuse is a red supergiant star in the Milky Way galaxy, approximately 642 light-years from Earth. It is one of the largest and most luminous stars visible to the naked eye.');
INSERT INTO public.star VALUES (2, 'Rigel', 5, 'Blue Supergiant', 21.00, 8000, 860, true, 'Rigel is a blue supergiant star in the Milky Way galaxy, about 860 light-years from Earth. It is one of the brightest stars in the night sky.');
INSERT INTO public.star VALUES (3, 'S Andromedae', 1, 'Supernova', 1.44, 0, 2500000, false, 'S Andromedae is a supernova that occurred in the Andromeda galaxy. It is located about 2.5 million light-years from Earth.');
INSERT INTO public.star VALUES (4, 'TRAPPIST-1', 2, 'Red Dwarf', 0.08, 7600, 39, true, 'TRAPPIST-1 is an ultra-cool red dwarf star in the Triangulum galaxy, approximately 39 light-years from Earth. It has seven Earth-sized planets orbiting it.');
INSERT INTO public.star VALUES (5, 'M104-1', 4, 'Yellow Dwarf', 1.00, 4600, 31000000, false, 'M104-1 is a yellow dwarf star in the Sombrero galaxy, located about 31 million light-years from Earth. It is similar to our Sun in terms of mass and size.');
INSERT INTO public.star VALUES (6, 'SN 2006gy', 6, 'Supernova', 1.44, 0, 238000000, false, 'SN 2006gy is a supernova in the Cartwheel galaxy. It is one of the most luminous stellar explosions ever recorded, located about 238 million light-years from Earth.');


--
-- Data for Name: supermassive_black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.supermassive_black_hole VALUES (4, 'Sagittarius A*', 'Supermassive black hole at the center of the Milky Way galaxy.', 4.10, 26000.00, 'Milky Way');
INSERT INTO public.supermassive_black_hole VALUES (5, 'M31*', 'The supermassive black hole at the center of the Andromeda galaxy.', 1.00, 2537000.00, 'Andromeda');
INSERT INTO public.supermassive_black_hole VALUES (6, 'M100 Black Hole', 'A supermassive black hole located at the center of the Whirlpool Galaxy.', 2.80, 56000000.00, 'Whirlpool');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_mood_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_mood_id_seq', 40, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: supermassive_black_hole_sbh_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.supermassive_black_hole_sbh_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pk; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pk PRIMARY KEY (galaxy_id);


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
-- Name: planet planet_pk; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pk PRIMARY KEY (planet_id);


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
-- Name: supermassive_black_hole supermassive_black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.supermassive_black_hole
    ADD CONSTRAINT supermassive_black_hole_name_key UNIQUE (name);


--
-- Name: supermassive_black_hole supermassive_black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.supermassive_black_hole
    ADD CONSTRAINT supermassive_black_hole_pkey PRIMARY KEY (supermassive_black_hole_id);


--
-- Name: moon moon_planet_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_fk FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_fk FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

