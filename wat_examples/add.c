/* This file once compile simply return 5 because the wasm compiler
   does the addition at compile time :-(
   The corresponding what file was written by hand
*/
#define WASM_EXPORT __attribute__((visibility("default")))

WASM_EXPORT
int main() {
  int a = 3;
  int b = 2;
  return a+b;
}
