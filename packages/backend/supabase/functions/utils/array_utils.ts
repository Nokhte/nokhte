// deno-lint-ignore-file no-explicit-any
export function isNotEmptyOrNull(arr: Array<any> | null): boolean {
  return arr === null ? false : arr.length !== 0;
}

export function isEmptyOrNull(array: Array<any> | null): boolean {
  return array === null || array.length === 0;
}
