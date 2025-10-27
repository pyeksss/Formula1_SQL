-- public.circuits определение

-- Drop table

-- DROP TABLE public.circuits;

CREATE TABLE public.circuits (
	"circuitId" int4 NOT NULL,
	"circuitRef" varchar(50) NULL,
	"name" varchar(50) NULL,
	"location" varchar(50) NULL,
	country varchar(50) NULL,
	lat float4 NULL,
	lng float4 NULL,
	CONSTRAINT circuits_pk PRIMARY KEY ("circuitId")
);


-- public.constructors определение

-- Drop table

-- DROP TABLE public.constructors;

CREATE TABLE public.constructors (
	"constructorId" int4 NOT NULL,
	"constructorRef" varchar(50) NULL,
	"name" varchar(50) NULL,
	nationality varchar(50) NULL,
	url varchar(128) NULL,
	CONSTRAINT constructors_pk PRIMARY KEY ("constructorId")
);


-- public.drivers определение

-- Drop table

-- DROP TABLE public.drivers;

CREATE TABLE public.drivers (
	"driverId" int4 NOT NULL,
	"driverRef" varchar(50) NULL,
	"number" int4 NULL,
	code varchar(50) NULL,
	forename varchar(50) NULL,
	surname varchar(50) NULL,
	nationality varchar(50) NULL,
	url varchar(64) NULL,
	dob_date date NULL,
	CONSTRAINT drivers_pk PRIMARY KEY ("driverId")
);


-- public.pitstops определение

-- Drop table

-- DROP TABLE public.pitstops;

CREATE TABLE public.pitstops (
	"raceId" int4 NOT NULL,
	"driverId" int4 NOT NULL,
	stop int4 NOT NULL,
	lap int4 NULL,
	"time" varchar(50) NULL,
	duration float4 NULL,
	milliseconds int4 NULL,
	CONSTRAINT pitstops_pk PRIMARY KEY ("raceId", "driverId", stop)
);


-- public.race определение

-- Drop table

-- DROP TABLE public.race;

CREATE TABLE public.race (
	"raceId" int4 NOT NULL,
	"year" int4 NULL,
	round int4 NULL,
	"circuitId" int4 NULL,
	"name" varchar(50) NULL,
	CONSTRAINT race_pk PRIMARY KEY ("raceId")
);


-- public.results определение

-- Drop table

-- DROP TABLE public.results;

CREATE TABLE public.results (
	"resultId" int4 NULL,
	"raceId" int4 NULL,
	"driverId" int4 NULL,
	"constructorId" int4 NULL,
	"number" int4 NULL,
	grid int4 NULL,
	"position" int4 NULL,
	"positionText" varchar(50) NULL,
	"positionOrder" int4 NULL,
	points int4 NULL,
	laps int4 NULL,
	"time" varchar(50) NULL,
	milliseconds int4 NULL,
	"fastestLap" int4 NULL,
	"rank" int4 NULL,
	"fastestLapTime" varchar(50) NULL,
	"fastestLapSpeed" float4 NULL,
	"statusId" int4 NULL,
	CONSTRAINT results_pk null
);
