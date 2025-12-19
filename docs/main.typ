= Implementation Documentation: NestJS vs. Pure Node.js

== 1. Steps Taken to Implement in NestJS

1. Initialize project scaffold
	- Created a new NestJS project with the Nest CLI and TypeScript preconfigured.
	- Installed core dependencies (`@nestjs/common`, `@nestjs/core`, `@nestjs/platform-express`) and test tooling (Jest, Supertest).

2. Wire up the application module
	- Declared `AppModule` as the root composition point for controllers and providers.
	- Registered the controller and service in the module for DI wiring.

3. Implement controller and service
	- `AppService` exposes a simple method returning a string response.
	- `AppController` defines a `GET /` route that delegates to the service.

4. Bootstrap the HTTP server
	- In `main.ts`, created the Nest application via `NestFactory.create(AppModule)` and started the server on `PORT` (default 3000).

5. Add an end-to-end test
	- Wrote an E2E test with Jest + Supertest to hit `GET /` and assert the `200` status and payload.
	- Used the Nest testing module to spin up an isolated instance of the app.

6. Developer experience setup
	- Added scripts for `start`, `start:dev`, `build`, `test`, `test:e2e`, `lint`, and `format` for a smooth workflow.
	- Left room to add `ValidationPipe` and DTOs when input contracts are introduced (dependencies for `class-validator` and `class-transformer` are ready).

== 2. Comparison with Pure Node.js (Express-style)

- Architecture & Structure: NestJS enforces a modular, layered structure (modules, controllers, providers) vs. ad‑hoc file layouts in pure Node.js.
- Dependency Injection: Built‑in DI in NestJS promotes testability and decoupling; in pure Node.js/Express you typically hand‑roll or skip DI.
- TypeScript First: Strong types, decorators, and metadata are standard in NestJS; pure Node.js needs manual setup and patterns.
- Testing: Nest’s testing utilities and patterns make unit/E2E tests straightforward; with pure Node.js you assemble Jest + Supertest wiring yourself.
- Conventions & Ergonomics: Nest offers CLIs, schematics, pipes, guards, interceptors, and filters; pure Node.js gives maximum freedom but fewer rails.
- Learning Curve & Overhead: Nest has higher initial complexity and more abstractions; pure Node.js is lighter and quicker to start for tiny apps.

== 3. Better or Worse?

- Small scripts/services: Pure Node.js is better for minimal, one‑off endpoints or prototypes due to near‑zero overhead.
- Growing/long‑lived services: NestJS is better as complexity increases, thanks to structure, DI, typing, and testability.
- Team environments: NestJS is better because shared conventions reduce bikeshedding and onboarding time.
- Performance baseline: Comparable for typical I/O; for micro‑optimizations pure Node.js can shave overhead at the cost of ergonomics.

== 4. Why?

- Maintainability: Nest’s conventions (modules/controllers/providers) and DI make boundaries explicit, easing refactors and scaling.
- Reliability: First‑class testing patterns, plus pipes/guards/interceptors, lead to safer, more predictable APIs.
- Developer Velocity: CLI scaffolding, decorators, and TypeScript integration accelerate common tasks and reduce boilerplate drift.
- Extensibility: Built‑ins for validation, serialization, and exception handling reduce bespoke code and align cross‑cutting concerns.
- Simplicity Trade‑off: The same abstractions that help at scale add overhead for very small services—pure Node.js stays simpler there.

== Appendix: Project Artifacts Mapped

- Root module: `src/app.module.ts` — registers controller and service.
- Controller: `src/app.controller.ts` — exposes `GET /`.
- Service: `src/app.service.ts` — returns the response payload.
- Bootstrap: `src/main.ts` — creates and starts the Nest app.
- E2E test: `test/app.e2e-spec.ts` — verifies the root route.


