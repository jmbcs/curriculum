#import "../template.typ": cv-section, skill-cat

// Core-stack items are marked with `true` so they render as highlighted chips.
#let skills = [
  #cv-section("Tech Skills")

  #skill-cat("Programming", (("Python", true), "Go", ("SQL", true)))
  #skill-cat("Frameworks", (("Django", true), ("FastAPI", true), "SQLAlchemy", "Pandas"))
  #skill-cat("APIs & Messaging", ("REST", "gRPC", "RabbitMQ", "Protocol Buffers"))
  #skill-cat("Databases", (("PostgreSQL", true), ("Redis", true), "VictoriaMetrics"))
  #skill-cat("Infrastructure", (("Docker", true), ("Linux", true), "AWS"))
  #skill-cat("Observability", ("Grafana", ("Sentry", true), "Datadog", ("New Relic", true), "Telegraf"))
  #skill-cat("Tooling", (("Git", true), "Bash", "Make", "YAML"))
  #skill-cat("AI Tooling", (("Claude Code", true), "Cursor"))
]
