protocol ImageReader {
    func getDecodeImage() -> DecodedImage
}

class DecodedImage {
    private var image: String

    init(image: String) {
        self.image = image
    }

    var description: String {
        "\(image): is decoded"
    }
}

class GifReader: ImageReader {
    private var decodedImage: DecodedImage

    init(image: String) {
        self.decodedImage = DecodedImage(image: image)
    }

    func getDecodeImage() -> DecodedImage {
        decodedImage
    }
}

class JpegReader: ImageReader {
    private var decodedImage: DecodedImage

    init(image: String) {
        decodedImage = DecodedImage(image: image)
    }

    func getDecodeImage() -> DecodedImage {
        decodedImage
    }
}

func runFactoryExample() {
    let reader: ImageReader
    let format = "gif"
    let image = "example image"

    switch format {
    case "gif":
        reader = GifReader(image: image)
    default:
        reader = JpegReader(image: image)
    }
    
    let decodedImage = reader.getDecodeImage()
    print(decodedImage.description)
}