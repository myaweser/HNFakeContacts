//
//  MainViewController.swift
//  HNFakeContacts
//
//  Created by Nguyen Duc Hoang on 1/26/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import UIKit
import Contacts
import ContactsUI
import AddressBook
import AddressBookUI

class MainViewController: UIViewController {
    
    var lbltitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: UIFont.fontHelveticaNeue(), size: UIDevice.getFloatValue(iphone5: 19, iphone6: 19, iphone6P: 19, ipad: 22, ipadPro: 22))
        label.text = "Create Dummy Contacts for ios devices"
        label.numberOfLines = 3
        label.textColor = UIColor.appColor()
        label.textAlignment = .center
        return label
    }()
    
    var lblAuthor: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: UIFont.fontHelveticaNeue(), size: UIDevice.getFloatValue(iphone5: 16, iphone6: 16, iphone6P: 16, ipad: 22, ipadPro: 22))
        label.text = "Author: Nguyen Duc Hoang"
        label.textColor = UIColor.darkGray
        label.textAlignment = .left
        return label
    }()
    
    var lblSkype: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: UIFont.fontHelveticaNeue(), size: UIDevice.getFloatValue(iphone5: 16, iphone6: 16, iphone6P: 16, ipad: 22, ipadPro: 22))
        label.text = "Skype: sunlight3d@outlook.com"
        label.textColor = UIColor.darkGray
        label.textAlignment = .left
        return label
    }()
    
    var lblFacebook: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: UIFont.fontHelveticaNeue(), size: UIDevice.getFloatValue(iphone5: 16, iphone6: 16, iphone6P: 16, ipad: 22, ipadPro: 22))
        label.text = "FacebookID: nguyen.duc.hoang.bk"
        label.textColor = UIColor.darkGray
        label.textAlignment = .left
        return label
    }()
    
    
    let fetchRequest: CNContactFetchRequest = CNContactFetchRequest(keysToFetch: [
        CNContactGivenNameKey as CNKeyDescriptor,
        CNContactFamilyNameKey as CNKeyDescriptor,
        CNContactMiddleNameKey as CNKeyDescriptor,
        CNContactEmailAddressesKey as CNKeyDescriptor,
        CNContactPhoneNumbersKey as CNKeyDescriptor,
        CNContactFormatter.descriptorForRequiredKeys(for: .fullName)
        ])
    let store: CNContactStore = CNContactStore()
    
    lazy var btnClearContacts: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: UIFont.fontHelveticaNeue(), size: UIDevice.getFloatValue(iphone5: 17, iphone6: 17, iphone6P: 17, ipad: 22, ipadPro: 22))
        button.backgroundColor = UIColor.appColor()
        button.titleLabel?.textColor = UIColor.white
        button.tintColor = UIColor.clear
        button.titleLabel?.tintColor = UIColor.clear
        button.setTitle(String.multilanguage(inputString: "Clear Contacts"), for: .normal)
        button.titleLabel?.textAlignment = .center
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
        button.roundedAndBorder(radius: 10, borderWidth: 0, borderColor: UIColor.clear)
        button.addTarget(self, action: #selector(btnClearContacts(sender:)), for: .touchUpInside)
        button.contentVerticalAlignment = .fill
        return button
    }()
    
    lazy var btnAddContacts: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: UIFont.fontHelveticaNeue(), size: UIDevice.getFloatValue(iphone5: 17, iphone6: 17, iphone6P: 17, ipad: 22, ipadPro: 22))
        button.backgroundColor = UIColor.appColor()
        button.titleLabel?.textColor = UIColor.white
        button.tintColor = UIColor.clear
        button.titleLabel?.tintColor = UIColor.clear
        button.setTitle(String.multilanguage(inputString: "Add contacts"), for: .normal)
        button.titleLabel?.textAlignment = .center
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
        button.roundedAndBorder(radius: 10, borderWidth: 0, borderColor: UIColor.clear)
        button.addTarget(self, action: #selector(btnAddContacts(sender:)), for: .touchUpInside)
        button.contentVerticalAlignment = .fill
        return button
    }()
    
    lazy var btnShowContacts: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: UIFont.fontHelveticaNeue(), size: UIDevice.getFloatValue(iphone5: 17, iphone6: 17, iphone6P: 17, ipad: 22, ipadPro: 22))
        button.backgroundColor = UIColor.appPinkColor()
        button.titleLabel?.textColor = UIColor.white
        button.tintColor = UIColor.clear
        button.titleLabel?.tintColor = UIColor.clear
        button.setTitle(String.multilanguage(inputString: "Show contacts"), for: .normal)
        button.titleLabel?.textAlignment = .center
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
        button.roundedAndBorder(radius: 10, borderWidth: 0, borderColor: UIColor.clear)
        button.addTarget(self, action: #selector(btnShowContacts(sender:)), for: .touchUpInside)
        button.contentVerticalAlignment = .fill
        return button
    }()
    
    func btnClearContacts(sender: AnyObject) {
        let filePath = Bundle.main.path(forResource: "DummyVCard", ofType: "vcf")
        let myData = NSData(contentsOfFile: filePath!)
        do {
            let contacts = try CNContactVCardSerialization.contacts(with: myData as! Data)
            for contact in contacts {
                deleteContact(name: contact.familyName)
//                print("contact = %@", contact)
            }
        } catch {
            print("error get contact list")
        }
        
    }
    
    func queryAllContacts() {
        let contactStore = CNContactStore()
        var allContacts: [CNContact] = [CNContact]()
        let keysToFetch = [
            CNContactGivenNameKey as CNKeyDescriptor,
            CNContactFamilyNameKey as CNKeyDescriptor,
            CNContactMiddleNameKey as CNKeyDescriptor,
            CNContactEmailAddressesKey as CNKeyDescriptor,
            CNContactPhoneNumbersKey as CNKeyDescriptor,
            CNContactFormatter.descriptorForRequiredKeys(for: .fullName)
        ]
        var allContainers: [CNContainer] = []
        do {
            allContainers = try contactStore.containers(matching: nil)
        } catch {
            print("Error fetching containers")
        }
        
        for container in allContainers {
            let fetchPredicate = CNContact.predicateForContactsInContainer(withIdentifier: container.identifier)
            
            do {
                let containerResults = try contactStore.unifiedContacts(matching: fetchPredicate, keysToFetch: keysToFetch)
                allContacts.append(contentsOf: containerResults)
                var j = 0
                for eachContact in allContacts {
                    j = j + 1
                    print("Contact no \(j) : \(eachContact)")
                    
                }
            } catch {
                print("Error fetching results for container")
            }
        }
        
    }
    
    func deleteContact(name: String) {
        do {
            let predicate = CNContact.predicateForContacts(matchingName: name)
            let foundedContacts = try store.unifiedContacts(matching: predicate, keysToFetch: [
                CNContactGivenNameKey as CNKeyDescriptor,
                CNContactFamilyNameKey as CNKeyDescriptor,
                CNContactMiddleNameKey as CNKeyDescriptor,
                CNContactEmailAddressesKey as CNKeyDescriptor,
                CNContactPhoneNumbersKey as CNKeyDescriptor,
                CNContactFormatter.descriptorForRequiredKeys(for: .fullName)
                ])
            
            guard foundedContacts.count > 0, let selectedContact = foundedContacts.first else {
                print("Cannot find contact")
                return
            }
            
            let request = CNSaveRequest()
            let mutableContact = selectedContact.mutableCopy() as! CNMutableContact
            request.delete(mutableContact)
            try store.execute(request)
            
        } catch {
            print("Cannot delete contact")
            return
        }
    }
    func btnAddContacts(sender: AnyObject) {
        let filePath = Bundle.main.path(forResource: "DummyVCard", ofType: "vcf")
        let myData = NSData(contentsOfFile: filePath!)
        do {
            let contacts = try CNContactVCardSerialization.contacts(with: myData as! Data)
            var index = 0
            for contact in contacts {
                let request = CNSaveRequest()
                let mutableContact = contact.mutableCopy() as! CNMutableContact
                request.add(mutableContact, toContainerWithIdentifier: nil)
                try store.execute(request)
                index = index + 1
                print("index = ", index)
            }
            let alert = UIAlertController(title: "Information", message: "Updating \(contacts.count) finished !", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } catch {
            print("error get contact list")
        }
    }
    
    func btnShowContacts(sender: AnyObject) {
        queryAllContacts()
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = UIColor.white
        view.addSubview(lbltitle)
        lbltitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        lbltitle.rightAnchor.constraint(equalTo: view.leftAnchor, constant: -50).isActive = true
        lbltitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lbltitle.topAnchor.constraint(equalTo: view.topAnchor, constant: UIDevice.getFloatValue(iphone5: 50, iphone6: 50, iphone6P: 50, ipad: 70, ipadPro: 70)).isActive = true
        
        view.addSubview(btnClearContacts)
        btnClearContacts.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        btnClearContacts.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        btnClearContacts.widthAnchor.constraint(equalToConstant: 288).isActive = true
        btnClearContacts.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(btnAddContacts)
        btnAddContacts.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        btnAddContacts.widthAnchor.constraint(equalToConstant: 288).isActive = true
        btnAddContacts.heightAnchor.constraint(equalToConstant: 50).isActive = true
        btnAddContacts.topAnchor.constraint(equalTo: btnClearContacts.bottomAnchor, constant: 30).isActive = true
        navigationController?.isNavigationBarHidden = true
        
        view.addSubview(btnShowContacts)
        btnShowContacts.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        btnShowContacts.widthAnchor.constraint(equalToConstant: 288).isActive = true
        btnShowContacts.heightAnchor.constraint(equalToConstant: 50).isActive = true
        btnShowContacts.topAnchor.constraint(equalTo: btnAddContacts.bottomAnchor, constant: 40).isActive = true
        
        view.addSubview(lblAuthor)
        lblAuthor.leftAnchor.constraint(equalTo: view.leftAnchor, constant: UIDevice.getFloatValue(iphone5: 16, iphone6: 16, iphone6P: 16, ipad: 25, ipadPro: 25)).isActive = true
        lblAuthor.topAnchor.constraint(equalTo: lbltitle.bottomAnchor, constant: 30).isActive = true
        
        view.addSubview(lblSkype)
        lblSkype.leftAnchor.constraint(equalTo: lblAuthor.leftAnchor).isActive = true
        lblSkype.topAnchor.constraint(equalTo: lblAuthor.bottomAnchor, constant: 10).isActive = true
        
        view.addSubview(lblFacebook)
        lblFacebook.leftAnchor.constraint(equalTo: lblAuthor.leftAnchor).isActive = true
        lblFacebook.topAnchor.constraint(equalTo: lblSkype.bottomAnchor, constant: 10).isActive = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
