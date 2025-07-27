//
//  RevenueCatView.swift
//  LetuSpeak
//
//  Created by Importants on 7/19/25.
//

import SwiftUI
import RevenueCat
import RevenueCatUI

struct PaywallView: View {
    init() {
        Purchases.configure(withAPIKey: "appl_fLXCXVqTgYpjdpmYooUoUqXjaNL")
    }
    var body: some View {
        VStack(spacing: 50) {
            TopHeaderView()

            BenefitListView()

            SubscriptionSection()
        }
        .edgesIgnoringSafeArea(.top)
        .background(Color(.white))
    }
}

struct TopHeaderView: View {
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea(edges: .top)
                .frame(height: 240)
            VStack(spacing: 12) {
                Text("영어, 이번엔\n트일 것이다")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

struct BenefitListView: View {
    var body: some View {
        VStack(spacing: 50) {
            BenefitItem(icon: "mic.circle.fill", title: "음성 인식 + 발음 교정 피드백 고도화", subtitle: "AI가 문장 단위로 발음 채점 + 단어별 문제 지적")
            BenefitItem(icon: "abc", title: "얼리 액세스", subtitle: "출시 예정인 새로운 서비스를 미리 경험 가능")
            BenefitItem(icon: "chart.bar.fill", title: "학습 리포트 + 성장 대시보드", subtitle: "주간/월간 학습 통계 (말한 문장 수, 정확도, 반복률 등)을 제공")
        }
        .padding()
        .background(Color.white)
    }
}

struct BenefitItem: View {
    let icon: String
    let title: String
    let subtitle: String

    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            Image(systemName: icon)
                .foregroundColor(.blue)
                .font(.system(size: 20))
                .frame(width: 25)

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 16))
                Text(subtitle)
                    .font(.system(size: 12))
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
    }
}

struct SubscriptionSection: View {
    @State private var customnerInfo: CustomerInfo?
    @State private var isPro: Bool = false
    
    var body: some View {
        VStack(spacing: 16) {
            
            Text(isPro ? "현재 나의 구독 여부: O" : "현재 나의 구독 여부: X")
                .font(.subheadline)
                .foregroundStyle(isPro ? .green : .red)

            Text("오직 ₩12,400/년 (₩1,200/월)")
                .font(.subheadline)
                .bold()

            Button(action: {
                purchase(productID: "coins_pack.ndcSample")
            }) {
                Text("결제하기")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(12)
            }
            .padding(.horizontal)

            Button("구독 확인하기") {
                checkSubStatus()
            }
            .font(.footnote)
            .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
    }
    
    func purchase(productID: String) {
        Task {
            do {
                let products: [StoreProduct] = await Purchases.shared.products([productID])
                guard let product = products.first else {
                    print("Product not found \(productID)")
                    return
                }
                let result = try await Purchases.shared.purchase(product: product)
                customnerInfo = result.customerInfo
                isPro = customnerInfo?.entitlements.active.contains(where: {
                    $0.value.isActive
                }) ?? false
            } catch {
                print("Failed to purchase \(error)")
            }
        }
    }
    
    func checkSubStatus() {
        Task {
            do {
                let info = try await Purchases.shared.customerInfo()
                isPro = info.entitlements.active.contains(where: {
                    $0.value.isActive
                })
            } catch {
                print("Failed to fetch customer info \(error)")
            }
        }
    }
}
