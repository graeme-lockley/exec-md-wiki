# exec-md-wiki

A wiki using [exec-md](https://github.com/graeme-lockley/exec-md) as the runtime system.

# Features

This implementation will have the following features:

- The runtime system will be [exec-md](https://github.com/graeme-lockley/exec-md)
- The wiki will support [Confluence](https://en.wikipedia.org/wiki/Confluence_(software)) styles sites
- The wiki will support concurrent page editing
- The wiki will be deployable into Azure using Azure's PaaS services

# Context

![context image](http://www.plantuml.com/plantuml/proxy?cache=no&src=https://raw.githubusercontent.com/graeme-lockley/exec-md-wiki/main/docs/diagrams/context.puml "Content")

Highlights from the context diagram:

- The wiki will be tenant based meaning that it is possible to host multiple, disconnected organisations
- There are different levels of access within a tenant
- A reader within a tenant will be able to create sites and notebooks

# `exec-md-wiki`

Before looking at the container view of `exec-md-wiki` it is worthwhile covering some of the design considerations of this system:

- The user's view is view browser
- The heart of the system is event based
- Read and write projections are built on demand

![context image](http://www.plantuml.com/plantuml/proxy?cache=no&src=https://raw.githubusercontent.com/graeme-lockley/exec-md-wiki/main/docs/diagrams/system-exec-md-wiki.png "System exec-md-wiki")

