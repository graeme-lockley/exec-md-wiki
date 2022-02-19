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

Before looking at the container view of `exec-md-wiki` it is worthwhile covering some of the high-level design decisions:

- The user's view is through a browser
- The heart of the system is event based
- Read and write projections are built on demand

![context image](http://www.plantuml.com/plantuml/proxy?cache=no&src=https://raw.githubusercontent.com/graeme-lockley/exec-md-wiki/main/docs/diagrams/system-exec-md-wiki.puml "System exec-md-wiki")

For all practical purposes, the diagram is showing a basic CQRS application where:

- Users interact through a browser using a web based application.
- The web based application interacts with an API gateway which routes each request to a number of separate handlers.
- Each handler is characterised as a command handler or a query handler.
- A command handler is used to perform changes to the wiki manifesting this change as an event published to the event store.  A command handler has access to the event stream thereby keeping their internal state accurate.  This internal state is called a write model.
- A query handler is responsible for provide requestors with views of the event stream.  Each query handler has access to the event stream thereby keeping their internal state accurate.  This internal state is called a read model.

Other than communicating that this system is built using CQRS and providing labels onto which to attach more detail, this model isn't particularly useful.  To make is useful we need to:

- Attach message formats and protocols to each of the interaction lines,
- See how this model manifests in actual deployable Azure components, and 
- Break this into code where the model acts as a map into the code base