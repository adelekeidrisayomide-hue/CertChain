// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CertChain {
    struct Certificate {
        string studentName;
        string course;
        uint256 issuedAt;
    }

    mapping(string => Certificate) public certificates;

    function issueCertificate(
        string memory certId,
        string memory studentName,
        string memory course
    ) public {
        certificates[certId] = Certificate(
            studentName,
            course,
            block.timestamp
        );
    }

    function verifyCertificate(string memory certId)
        public
        view
        returns (
            string memory,
            string memory,
            uint256
        )
    {
        Certificate memory cert = certificates[certId];
        return (cert.studentName, cert.course, cert.issuedAt);
    }
}
