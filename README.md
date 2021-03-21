# Docker Self-Sign Cert Generator

## Usage
`./make-cert.sh dev-domain.local`
- will export to '~/certs/*domainname*/'

### client side
- CA cert '~/certs/' must be imported on client machine under trusted Certificate authorities

### server side
- CA cert '~/certs/' must be added to your server config as CA or Root
- Server cert '~/certs/*domainname*/' must be added to your server config as vdom cert / virtual host cert / listener cert