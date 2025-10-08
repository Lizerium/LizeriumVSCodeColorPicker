/*
 * Author: Nikolay Dvurechensky
 * Site: https://sites.google.com/view/dvurechensky
 * Gmail: dvurechenskysoft@gmail.com
 * Last Updated: 08 октября 2025 06:53:11
 * Version: 1.0.48
 */

import * as vscode from 'vscode';

export function activate(context: vscode.ExtensionContext) {
    context.subscriptions.push(
        vscode.languages.registerColorProvider(
            { scheme: 'file', language: '*' },
            {
                provideDocumentColors(document: vscode.TextDocument) {
                    const colors: vscode.ColorInformation[] = [];
                    const regex = /color\s*=\s*(\d{1,3}),\s*(\d{1,3}),\s*(\d{1,3})/g;

                    for (let i = 0; i < document.lineCount; i++) {
                        const line = document.lineAt(i);
                        const match = regex.exec(line.text);
                        if (match) {
                            const r = Number(match[1]) / 255;
                            const g = Number(match[2]) / 255;
                            const b = Number(match[3]) / 255;

                            const startPos = line.range.start.translate(0, match.index);
                            const endPos = startPos.translate(0, match[0].length);
                            const range = new vscode.Range(startPos, endPos);

                            const color = new vscode.Color(r, g, b, 1);
                            colors.push(new vscode.ColorInformation(range, color));
                        }
                    }
                    return colors;
                },
                provideColorPresentations(color: vscode.Color, context: { document: vscode.TextDocument; range: vscode.Range }) {
                    // РџСЂРµРѕР±СЂР°Р·СѓРµРј С†РІРµС‚ РѕР±СЂР°С‚РЅРѕ РІ "color = R, G, B"
                    const r = Math.round(color.red * 255);
                    const g = Math.round(color.green * 255);
                    const b = Math.round(color.blue * 255);
                    const label = `color = ${r}, ${g}, ${b}`;
                    return [new vscode.ColorPresentation(label)];
                }
            }
        )
    );
}