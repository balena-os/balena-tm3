deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

module.exports =
	version: 1
	slug: 'bluechiptechnology-tm3'
	aliases: [ 'bluechiptechnologytm3' ]
	name: 'Blue Chip Technology TM3'
	arch: 'aarch64'
	state: 'released'

	instructions: commonImg.instructions

	options: [ networkOptions.group ]

	yocto:
		machine: 'tm3'
		image: 'balena-image-flasher'
		fstype: 'balenaos-img'
		version: 'yocto-kirkstone'
		deployArtifact: 'balena-image-flasher-tm3.balenaos-img'
		compressed: true

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	initialization: commonImg.initialization

