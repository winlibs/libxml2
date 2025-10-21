#include <libxml/parser.h>
#include <libxml/SAX.h>
#include <libxml/xinclude.h>

// A simple SAX handler that does nothing but allows parsing to proceed
static xmlSAXHandler sax_handler;

extern "C" int LLVMFuzzerTestOneInput(const uint8_t *data, size_t size) {
    if (size == 0) return 0;
    
    // Reset the library's internal state to avoid state-dependent crashes and leaks.
    xmlCleanupParser();
    xmlInitParser();

    // The fuzzer input is treated as an in-memory XML document.
    xmlParserCtxtPtr ctxt = xmlCreateMemoryParserCtxt((const char*)data, size);

    if (ctxt) {
        ctxt->sax = &sax_handler;
        xmlParseDocument(ctxt);
        xmlFreeParserCtxt(ctxt);
    }

    return 0;
}
