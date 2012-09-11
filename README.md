# libxml2

libxml2 is the XML C parser and toolkit developed for the Gnome project from
[http://www.xmlsoft.org/](http://www.xmlsoft.org/)

PHP currently uses version 2.7.8 released 2010.11.04

# Building for PHP

Configure line VC9 non debug:

    cscript configure.js lib="<path to iconv lib dir>" include="<path to iconv header dir>" vcmanifest=yes

Configure line VC9 debug:

    cscript configure.js lib="<path to iconv lib dir>" include="<path to iconv header dir>"  debug=yes mem_debug=yes  vcmanifest=yes

libxml2_a_dll.lib **MUST** be used with PHP.