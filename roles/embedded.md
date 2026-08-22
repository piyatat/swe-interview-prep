# Embedded / firmware engineer

Focus: **constraint reasoning** (power, stack, interrupt latency) more than reciting I2C timings. Confirm track: **bare-metal / RTOS** vs **embedded Linux** (device tree, Yocto, drivers) — question mix changes.

## What interviewers probe

| Area | Signals |
| --- | --- |
| Embedded C | `volatile`, alignment, stack vs heap, no-malloc pools |
| RTOS | Priority inversion, mutex vs semaphore, ISR rules |
| Hardware | GPIO/clocks, watchdog, SPI vs I2C tradeoffs |
| Debugging | HardFault, race with ISR, logic analyzer / JTAG story |
| Domain | Automotive (MISRA, ISO 26262) vs IoT (BLE, battery) vs medical (IEC 62304) |

## Sample questions

### C & memory

1. Stack vs heap on a microcontroller — why avoid `malloc` in safety-critical code?
2. What does `volatile` do? Show a silent bug when it is omitted (ISR flag cached in a register).
3. Alignment: what happens if you cast a packed serial buffer to `uint32_t*` on Cortex-M?
4. Implement a **circular buffer** in C — distinguish full vs empty when `head == tail`.
5. `#define` vs `const` for register addresses and lookup tables.

### RTOS & concurrency

1. Priority inversion — Pathfinder-style story; priority inheritance; mutex vs binary semaphore.
2. Rules for a good ISR (short, no block/malloc/`printf`, `volatile` shared state, clear the flag).
3. ISR vs main-loop race: disable briefly, atomics (`LDREX`/`STREX`), or a lock-free queue.

### Hardware & peripherals

1. Configure a GPIO pin at register level (clock, direction, pulls) — not only the HAL name.
2. Watchdog vs **windowed** watchdog (kick too early also resets).
3. SPI vs I2C — throughput vs pins; pick from a real sensor, not a slogan.

### System / product

1. Design a sensor + CLI + logger on FreeRTOS/Zephyr under a RAM budget.
2. Bring-up story: first boot, clock tree, what you measured.

## Strong answer shape (circular buffer)

1. Clarify: overwrite vs drop-on-full; ISR producer / task consumer?
2. Structure: buffer, head, tail, **explicit full flag** (or count) so empty ≠ full.
3. Modulo wrap; mention power-of-two mask if they care about `%` cost.
4. Concurrency: critical section or SPSC queue — do not hand-wave.

## Strong answer shape (volatile)

> Compiler cannot see the ISR. Without `volatile`, the main loop may read a register-cached copy of a flag the ISR wrote. Same for MMIO registers.

## Level expectations

| Level | Depth |
| --- | --- |
| Junior | Pointers, bit ops, simple ISR, UART/SPI basics |
| Mid | RTOS sync, ring buffer, peripheral bring-up, race stories |
| Senior | Scheduler/latency budgets, functional safety, SoC bring-up |

## Also study

- [../general/cs-fundamentals.md](../general/cs-fundamentals.md) — concurrency, memory model
- [../general/coding-patterns.md](../general/coding-patterns.md) — some loops still ask C coding

## Sources

- [Embedded Systems Interview Questions 2026 — LastRound AI](https://lastroundai.com/blog/embedded-systems-interview-questions) — accessed 2026-08-22
- [Top 40 Embedded Systems Interview Questions (2026) — EmbeddedShiksha](https://www.embeddedshiksha.com/blog/top-40-embedded-systems-interview-questions-answers-2026) — accessed 2026-08-22
- [Embedded Systems Interview Prep — Wasil Zafar](https://www.wasilzafar.com/pages/2026/04/embedded-systems-interview-prep.html) — accessed 2026-08-22
- [Embedded software engineer interview questions — Final Round AI](https://www.finalroundai.com/blog/embedded-software-engineer-interview-questions) — accessed 2026-08-22
