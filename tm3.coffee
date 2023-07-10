deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

module.exports =
	version: 1
	slug: 'tm3'
	aliases: [ 'tm3' ]
	name: 'tm3'
	arch: 'aarch64'
	state: 'released'

	instructions: commonImg.instructions

	options: [ networkOptions.group ]

	yocto:
		machine: 'tm3'
		image: 'balena-image'
		fstype: 'balenaos-img'
		version: 'yocto-kirkstone'
		deployArtifact: 'balena-image-tm3.balenaos-img'
		compressed: true

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	initialization: commonImg.initialization

