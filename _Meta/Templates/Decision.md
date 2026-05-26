---
id: decision-<% tp.date.now("YYYYMMDD") %>-<% tp.file.title.toLowerCase().replace(/[^a-z0-9]+/g, "-") %>
type: decision
date: <% tp.date.now("YYYY-MM-DD") %>
title: "<% tp.file.title %>"
status: open
confidence: 3
revisit:
chose: ""
alternatives: []
tags: []
---

# <% tp.file.title %>

## What I'm deciding

## What I chose

## Why

## Alternatives considered

## What I'm uncertain about

## How I'll know later if I was right

## Review

<!-- Filled in at `revisit` date. What actually happened. Would I make the same call. -->
