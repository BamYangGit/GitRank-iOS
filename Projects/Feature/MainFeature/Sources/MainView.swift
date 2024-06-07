import DesignSystem
import SwiftUI
import BaseFeature

struct MainView: View {
    @StateObject var viewModel: MainViewModel

    init(
        viewModel: MainViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            GitRankImage(.navigationLogo)
                .frame(width: 48, height: 23)
                .padding(.horizontal, 20)
                .padding(.vertical, 8)

            Text("HongSJae")
                .gitRankFont(.pageTitle, color: .GrayScale.gray700)
                .padding(.horizontal, 24)
                .padding(.vertical, 8)

            HStack(alignment: .top, spacing: 16) {
                Circle()
                    .fill(.gray)
                    .frame(width: 80, height: 80)

                VStack(alignment: .leading, spacing: 8) {
                    Text("gtw030488@gmail.com")
                        .gitRankFont(.description, color: .GrayScale.gray700)

                    VStack(alignment: .leading, spacing: 0) {
                        Text("팔로잉 0")
                            .gitRankFont(.caption, color: .GrayScale.gray700)

                        Text("팔로워 0")
                            .gitRankFont(.caption, color: .GrayScale.gray700)
                    }
                }
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 16)

            HStack(spacing: 10) {
                commitBox("Today Commit", count: 13)

                commitBox("Last Commit", count: 13)
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 21)

            commitGoalBox(currentCommit: 4, commitGoal: 10)
                .padding(.vertical, 8)
                .padding(.horizontal, 21)

            Spacer()
        }
        .navigationBarHidden(true)
    }

    @ViewBuilder
    func commitBox(_ title: String, count: Int) -> some View {
        VStack(spacing: 20) {
            Text(title)
                .gitRankFont(.body, color: .GrayScale.gray700)
                .padding(.top, 10)
                .padding(.leading, 12)
                .frame(maxWidth: .infinity, alignment: .leading)

            Text("\(count)")
                .gitRankFont(.pageTitle, color: .GrayScale.gray500)
                .padding(.bottom, 10)
                .padding(.trailing, 12)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .background(.white)
        .withBorder(cornerRadius: 8, borderColor: .GrayScale.gray400)
    }

    @ViewBuilder
    func commitGoalBox(currentCommit: Int, commitGoal: Int) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text("Commit Goal")
                    .gitRankFont(.body, color: .GrayScale.gray700)

                Spacer()

                Text("\(currentCommit)/\(commitGoal)")
                    .gitRankFont(.body, color: .GrayScale.gray700)
            }
            .padding(.top, 10)
            .padding(.horizontal, 12)

            GeometryReader { proxy in
                Rectangle()
                    .fill(Color.GrayScale.gray500)
                    .frame(maxWidth: (proxy.size.width - 20) * CGFloat(currentCommit) / CGFloat(commitGoal))
                    .cornerRadius(4)
                    .padding(10)
            }
            .frame(maxHeight: 44, alignment: .leading)
        }
        .background(.white)
        .withBorder(cornerRadius: 8, borderColor: .GrayScale.gray400)
    }
}
