TEMPLATE = subdirs

SUBDIRS += \
    app \
    backend \
    frontend \
    WifiManager

app.depends = backend frontend
