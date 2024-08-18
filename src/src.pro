TEMPLATE = subdirs

SUBDIRS += \
    app \
    backend \
    frontend \
    NetworkManager

app.depends = backend frontend
