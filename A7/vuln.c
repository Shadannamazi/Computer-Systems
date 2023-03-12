#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

struct str {
    int size;
    char* _str;
};

struct str str1 = {30, "Welcome! Please enter a name: "};
struct str str2 = {11, "Good luck, "};

void print(struct str* struct1){
    write(1, struct1->_str, struct1->size);
}

int main(){
    char buf[256];
    print(&str1);
    int size = read(0,buf, sizeof(buf));
    struct str string_read = {size, buf};
    print(&str2);
    print(&string_read);
}

