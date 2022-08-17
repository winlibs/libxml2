# libxml2

libxml2 is the XML C parser and toolkit developed for the Gnome project from
[http://www.xmlsoft.org/](http://www.xmlsoft.org/)

PHP 5.3/5.4 currently use version 2.7.8 released 2010.11.04
PHP 5.5 currently uses version 2.9.1 released 2013.04.19

# Building for PHP with VC9/VC11

Configure line non debug:

    cscript configure.js lib="<path to iconv lib dir>" include="<path to iconv header dir>" vcmanifest=yes

Configure line with debug:

    cscript configure.js lib="<path to iconv lib dir>" include="<path to iconv header dir>"  debug=yes mem_debug=yes  vcmanifest=yes

libxml2_a_dll.lib **MUST** be used with PHP.
