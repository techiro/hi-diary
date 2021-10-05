import Danger

let danger = Danger()
let allSourceFiles = danger.git.modifiedFiles + danger.git.createdFiles

if allSourceFiles.first(where: { $0.fileType == .swift }) != nil {
    let violation = SwiftLint.lint()
    if violation.isEmpty {
        message("No violation found!!!")
    }
} else {
    message("No .swift file was added")
}
