#ifndef __CD_ISO__
#define __CD_ISO__

int get_iso_toggle();
int toggle_use_iso(int toggle);

int read_file(const char *filename, void *out);
int get_file_offset(const char *filename, int *offset, int *size);

#endif
