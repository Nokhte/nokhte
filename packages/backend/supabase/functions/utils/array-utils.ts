export function isNotEmptyOrNull<T>(arr: Array<T> | null): boolean {
  return arr === null ? false : arr.length !== 0;
}

export function isEmptyOrNull<T>(arr: Array<T> | null): boolean {
  return arr === null ? true : arr.length === 0;
}

export function onlyUnique<T>(value: T, index: number, array: Array<T>) {
  return array.indexOf(value) === index;
}
