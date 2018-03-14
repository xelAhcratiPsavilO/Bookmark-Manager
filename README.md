# Bookmark-Manager

## User Stories
```
As a user,
So that I can access different websites,
I want to see a list of links

As a time-pressed user
So that I can save a website
I would like to add the site's address and title to bookmark manager

As a user
So I can store bookmark data for later retrieval
I want to add a link to Bookmark Manager
```

## Domain Model

|Objects | Messages |
|--------|----------|
|user||
|links|list_links|

```
User <--- list_links ---> links
```

## Domain Model

|Objects | Messages |
|--------|----------|
|BookmarkManager|add_site_address|
||add_site_title|

```
BookmarkManager ---> add_site_address
BookmarkManager ---> add_site_title
```
