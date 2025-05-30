import SwiftUI

struct TagsView: View {
    var allTags: [String]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Your Tags")
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)

            List {
                ForEach(allTags, id: \.self) { tag in
                    HStack {
                        Text(tag)
                            .font(.body)
                        Spacer()
                        Image(systemName: "tag.fill")
                            .foregroundColor(.accentColor)
                    }
                    .padding(.vertical, 4)
                }
            }
        }
        .padding(.top)
    }
}
