
const url = "https://domain.com/api/documents/app-modules-configuration/content"

const regexp =
  /documents\/(?<file_name>.+)\/content/gm;

console.log(url.matchAll(regexp).next || "")

for (const match of url.matchAll(regexp)) {
  console.log(`${match.groups.file_name}`);
}