# libxml2

libxml2 is the XML C parser and toolkit developed for the Gnome project from
[http://www.xmlsoft.org/](http://www.xmlsoft.org/)

# Building for PHP with VC9/VC11

Configure line non debug:

    cscript configure.js lib="<path to iconv lib dir>" include="<path to iconv header dir>" vcmanifest=yes

Configure line with debug:

    cscript configure.js lib="<path to iconv lib dir>" include="<path to iconv header dir>"  debug=yes mem_debug=yes  vcmanifest=yes

libxml2_a_dll.lib **MUST** be used with PHP.
