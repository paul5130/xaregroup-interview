//
//  SceneDelegate.swift
//  xaregroup.interview
//
//  Created by Paul Wen on 2023/5/13.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        let baseURL = URL(string: "https://shoes-collections.p.rapidapi.com")!
        let client: HTTPClient = URLSessionHTTPClient(session: URLSession(configuration: .ephemeral))
        let shoeService = ShoesServiceAPI(url: ShoesEndpoint.get().url(baseURL: baseURL), client: client)
        let homeViewModel = HomeViewModel(service: shoeService)
        let homeController = HomeController(viewModel: homeViewModel)
        let brandViewModel = BrandViewModel(service: shoeService)
        let brandController = BrandController(viewModel: brandViewModel)
        window?.rootViewController = MainController(homeController: homeController,brandController: brandController)
        window?.makeKeyAndVisible()
    }

}

