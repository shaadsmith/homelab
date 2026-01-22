# Ollama + Open WebUI

## 1. Purpose

## Purpose

A fully local chatbot environment for experimentation with large language models without relying on external APIs or cloud services. Enables private, low-latency interaction with models hosted entirely on internal hardware. 

---

## 2. High-Level Design

The chatbot stack is composed of a local inference engine and a web-based frontend:

| Component     | Platform        | Purpose                          |
|--------------|----------------|----------------------------------|
| Ollama       | macOS (M1 Mini) | Local LLM runtime and model host |
| Open Web UI  | Docker Desktop  | Web-based interface for prompts  |

---

## 3. Implementation

- **Host**: Apple M1 Mac Mini  
- **Ollama**:
  - Installed directly on macOS
  - Hosts lightweight models such as llama3.1, Mistral 7B, and Gemma
- **Open Web UI**:
  - Deployed using Docker Desktop
  - Connects to Ollama as the backend model provider
  - Serves a web interface accessible from LAN devices

## 4. Future Growth / Current Limitations
- Test additional lightweight models for performance comparison 
- Introduce reverse proxy integration for cleaner internal access (via Caddy)
- Performance constrained by M1 hardware and model size
- Intended for experimentation, not production workloads

