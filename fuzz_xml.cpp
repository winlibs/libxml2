#include <libxml/parser.h>
#include <libxml/tree.h>
#include <stdint.h>
#include <stddef.h>

extern "C" int LLVMFuzzerTestOneInput(const uint8_t *data, size_t size) {
    if (size < 1) return 0;

    xmlDocPtr doc = xmlReadMemory((const char *)data, (int)size,
                                  "noname.xml", NULL, 0);
    if (doc) {
        xmlFreeDoc(doc);
    }
    return 0;
}
