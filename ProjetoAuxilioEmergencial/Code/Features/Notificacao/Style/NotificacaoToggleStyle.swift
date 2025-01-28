//
//  NotificacaoToggleStyle.swift
//  ProjetoAuxilioEmergencial
//
//  Created by Roberto Edgar Geiss on 12/01/25.
//

import SwiftUI

struct NotificacaoToggleStyle: ToggleStyle {

    private let onStyle: AnyShapeStyle = AnyShapeStyle(.tint)
    private let offStyle: AnyShapeStyle = AnyShapeStyle(.gray)

    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn ? "largecircle.fill.circle" : "circle")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundStyle(configuration.isOn ? onStyle : offStyle)
                .onTapGesture {
                    configuration.isOn.toggle()
                }
            configuration.label
        }
    }
}

extension ToggleStyle where Self == NotificacaoToggleStyle {
    static var notificacao: NotificacaoToggleStyle {
        NotificacaoToggleStyle()
    }
}
