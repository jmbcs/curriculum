#import "../template.typ": cv-section, cv-event, cv-divider

#let experience = [
  #cv-section("Work Experience")

  #cv-event(
    "Backend Engineer",
    "GuestReady / RentalReady",
    "Oct 2024 – Present",
    "Remote",
  )
  - Built and maintained live channel integrations with *Booking.com*, *Airbnb*, and *Vrbo* — real-time sync of availability, rates, and reservations for thousands of short-term rental properties.
  - Designed and maintained clean *REST API* contracts between internal services and external OTA channels.
  - Delivered promotions features enabling dynamic discount campaigns across OTA channels.
  - Built a *Redis* hash-based deduplication layer that prevents reprocessing of stale events in the channel pipeline.
  - Built asynchronous and scheduled processing with *RabbitMQ* and *Celery* — including recurring jobs such as activating promotions when a property goes live.
  - Ran zero-downtime bulk operations on large *PostgreSQL* tables in production.
  - Profiled and optimized database queries to keep the channel pipeline performant under load.
  - Implemented *New Relic* monitoring alarms for proactive observability; triaged production incidents with *Sentry* and *Datadog*.
  - Worked across a large *Django* PMS codebase, investigating and resolving production bugs reported by users and support.
  - Maintained engineering quality through *code review* on a distributed 40+ engineer team; used AI tooling (*Claude Code*, *Cursor*) to ship faster.
  - Mentored junior developers, sharing backend best practices through code review and pairing.
  - Delivered frontend work alongside backend, including a full revamp of the Amenities page.

  #v(0.34em)
  #cv-divider
  #v(0.34em)

  #cv-event(
    "Software Engineer",
    "Wavecom",
    "Jan 2021 – Oct 2024",
    "Aveiro, Portugal (Hybrid)",
  )
  - Built microservices in *Python* and *Go*, using *gRPC* and *Protocol Buffers* for typed inter-service communication.
  - Designed *REST APIs* over SQL and NoSQL stores; containerized services with *Docker* and *Docker Compose*.
  - Architected a real-time monitoring platform for *HPC* clusters with *Grafana* and *VictoriaMetrics*; built *ETL pipelines* using *Telegraf* and *Pandas*.
  - Automated build and deployment workflows with *Makefiles* and *Bash*; evaluated technologies through PoCs.
]
