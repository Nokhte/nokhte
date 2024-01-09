export function isNotEmptyOrNull(arr: Array<any> | null): boolean {
  return arr === null ? false : arr.length !== 0;
}

export function isEmptyOrNull(arr: Array<any> | null): boolean {
  return arr === null ? true : arr.length === 0;
}
