import logo from "./logo.svg";
import "./App.css";
const { ethers } = require("ethers");

function App() {
  async function loginCreateGroup() {
    const semaphoreAbi = ["function createGroup(uint256,uint256,address)"];
    const provider = new ethers.providers.Web3Provider(window.ethereum);
    let accounts = await provider.send("eth_requestAccounts", []);
    console.log(accounts);
    const signer = provider.getSigner();
    console.log(signer);
    let contractAddress = "0x220fBdB6F996827b1Cf12f0C181E8d5e6de3a36F";
    const semaphore = new ethers.Contract(
      contractAddress,
      semaphoreAbi,
      provider
    );
    const groupId = 25646546560;
    const admin = "0xCAFd22C8e7aD60e73cfB0bae740167C4eB1Bd62B";
    const semaphoreWithSigner = semaphore.connect(signer);
    const tx = semaphoreWithSigner.createGroup(
      groupId,
      20,
      admin
    );
  }

  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload.
        </p>
        <button
          sx={{ color: "#fff", textTransform: "none" }}
          onClick={loginCreateGroup}
        >
          {" "}
          Connect Wallet
        </button>
      </header>
    </div>
  );
}

export default App;
