// TODO: drop this
// FIXME: wrong
// HACK: shortcut
// XXX: odd
export function notes(): string {
  // eslint-disable-next-line @typescript-eslint/no-inferrable-types
  const text: string = "notes";
  return text;
}

export function blanket(): string {
  // eslint-disable-next-line
  return "blanket";
}

export function expected(): number {
  // @ts-expect-error
  return "1";
}
