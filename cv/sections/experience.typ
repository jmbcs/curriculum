#import "../template.typ": cv-section, cv-event, cv-divider

#let experience = [
  #cv-section("Work Experience")

  #cv-event(
    "Backend Engineer",
    "GuestReady / RentalReady",
    "Oct 2024 – Present",
    "Remote",
  )
  - Built and maintained live channel integrations with *Booking.com*, *Airbnb*, and *Vrbo* — real-time sync of availability, rates, and reservations across thousands of short-term rental properties.
  - Delivered promotions features enabling dynamic discount campaigns across OTA channels.
  - Built a *Redis* hash-based deduplication layer that prevents reprocessing of stale events in the channel pipeline.
  - Ran zero-downtime bulk operations on large *PostgreSQL* tables; triaged production incidents with *Sentry*, *Datadog*, and *New Relic* alarms.
  - Maintained engineering quality through code review on a 40+ engineer team; used AI tooling (*Claude Code*, *Cursor*) to ship faster.

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
  - Architected a real-time monitoring platform for *HPC* clusters using *Grafana* and *VictoriaMetrics*.
  - Built *ETL pipelines* with *Telegraf* and *Pandas* to process infrastructure telemetry at scale.
  - Automated build and deployment workflows with *Makefiles* and *Bash*; evaluated technologies through PoCs.
]
