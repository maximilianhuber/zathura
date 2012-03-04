# See LICENSE file for license and copyright information
# zathura make config

ZATHURA_VERSION_MAJOR = 0
ZATHURA_VERSION_MINOR = 1
ZATHURA_VERSION_REV = 0
ZATHURA_API_VERSION = 1
VERSION = ${ZATHURA_VERSION_MAJOR}.${ZATHURA_VERSION_MINOR}.${ZATHURA_VERSION_REV}

# the GTK version to use
ZATHURA_GTK_VERSION ?= 2

# paths
PREFIX ?= /usr
MANPREFIX ?= ${PREFIX}/share/man
DESKTOPPREFIX ?= ${PREFIX}/share/applications
# plugin directory
PLUGINDIR ?= ${PREFIX}/lib/zathura
# locale directory
LOCALEDIR ?= ${PREFIX}/share/locale

# libs
GTK_INC ?= $(shell pkg-config --cflags gtk+-${ZATHURA_GTK_VERSION}.0)
GTK_LIB ?= $(shell pkg-config --libs gtk+-${ZATHURA_GTK_VERSION}.0 gthread-2.0)

GIRARA_INC ?= $(shell pkg-config --cflags girara-gtk${ZATHURA_GTK_VERSION})
GIRARA_LIB ?= $(shell pkg-config --libs girara-gtk${ZATHURA_GTK_VERSION})

SQLITE_INC ?= $(shell pkg-config --cflags sqlite3)
SQLITE_LIB ?= $(shell pkg-config --libs sqlite3)

#set it to an empty value if you don't need to link against ld for dlopen and friends
DL_LIB ?= -ldl

INCS = ${GIRARA_INC} ${GTK_INC}
LIBS = ${GIRARA_LIB} ${GTK_LIB} ${DL_LIB} -lpthread -lm

# flags
CFLAGS += -std=c99 -pedantic -Wall -Wno-format-zero-length -Wextra $(INCS)
CPPFLAGS += -DZATHURA_PLUGINDIR=\"${PLUGINDIR}\" -DGETTEXT_PACKAGE=\"${PROJECT}\" -DLOCALEDIR=\"${LOCALEDIR}\"

# debug
DFLAGS ?= -g

# ld
LDFLAGS += -rdynamic

# compiler
CC ?= gcc

# strip
SFLAGS ?= -s

# set to something != 0 if you want verbose build output
VERBOSE ?= 0

# database
# possible values are sqlite and plain
DATABASE ?= plain
