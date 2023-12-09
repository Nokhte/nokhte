export function isNotEmptyOrNull(arr: Array<any> | null): boolean {
  return arr === null ? false : arr.length !== 0;
}
