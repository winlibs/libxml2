#ifndef XML_MEMORY_H_PRIVATE__
#define XML_MEMORY_H_PRIVATE__

#define XML_MAX_ITEMS 1000000000 /* 1 billion */

XML_HIDDEN void
xmlInitMemoryInternal(void);
XML_HIDDEN void
xmlCleanupMemoryInternal(void);

#endif /* XML_MEMORY_H_PRIVATE__ */
